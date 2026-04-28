using UnityEngine;

/// <summary>
/// 오브젝트를 설정한 방향으로 왔다갔다 이동시키는 스크립트입니다.
/// 발판, 장애물 등에 붙여서 사용합니다.
/// </summary>
public class PlatformMover : MonoBehaviour
{
    public enum MoveDirection
    {
        Horizontal, // 좌우 이동
        Vertical    // 상하 이동
    }

    [Header("이동 설정")]
    [Tooltip("이동 방향입니다.")]
    public MoveDirection moveDirection = MoveDirection.Horizontal;

    [Tooltip("시작 위치에서 한쪽으로 이동하는 거리입니다.")]
    public float moveDistance = 2f;

    [Tooltip("이동 속도입니다.")]
    public float moveSpeed = 2f;

    [Header("시작 설정")]
    [Tooltip("시작 시 이동 사이클의 시작 지점(0~1)입니다. 여러 발판의 타이밍을 다르게 할 수 있습니다.")]
    [Range(0f, 1f)]
    public float startOffset = 0f;

    [Header("끝 지점 대기 설정")]
    [Tooltip("양쪽 끝에서 잠시 멈추는 기능을 사용할지 여부입니다.")]
    public bool enableEndPause = false;

    [Tooltip("양쪽 끝에 도달했을 때 멈추는 시간(초)입니다.")]
    public float endPauseTime = 1f;

    private Vector3 startPosition;
    private float progress;      // 0 ~ 1 (0 = 한쪽 끝, 1 = 반대쪽 끝)
    private int direction = 1;   // 1: 정방향, -1: 역방향
    private float pauseTimer;    // 대기 남은 시간
    private bool isPaused;       // 대기 중 여부

    void Start()
    {
        startPosition = transform.position;
        progress = startOffset;
    }

    void Update()
    {
        if (isPaused)
        {
            pauseTimer -= Time.deltaTime;
            if (pauseTimer <= 0f)
            {
                isPaused = false;
            }
            return; // 대기 중에는 이동하지 않음
        }

        // progress를 일정 속도로 증감 (0 ~ 1)
        float speed = moveSpeed / moveDistance; // moveDistance 단위당 속도 정규화
        progress += direction * speed * Time.deltaTime;

        // 끝에 도달하면 방향 반전
        if (progress >= 1f)
        {
            progress = 1f;
            direction = -1;
            if (enableEndPause)
            {
                isPaused = true;
                pauseTimer = endPauseTime;
            }
        }
        else if (progress <= 0f)
        {
            progress = 0f;
            direction = 1;
            if (enableEndPause)
            {
                isPaused = true;
                pauseTimer = endPauseTime;
            }
        }

        // progress(0~1)를 -0.5 ~ +0.5로 변환하여 시작 위치 중심으로 왕복
        float t = (progress - 0.5f) * moveDistance;

        Vector3 offset = Vector3.zero;
        switch (moveDirection)
        {
            case MoveDirection.Horizontal:
                offset = new Vector3(t, 0f, 0f);
                break;
            case MoveDirection.Vertical:
                offset = new Vector3(0f, t, 0f);
                break;
        }

        transform.position = startPosition + offset;
    }
}
