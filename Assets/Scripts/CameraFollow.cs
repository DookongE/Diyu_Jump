using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    [Tooltip("따라갈 대상(플레이어)입니다.")]
    public Transform target;

    [Header("맵 경계 오브젝트")]
    [Tooltip("왼쪽 벽 오브젝트입니다. 카메라가 이 벽 왼쪽을 보여주지 않습니다.")]
    public Transform leftWall;
    [Tooltip("오른쪽 벽 오브젝트입니다. 카메라가 이 벽 오른쪽을 보여주지 않습니다.")]
    public Transform rightWall;
    [Tooltip("땅 오브젝트입니다. 카메라가 이 땅 아래쪽을 보여주지 않습니다.")]
    public Transform ground;

    [Header("경계 오프셋")]
    [Tooltip("벽/땅의 안쪽 가장자리를 기준으로 카메라 경계를 조정합니다.")]
    public float wallInnerOffset = 0f;
    [Tooltip("땅의 위쪽 가장자리를 기준으로 카메라 하단 경계를 조정합니다.")]
    public float groundTopOffset = 0f;

    private Camera cam;

    void Start()
    {
        cam = GetComponent<Camera>();
    }

    void LateUpdate()
    {
        if (target == null || cam == null) return;

        // 1. 먼저 플레이어 위치로 카메라 이동
        Vector3 newPos = new Vector3(target.position.x, target.position.y, transform.position.z);

        // 2. 카메라 뷰포트의 반 크기 계산 (월드 단위)
        float camHalfHeight = cam.orthographicSize;
        float camHalfWidth = camHalfHeight * cam.aspect;

        // 3. 경계 클램프 적용
        // 왼쪽 벽: 카메라 왼쪽 끝이 벽의 왼쪽(바깥) 가장자리보다 왼쪽으로 가지 않도록
        // → 벽이 화면 왼쪽 가장자리에 보임
        if (leftWall != null)
        {
            float leftBound = GetLeftEdge(leftWall) + wallInnerOffset;
            float minX = leftBound + camHalfWidth;
            if (newPos.x < minX)
                newPos.x = minX;
        }

        // 오른쪽 벽: 카메라 오른쪽 끝이 벽의 오른쪽(바깥) 가장자리보다 오른쪽으로 가지 않도록
        // → 벽이 화면 오른쪽 가장자리에 보임
        if (rightWall != null)
        {
            float rightBound = GetRightEdge(rightWall) - wallInnerOffset;
            float maxX = rightBound - camHalfWidth;
            if (newPos.x > maxX)
                newPos.x = maxX;
        }

        // 땅: 카메라 아래쪽 끝이 땅의 아래쪽(바깥) 가장자리보다 아래로 가지 않도록
        // → 땅이 화면 하단 가장자리에 보임
        if (ground != null)
        {
            float groundBottom = GetBottomEdge(ground) + groundTopOffset;
            float minY = groundBottom + camHalfHeight;
            if (newPos.y < minY)
                newPos.y = minY;
        }

        transform.position = newPos;
    }

    /// <summary>오브젝트의 SpriteRenderer 또는 Collider 기준 오른쪽 가장자리 X좌표</summary>
    float GetRightEdge(Transform obj)
    {
        SpriteRenderer sr = obj.GetComponentInChildren<SpriteRenderer>();
        if (sr != null)
            return sr.bounds.max.x;

        Collider2D col = obj.GetComponentInChildren<Collider2D>();
        if (col != null)
            return col.bounds.max.x;

        return obj.position.x;
    }

    /// <summary>오브젝트의 SpriteRenderer 또는 Collider 기준 왼쪽 가장자리 X좌표</summary>
    float GetLeftEdge(Transform obj)
    {
        SpriteRenderer sr = obj.GetComponentInChildren<SpriteRenderer>();
        if (sr != null)
            return sr.bounds.min.x;

        Collider2D col = obj.GetComponentInChildren<Collider2D>();
        if (col != null)
            return col.bounds.min.x;

        return obj.position.x;
    }

    /// <summary>오브젝트의 SpriteRenderer 또는 Collider 기준 윗면 Y좌표</summary>
    float GetTopEdge(Transform obj)
    {
        SpriteRenderer sr = obj.GetComponentInChildren<SpriteRenderer>();
        if (sr != null)
            return sr.bounds.max.y;

        Collider2D col = obj.GetComponentInChildren<Collider2D>();
        if (col != null)
            return col.bounds.max.y;

        return obj.position.y;
    }

    /// <summary>오브젝트의 SpriteRenderer 또는 Collider 기준 아랫면 Y좌표</summary>
    float GetBottomEdge(Transform obj)
    {
        SpriteRenderer sr = obj.GetComponentInChildren<SpriteRenderer>();
        if (sr != null)
            return sr.bounds.min.y;

        Collider2D col = obj.GetComponentInChildren<Collider2D>();
        if (col != null)
            return col.bounds.min.y;

        return obj.position.y;
    }
}
