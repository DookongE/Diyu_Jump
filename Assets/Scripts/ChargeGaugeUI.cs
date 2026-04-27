using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// 점프 충전 게이지 바 UI입니다.
/// 스페이스바를 누르고 있으면 게이지가 차오르고, 놓으면 사라집니다.
/// 이 스크립트를 아무 오브젝트에 붙이면 자동으로 Canvas와 게이지 UI를 생성합니다.
/// </summary>
public class ChargeGaugeUI : MonoBehaviour
{
    [Header("연결")]
    [Tooltip("플레이어 컨트롤러 (자동 탐색됨)")]
    public PlayerController player;

    [Header("게이지 위치/크기")]
    [Tooltip("캐릭터 머리 위 오프셋 (월드 좌표)")]
    public Vector2 offset = new Vector2(0f, 2.5f);
    [Tooltip("게이지 바 너비 (픽셀)")]
    public float barWidth = 80f;
    [Tooltip("게이지 바 높이 (픽셀)")]
    public float barHeight = 12f;

    [Header("색상")]
    [Tooltip("게이지 배경색")]
    public Color backgroundColor = new Color(0.15f, 0.15f, 0.25f, 0.7f);
    [Tooltip("게이지 충전 시작색 (낮은 충전)")]
    public Color chargeColorMin = new Color(0.55f, 0.78f, 1f, 1f); // 하늘색
    [Tooltip("게이지 충전 끝색 (높은 충전)")]
    public Color chargeColorMax = new Color(1f, 0.45f, 0.55f, 1f); // 분홍색
    [Tooltip("게이지 테두리색")]
    public Color borderColor = new Color(0.2f, 0.15f, 0.35f, 0.9f);

    [Header("흔들림 효과")]
    [Tooltip("게이지가 가득 찬 후 흔들리기 시작하는 시간(초)")]
    public float shakeDelay = 0.5f;
    [Tooltip("흔들림 강도 (픽셀)")]
    public float shakeIntensity = 3f;
    [Tooltip("흔들림 속도")]
    public float shakeSpeed = 30f;

    [Header("당근 이미지")]
    [Tooltip("게이지 뒤에 표시할 당근 스프라이트 (Inspector에서 할당)")]
    public Sprite carrotSprite;
    [Tooltip("당근 이미지 크기 (픽셀)")]
    public Vector2 carrotSize = new Vector2(60f, 40f);
    [Tooltip("당근 이미지 오프셋 (게이지 중심 기준, 픽셀)")]
    public Vector2 carrotOffset = new Vector2(0f, 0f);

    private Canvas canvas;
    private RectTransform canvasRect;
    private GameObject gaugeRoot;
    private Image backgroundImage;
    private Image fillImage;
    private Image borderImage;
    private Image carrotImage;
    private Camera mainCam;
    private float fullChargeTimer; // 게이지가 가득 찬 채로 유지된 시간

    void Start()
    {
        mainCam = Camera.main;

        // 플레이어 자동 탐색
        if (player == null)
        {
            player = FindObjectOfType<PlayerController>();
        }

        CreateGaugeUI();
        gaugeRoot.SetActive(false);
    }

    void Update()
    {
        if (player == null) return;

        if (player.IsCharging)
        {
            gaugeRoot.SetActive(true);

            float ratio = player.ChargeRatio;
            UpdateGaugeFill(ratio);

            // 가득 찬 상태 타이머 추적
            if (ratio >= 0.99f)
            {
                fullChargeTimer += Time.deltaTime;
            }
            else
            {
                fullChargeTimer = 0f;
            }

            // 흔들림 오프셋 계산
            Vector2 shakeOffset = Vector2.zero;
            if (fullChargeTimer >= shakeDelay)
            {
                float t = Time.time * shakeSpeed;
                shakeOffset.x = Mathf.Sin(t) * shakeIntensity;
                shakeOffset.y = Mathf.Cos(t * 1.3f) * shakeIntensity * 0.7f;
            }

            UpdateGaugePosition(shakeOffset);
        }
        else
        {
            gaugeRoot.SetActive(false);
            fullChargeTimer = 0f;
        }
    }

