using UnityEngine;

/// <summary>
/// 블록이 일정 시간 켜져 있다가 꺼지고, 다시 켜지는 것을 반복하는 스크립트입니다.
/// </summary>
public class ToggleBlock : MonoBehaviour
{
    [Header("타이머 설정")]
    [Tooltip("블록이 켜져 있는 시간(초)")]
    public float onDuration = 3f;

    [Tooltip("블록이 꺼져 있는 시간(초)")]
    public float offDuration = 2f;

    [Header("시작 설정")]
    [Tooltip("시작할 때 켜진 상태로 시작할지 여부")]
    public bool startOn = true;

    [Tooltip("시작 시 타이머 오프셋(초). 여러 블록의 타이밍을 어긋나게 할 수 있습니다.")]
    public float startDelay = 0f;

    [Header("꺼짐 시 투명도")]
    [Tooltip("꺼져 있을 때 스프라이트 투명도 (0: 완전 투명, 1: 불투명)")]
    [Range(0f, 1f)]
    public float offAlpha = 0.3f;

    private float timer;
    private bool isOn;
    private Collider2D blockCollider;
    private SpriteRenderer spriteRenderer;

    void Start()
    {
        blockCollider = GetComponent<Collider2D>();
        spriteRenderer = GetComponent<SpriteRenderer>();

        isOn = startOn;
        timer = startDelay + (isOn ? onDuration : offDuration);

        ApplyState();
    }

    void Update()
    {
        timer -= Time.deltaTime;

        if (timer <= 0f)
        {
            isOn = !isOn;
            timer = isOn ? onDuration : offDuration;
            ApplyState();
        }
    }

    void ApplyState()
    {
        // 콜라이더 켜기/끄기
        if (blockCollider != null)
        {
            blockCollider.enabled = isOn;
        }

        // 스프라이트 투명도 변경
        if (spriteRenderer != null)
        {
            Color c = spriteRenderer.color;
            c.a = isOn ? 1f : offAlpha;
            spriteRenderer.color = c;
        }
    }
}
