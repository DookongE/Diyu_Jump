using UnityEngine;
using UnityEngine.UI;
using System.Collections;

/// <summary>
/// 대화창 UI를 관리하는 매니저 스크립트입니다.
/// 씬에 하나만 존재해야 합니다.
/// 
/// [세팅 방법]
/// 1. 빈 오브젝트에 이 스크립트를 붙입니다.
/// 2. dialogueBoxSprite에 DialogueBox.png 스프라이트를 할당합니다.
/// 3. dialogueFont에 원하는 폰트를 할당합니다. (비워두면 기본 폰트)
/// 4. Canvas, Panel, Text가 자동으로 생성됩니다!
/// </summary>
public class DialogueUI : MonoBehaviour
{
    public static DialogueUI Instance { get; private set; }

    [Header("대화창 스프라이트")]
    [Tooltip("대화창 배경 이미지 (DialogueBox.png 스프라이트를 드래그하세요)")]
    public Sprite dialogueBoxSprite;

    [Header("타이핑 설정")]
    [Tooltip("글자 하나가 나타나는 간격(초)")]
    public float typingSpeed = 0.05f;

    [Tooltip("타이핑 중 Z키를 누르면 전체 텍스트를 즉시 표시할지 여부")]
    public bool allowSkipTyping = true;

    [Header("폰트 설정")]
    [Tooltip("대화 텍스트에 사용할 폰트. 비워두면 기본 폰트 사용.")]
    public Font dialogueFont;

    [Tooltip("폰트 크기")]
    public int fontSize = 36;

    [Tooltip("텍스트 색상")]
    public Color textColor = new Color(0.2f, 0.15f, 0.1f, 1f);

    [Header("대화창 위치/크기")]
    [Tooltip("화면 하단에서의 Y 오프셋")]
    public float boxYOffset = 30f;

    [Tooltip("화면 너비 대비 대화창 너비 비율 (0~1)")]
    [Range(0.5f, 1f)]
    public float boxWidthRatio = 0.85f;

    [Tooltip("대화창 높이 (픽셀)")]
    public float boxHeight = 160f;

    [Header("텍스트 패딩")]
    [Tooltip("대화창 내부 텍스트 여백 (좌, 우, 상, 하)")]
    public RectOffset textPadding = new RectOffset(40, 40, 25, 25);

    [Header("입력 설정")]
    [Tooltip("대화 진행/종료 키")]
    public KeyCode interactKey = KeyCode.Z;

    /// <summary>현재 대화가 진행 중인지 여부</summary>
    public bool IsDialogueActive { get; private set; }

    private GameObject canvasObj;
    private GameObject dialoguePanel;
    private Text dialogueText;
    private string[] currentLines;
    private int currentLineIndex;
    private Coroutine typingCoroutine;
    private bool isTyping;
    private string fullCurrentLine;

