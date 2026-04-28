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

    private Vector3 startPosition;

    void Start()
    {
        startPosition = transform.position;
    }

    void Update()
    {
        // 사인파로 부드러운 왕복 운동
        float t = Mathf.Sin((Time.time * moveSpeed) + (startOffset * Mathf.PI * 2f));

        Vector3 offset = Vector3.zero;

        switch (moveDirection)
        {
            case MoveDirection.Horizontal:
                offset = new Vector3(t * moveDistance, 0f, 0f);
                break;
            case MoveDirection.Vertical:
                offset = new Vector3(0f, t * moveDistance, 0f);
                break;
        }

        transform.position = startPosition + offset;
    }
}
