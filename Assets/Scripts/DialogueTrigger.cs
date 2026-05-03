using UnityEngine;

/// <summary>
/// 대화 가능한 오브젝트에 붙이는 스크립트입니다.
/// 플레이어가 가까이 다가가서 Z키를 누르면 대화가 시작됩니다.
/// 
/// [사용법]
/// 1. 대화할 오브젝트에 이 스크립트를 추가합니다.
/// 2. dialogueLines 배열에 대화 텍스트를 적습니다.
///    - 배열의 각 항목이 한 줄의 대화입니다.
///    - Z키를 누를 때마다 다음 줄로 넘어갑니다.
/// 3. 오브젝트에 Collider2D가 있어야 합니다 (IsTrigger 체크).
/// 4. 플레이어에 "Player" 태그가 있어야 합니다.
/// </summary>
public class DialogueTrigger : MonoBehaviour
{
    [Header("대화 내용")]
    [Tooltip("대화 텍스트 목록입니다. 각 항목이 한 줄의 대화입니다.")]
    [TextArea(2, 5)]
    public string[] dialogueLines;

    [Header("상호작용 설정")]
    [Tooltip("상호작용 키")]
    public KeyCode interactKey = KeyCode.Z;

    [Tooltip("플레이어 태그")]
    public string playerTag = "Player";

    [Header("트리거 설정")]
    [Tooltip("자동으로 Trigger용 콜라이더를 추가할지 여부")]
    public bool autoAddTrigger = true;

    [Tooltip("트리거 감지 범위 (반지름)")]
    public float triggerRadius = 2f;

    private bool playerInRange = false;

    void Start()
    {
        // 자동 트리거 콜라이더 추가
        if (autoAddTrigger)
        {
            // 기존 Trigger 콜라이더가 없으면 추가
            CircleCollider2D existingTrigger = null;
            foreach (CircleCollider2D col in GetComponents<CircleCollider2D>())
            {
                if (col.isTrigger)
                {
                    existingTrigger = col;
                    break;
                }
            }

            if (existingTrigger == null)
            {
                CircleCollider2D triggerCol = gameObject.AddComponent<CircleCollider2D>();
                triggerCol.isTrigger = true;
                triggerCol.radius = triggerRadius;
            }
        }
    }

    void Update()
    {
        // 플레이어가 범위 안에 있고, Z키를 누르면 대화 시작
        if (playerInRange && Input.GetKeyDown(interactKey))
        {
            // 이미 대화 중이면 무시 (DialogueUI에서 처리)
            if (DialogueUI.Instance != null && !DialogueUI.Instance.IsDialogueActive)
            {
                if (dialogueLines != null && dialogueLines.Length > 0)
                {
                    DialogueUI.Instance.StartDialogue(dialogueLines);
                }
            }
        }
    }

    void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag(playerTag))
        {
            playerInRange = true;
        }
    }

    void OnTriggerExit2D(Collider2D other)
    {
        if (other.CompareTag(playerTag))
        {
            playerInRange = false;
        }
    }

    /// <summary>
    /// 에디터에서 트리거 범위를 시각적으로 확인하기 위한 기즈모
    /// </summary>
    void OnDrawGizmosSelected()
    {
        Gizmos.color = new Color(0f, 0.8f, 1f, 0.3f);
        Gizmos.DrawWireSphere(transform.position, triggerRadius);
    }
}