    void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }
        Instance = this;
    }

    void Start()
    {
        CreateDialogueUI();
    }

    void Update()
    {
        if (!IsDialogueActive) return;

        if (Input.GetKeyDown(interactKey))
        {
            if (isTyping && allowSkipTyping)
            {
                CompleteTyping();
            }
            else if (!isTyping)
            {
                ShowNextLine();
            }
        }
    }

    /// <summary>
    /// 대화창 UI를 코드로 자동 생성합니다.
    /// </summary>
    void CreateDialogueUI()
    {
        // Canvas 생성
        canvasObj = new GameObject("DialogueCanvas");
        Canvas canvas = canvasObj.AddComponent<Canvas>();
        canvas.renderMode = RenderMode.ScreenSpaceOverlay;
        canvas.sortingOrder = 100;

        CanvasScaler scaler = canvasObj.AddComponent<CanvasScaler>();
        scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
        scaler.referenceResolution = new Vector2(1920, 1080);
        scaler.matchWidthOrHeight = 0.5f;

        canvasObj.AddComponent<GraphicRaycaster>();

        // 대화창 패널 (배경 이미지)
        dialoguePanel = new GameObject("DialoguePanel");
        dialoguePanel.transform.SetParent(canvasObj.transform, false);

        Image panelImage = dialoguePanel.AddComponent<Image>();
        if (dialogueBoxSprite != null)
        {
            panelImage.sprite = dialogueBoxSprite;
            panelImage.type = Image.Type.Sliced;
            panelImage.preserveAspect = true;
        }
        else
        {
            panelImage.color = new Color(0.95f, 0.9f, 0.8f, 0.95f);
        }

        // 대화창 위치/크기 설정 (하단 중앙)
        RectTransform panelRect = dialoguePanel.GetComponent<RectTransform>();
        panelRect.anchorMin = new Vector2(0.5f, 0f);
        panelRect.anchorMax = new Vector2(0.5f, 0f);
        panelRect.pivot = new Vector2(0.5f, 0f);
        panelRect.anchoredPosition = new Vector2(0f, boxYOffset);
        panelRect.sizeDelta = new Vector2(1920f * boxWidthRatio, boxHeight);

        // 텍스트 오브젝트
        GameObject textObj = new GameObject("DialogueText");
        textObj.transform.SetParent(dialoguePanel.transform, false);

        dialogueText = textObj.AddComponent<Text>();
        dialogueText.text = "";
        dialogueText.color = textColor;
        dialogueText.fontSize = fontSize;
        dialogueText.alignment = TextAnchor.MiddleLeft;
        dialogueText.horizontalOverflow = HorizontalWrapMode.Wrap;
        dialogueText.verticalOverflow = VerticalWrapMode.Overflow;
        dialogueText.lineSpacing = 1.2f;

        // 폰트 적용
        if (dialogueFont != null)
        {
            dialogueText.font = dialogueFont;
        }
        else
        {
            dialogueText.font = Resources.GetBuiltinResource<Font>("LegacyRuntime.ttf");
        }

        // 텍스트 영역 (패딩 적용)
        RectTransform textRect = textObj.GetComponent<RectTransform>();
        textRect.anchorMin = Vector2.zero;
        textRect.anchorMax = Vector2.one;
        textRect.offsetMin = new Vector2(textPadding.left, textPadding.bottom);
        textRect.offsetMax = new Vector2(-textPadding.right, -textPadding.top);

        // 대화 진행 표시 화살표 (▼)
        GameObject arrowObj = new GameObject("NextArrow");
        arrowObj.transform.SetParent(dialoguePanel.transform, false);

        Text arrowText = arrowObj.AddComponent<Text>();
        arrowText.text = "▼";
        arrowText.fontSize = 20;
        arrowText.color = textColor;
        arrowText.alignment = TextAnchor.MiddleCenter;

        if (dialogueFont != null)
            arrowText.font = dialogueFont;
        else
            arrowText.font = Resources.GetBuiltinResource<Font>("LegacyRuntime.ttf");

        RectTransform arrowRect = arrowObj.GetComponent<RectTransform>();
        arrowRect.anchorMin = new Vector2(1f, 0f);
        arrowRect.anchorMax = new Vector2(1f, 0f);
        arrowRect.pivot = new Vector2(1f, 0f);
        arrowRect.anchoredPosition = new Vector2(-20f, 10f);
        arrowRect.sizeDelta = new Vector2(30f, 30f);

        // 시작 시 숨기기
        dialoguePanel.SetActive(false);
    }

    /// <summary>
    /// 대화를 시작합니다.
    /// </summary>
    public void StartDialogue(string[] lines)
    {
        if (lines == null || lines.Length == 0) return;
        if (IsDialogueActive) return;

        currentLines = lines;
        currentLineIndex = 0;
        IsDialogueActive = true;

        if (dialoguePanel != null)
        {
            dialoguePanel.SetActive(true);
        }

        DisplayLine(currentLines[currentLineIndex]);
    }

    void ShowNextLine()
    {
        currentLineIndex++;

        if (currentLineIndex < currentLines.Length)
        {
            DisplayLine(currentLines[currentLineIndex]);
        }
        else
        {
            EndDialogue();
        }
    }

    void DisplayLine(string line)
    {
        fullCurrentLine = line;

        if (typingCoroutine != null)
        {
            StopCoroutine(typingCoroutine);
        }

        typingCoroutine = StartCoroutine(TypeLine(line));
    }

    IEnumerator TypeLine(string line)
    {
        isTyping = true;
        dialogueText.text = "";

        foreach (char c in line)
        {
            dialogueText.text += c;
            yield return new WaitForSeconds(typingSpeed);
        }

        isTyping = false;
    }

    void CompleteTyping()
    {
        if (typingCoroutine != null)
        {
            StopCoroutine(typingCoroutine);
        }

        dialogueText.text = fullCurrentLine;
        isTyping = false;
    }

    void EndDialogue()
    {
        IsDialogueActive = false;

        if (typingCoroutine != null)
        {
            StopCoroutine(typingCoroutine);
        }

        isTyping = false;

        if (dialoguePanel != null)
        {
            dialoguePanel.SetActive(false);
        }

        if (dialogueText != null)
        {
            dialogueText.text = "";
        }
    }
}
