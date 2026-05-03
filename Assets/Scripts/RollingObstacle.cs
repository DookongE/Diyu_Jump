using UnityEngine;

/// <summary>
/// 굴러 떨어지는 장애물 스크립트입니다.
/// 위에서 떨어져 경사면을 따라 굴러가다가 벽(Wall 태그)에 부딪히면 사라집니다.
/// Devil_Wang 스프라이트를 사용하며, 플레이어와 충돌 시 넉백을 줍니다.
/// 
/// [사용법]
/// 1. 빈 오브젝트 생성 후 이 스크립트를 붙입니다.
/// 2. obstacleSprite에 Devil_Wang 스프라이트를 할당합니다.
/// 3. Rigidbody2D, CircleCollider2D가 자동으로 설정됩니다.
/// 4. 벽 오브젝트에 "Wall" 태그를 달아주세요.
/// 
/// [스포너와 함께 사용]
/// RollingObstacleSpawner 스크립트를 사용하면 주기적으로 자동 생성됩니다.
/// </summary>
public class RollingObstacle : MonoBehaviour
{
    [Header("스프라이트 설정")]
    [Tooltip("장애물 스프라이트 (Devil_Wang 등)")]
    public Sprite obstacleSprite;

    [Header("물리 설정")]
    [Tooltip("중력 배율입니다. 클수록 빨리 떨어집니다.")]
    public float gravityScale = 3f;

    [Tooltip("물리 재질의 마찰력입니다. 0이면 미끄럽게 굴러갑니다.")]
    public float friction = 0.2f;

    [Tooltip("물리 재질의 탄성입니다. 0이면 바운스 없음.")]
    public float bounciness = 0.1f;

    [Tooltip("공기 저항(Linear Drag). 높을수록 느려집니다.")]
    public float linearDrag = 0.5f;

    [Tooltip("회전 저항(Angular Drag).")]
    public float angularDrag = 0.5f;

    [Header("회전 설정")]
    [Tooltip("굴러갈 때 스프라이트를 회전시킬지 여부")]
    public bool enableRotation = true;

    [Header("넉백 설정")]
    [Tooltip("플레이어에게 주는 수평 넉백 힘")]
    public float knockbackForceX = 15f;

    [Tooltip("플레이어에게 주는 수직 넉백 힘")]
    public float knockbackForceY = 10f;

    [Header("초기 속도")]
    [Tooltip("생성 시 초기 수평 속도 (양수: 오른쪽, 음수: 왼쪽)")]
    public float initialVelocityX = 0f;

    [Tooltip("생성 시 초기 수직 속도 (음수: 아래로)")]
    public float initialVelocityY = 0f;

    [Header("파괴 설정")]
    [Tooltip("벽에 부딪혀서 파괴될 때 까지의 최소 속도. 이 이하로 느려지면 파괴.")]
    public float destroyBelowSpeed = 0f;

    [Tooltip("생성 후 이 시간(초)이 지나면 자동 파괴됩니다. 0이면 비활성화.")]
    public float autoDestroyTime = 15f;

    [Header("콜라이더 크기")]
    [Tooltip("CircleCollider2D 반지름 배율 (스프라이트 기준). 1 = 스프라이트 절반 크기.")]
    public float colliderRadiusScale = 0.4f;

    [Header("텔레포트 설정")]
    [Tooltip("플레이어 충돌 시 지정 위치로 강제 이동시키는 기능 ON/OFF")]
    public bool enableTeleport = false;

    [Tooltip("플레이어를 이동시킬 위치의 빈 오브젝트를 드래그하세요.")]
    public Transform teleportTarget;

    [Tooltip("텔레포트 후 플레이어 속도를 초기화할지 여부")]
    public bool resetVelocityOnTeleport = true;

    [Header("정렬 설정")]
    [Tooltip("정렬 레이어 이름")]
    public string sortingLayerName = "Default";

    [Tooltip("정렬 순서")]
    public int sortingOrder = 10;