    /// <summary>
    /// 게이지 UI를 코드로 생성합니다.
    /// </summary>
    void CreateGaugeUI()
    {
        // Screen Space - Overlay Canvas 생성
        GameObject canvasObj = new GameObject("ChargeGauge_Canvas");
        canvas = canvasObj.AddComponent<Canvas>();
        canvas.renderMode = RenderMode.ScreenSpaceOverlay;
        canvas.sortingOrder = 100;
        canvasObj.AddComponent<CanvasScaler>();
        canvasObj.AddComponent<GraphicRaycaster>();
        canvasRect = canvas.GetComponent<RectTransform>();

        // 게이지 루트
        gaugeRoot = new GameObject("GaugeRoot");
        gaugeRoot.transform.SetParent(canvasObj.transform, false);
        RectTransform rootRect = gaugeRoot.AddComponent<RectTransform>();
        rootRect.sizeDelta = new Vector2(barWidth + 4, barHeight + 4);

        // 당근 이미지 (게이지 뒤에 배치, 가장 먼저 생성해야 뒤에 그려짐)
        if (carrotSprite != null)
        {
            GameObject carrotObj = new GameObject("CarrotIcon");
            carrotObj.transform.SetParent(gaugeRoot.transform, false);
            carrotImage = carrotObj.AddComponent<Image>();
            carrotImage.sprite = carrotSprite;
            carrotImage.preserveAspect = true;
            RectTransform carrotRect = carrotObj.GetComponent<RectTransform>();
            carrotRect.anchorMin = new Vector2(0.5f, 0.5f);
            carrotRect.anchorMax = new Vector2(0.5f, 0.5f);
            carrotRect.sizeDelta = carrotSize;
            carrotRect.anchoredPosition = carrotOffset;
        }

        // 테두리 (배경보다 약간 큰 사각형)
        GameObject borderObj = new GameObject("Border");
        borderObj.transform.SetParent(gaugeRoot.transform, false);
        borderImage = borderObj.AddComponent<Image>();
        borderImage.color = borderColor;
        RectTransform borderRect = borderObj.GetComponent<RectTransform>();
        borderRect.anchorMin = new Vector2(0.5f, 0.5f);
        borderRect.anchorMax = new Vector2(0.5f, 0.5f);
        borderRect.sizeDelta = new Vector2(barWidth + 4, barHeight + 4);
        borderRect.anchoredPosition = Vector2.zero;

        // 배경
        GameObject bgObj = new GameObject("Background");
        bgObj.transform.SetParent(gaugeRoot.transform, false);
        backgroundImage = bgObj.AddComponent<Image>();
        backgroundImage.color = backgroundColor;
        RectTransform bgRect = bgObj.GetComponent<RectTransform>();
        bgRect.anchorMin = new Vector2(0.5f, 0.5f);
        bgRect.anchorMax = new Vector2(0.5f, 0.5f);
        bgRect.sizeDelta = new Vector2(barWidth, barHeight);
        bgRect.anchoredPosition = Vector2.zero;

        // 채우기 바
        GameObject fillObj = new GameObject("Fill");
        fillObj.transform.SetParent(gaugeRoot.transform, false);
        fillImage = fillObj.AddComponent<Image>();
        fillImage.color = chargeColorMin;
        RectTransform fillRect = fillObj.GetComponent<RectTransform>();
        // 왼쪽 정렬 (왼쪽에서 오른쪽으로 차오르기)
        fillRect.anchorMin = new Vector2(0.5f, 0.5f);
        fillRect.anchorMax = new Vector2(0.5f, 0.5f);
        fillRect.pivot = new Vector2(0f, 0.5f);
        fillRect.sizeDelta = new Vector2(0, barHeight - 2);
        fillRect.anchoredPosition = new Vector2(-barWidth / 2f + 1, 0);
    }

    /// <summary>
    /// 게이지 위치를 캐릭터 머리 위에 고정합니다.
    /// </summary>
    void UpdateGaugePosition(Vector2 shakeOffset)
    {
        if (player == null || mainCam == null) return;

        // 캐릭터 월드 위치 + 오프셋 → 스크린 좌표
        Vector3 worldPos = player.transform.position + (Vector3)offset;
        Vector3 screenPos = mainCam.WorldToScreenPoint(worldPos);

        // 흔들림 적용
        screenPos.x += shakeOffset.x;
        screenPos.y += shakeOffset.y;

        gaugeRoot.GetComponent<RectTransform>().position = screenPos;
    }

    /// <summary>
    /// 충전 비율에 따라 게이지를 채웁니다.
    /// </summary>
    void UpdateGaugeFill(float ratio)
    {
        ratio = Mathf.Clamp01(ratio);

        // 채우기 바 너비 조절
        RectTransform fillRect = fillImage.GetComponent<RectTransform>();
        float maxFillWidth = barWidth - 2;
        fillRect.sizeDelta = new Vector2(maxFillWidth * ratio, barHeight - 2);

        // 색상 그라데이션 (낮은 충전 → 높은 충전)
        fillImage.color = Color.Lerp(chargeColorMin, chargeColorMax, ratio);
    }
}