    private Rigidbody2D rb;
    private SpriteRenderer spriteRenderer;
    private bool isDestroying = false;

    void Start()
    {
        SetupComponents();

        // 초기 속도 적용
        if (rb != null)
        {
            rb.velocity = new Vector2(initialVelocityX, initialVelocityY);
        }

        // 자동 파괴 타이머
        if (autoDestroyTime > 0f)
        {
            Destroy(gameObject, autoDestroyTime);
        }
    }

    /// <summary>
    /// 필요한 컴포넌트들을 자동으로 세팅합니다.
    /// </summary>
    void SetupComponents()
    {
        // SpriteRenderer 설정
        spriteRenderer = GetComponent<SpriteRenderer>();
        if (spriteRenderer == null)
        {
            spriteRenderer = gameObject.AddComponent<SpriteRenderer>();
        }
        if (obstacleSprite != null)
        {
            spriteRenderer.sprite = obstacleSprite;
        }
        spriteRenderer.sortingLayerName = sortingLayerName;
        spriteRenderer.sortingOrder = sortingOrder;

        // Rigidbody2D 설정
        rb = GetComponent<Rigidbody2D>();
        if (rb == null)
        {
            rb = gameObject.AddComponent<Rigidbody2D>();
        }
        rb.bodyType = RigidbodyType2D.Dynamic;
        rb.gravityScale = gravityScale;
        rb.drag = linearDrag;
        rb.angularDrag = angularDrag;
        rb.freezeRotation = !enableRotation;
        rb.collisionDetectionMode = CollisionDetectionMode2D.Continuous;

        // CircleCollider2D 설정 (둥근 콜라이더로 자연스러운 굴림)
        CircleCollider2D circleCol = GetComponent<CircleCollider2D>();
        if (circleCol == null)
        {
            circleCol = gameObject.AddComponent<CircleCollider2D>();
        }

        // 스프라이트 크기에 맞춰 콜라이더 반지름 설정
        if (spriteRenderer.sprite != null)
        {
            float spriteSize = Mathf.Min(
                spriteRenderer.sprite.bounds.size.x,
                spriteRenderer.sprite.bounds.size.y
            );
            circleCol.radius = spriteSize * colliderRadiusScale;
        }

        // 물리 재질 설정
        PhysicsMaterial2D mat = new PhysicsMaterial2D("RollingObstacleMat");
        mat.friction = friction;
        mat.bounciness = bounciness;
        circleCol.sharedMaterial = mat;

        // 태그 설정
        gameObject.tag = "Block";
    }

    void OnCollisionEnter2D(Collision2D collision)
    {
        if (isDestroying) return;

        // WallGenerator로 생성된 벽 타일과 충돌 시 파괴
        if (collision.gameObject.name.StartsWith("WallTile_"))
        {
            DestroyObstacle();
            return;
        }

        // 플레이어와 충돌 시 텔레포트 + 파괴
        if (collision.gameObject.CompareTag("Player"))
        {
            if (enableTeleport)
            {
                TeleportPlayer(collision.gameObject);
            }
            DestroyObstacle();
            return;
        }
    }

    /// <summary>
    /// 장애물 즉시 파괴
    /// </summary>
    void DestroyObstacle()
    {
        if (isDestroying) return;
        isDestroying = true;
        Destroy(gameObject);
    }

    /// <summary>
    /// 플레이어를 지정된 위치로 강제 이동시킵니다.
    /// </summary>
    void TeleportPlayer(GameObject player)
    {
        if (teleportTarget == null) return;
        player.transform.position = new Vector3(teleportTarget.position.x, teleportTarget.position.y, player.transform.position.z);

        if (resetVelocityOnTeleport)
        {
            Rigidbody2D playerRb = player.GetComponent<Rigidbody2D>();
            if (playerRb != null)
            {
                playerRb.velocity = Vector2.zero;
                playerRb.angularVelocity = 0f;
            }
        }
    }
}
