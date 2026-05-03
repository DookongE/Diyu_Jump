using UnityEngine;

/// <summary>
/// 굴러 떨어지는 장애물(RollingObstacle)을 주기적으로 생성하는 스포너입니다.
/// 
/// [사용법]
/// 1. 빈 오브젝트를 장애물을 생성할 위치(높은 곳)에 배치합니다.
/// 2. 이 스크립트를 붙이고, obstacleSprite에 Devil_Wang 스프라이트를 할당합니다.
/// 3. spawnInterval로 생성 주기를 조절합니다.
/// 4. initialVelocityX/Y로 생성 직후 초기 이동 방향을 설정합니다.
/// 
/// [벽 태그 설정 필수]
/// 장애물이 부딪혀서 사라질 벽 오브젝트에 "Wall" 태그를 설정해주세요.
/// 또는 WallGenerator로 생성된 "WallTile_" 오브젝트와 충돌해도 사라집니다.
/// </summary>
public class RollingObstacleSpawner : MonoBehaviour
{
    [Header("스프라이트")]
    [Tooltip("생성할 장애물의 스프라이트 (Devil_Wang 등)")]
    public Sprite obstacleSprite;

    [Header("스폰 설정")]
    [Tooltip("장애물 생성 주기(초)")]
    public float spawnInterval = 3f;

    [Tooltip("첫 생성까지의 대기 시간(초)")]
    public float initialDelay = 1f;

    [Tooltip("동시에 존재할 수 있는 최대 장애물 수")]
    public int maxObstacles = 5;

    [Header("스폰 위치 랜덤")]
    [Tooltip("스폰 위치의 X축 랜덤 범위 (±)")]
    public float spawnRandomX = 0f;

    [Tooltip("스폰 위치의 Y축 랜덤 범위 (±)")]
    public float spawnRandomY = 0f;

    [Header("장애물 설정 - 물리")]
    [Tooltip("중력 배율")]
    public float gravityScale = 3f;

    [Tooltip("마찰력")]
    public float friction = 0.2f;

    [Tooltip("탄성")]
    public float bounciness = 0.1f;

    [Tooltip("공기 저항")]
    public float linearDrag = 0.5f;

    [Tooltip("회전 저항")]
    public float angularDrag = 0.5f;

    [Header("장애물 설정 - 초기 속도")]
    [Tooltip("생성 시 초기 수평 속도")]
    public float initialVelocityX = 0f;

    [Tooltip("생성 시 초기 수직 속도")]
    public float initialVelocityY = 0f;

    [Header("장애물 설정 - 크기")]
    [Tooltip("장애물 스케일")]
    public float obstacleScale = 0.3f;

    [Header("장애물 설정 - 넉백")]
    [Tooltip("플레이어에게 주는 수평 넉백 힘")]
    public float knockbackForceX = 15f;

    [Tooltip("플레이어에게 주는 수직 넉백 힘")]
    public float knockbackForceY = 10f;

    [Header("장애물 설정 - 회전")]
    [Tooltip("굴러갈 때 스프라이트 회전 여부")]
    public bool enableRotation = true;

    [Header("장애물 설정 - 자동 파괴")]
    [Tooltip("자동 파괴 시간(초). 0이면 비활성화.")]
    public float autoDestroyTime = 15f;

    [Header("장애물 설정 - 텔레포트")]
    [Tooltip("플레이어 충돌 시 지정 위치로 강제 이동시키는 기능 ON/OFF")]
    public bool enableTeleport = false;

    [Tooltip("플레이어를 이동시킬 위치의 빈 오브젝트를 드래그하세요.")]
    public Transform teleportTarget;

    [Tooltip("텔레포트 후 속도 초기화 여부")]
    public bool resetVelocityOnTeleport = true;

    private float spawnTimer;
    private int currentObstacleCount = 0;

    void Start()
    {
        spawnTimer = initialDelay;
    }

    void Update()
    {
        spawnTimer -= Time.deltaTime;
        if (spawnTimer <= 0f)
        {
            spawnTimer = spawnInterval;
            TrySpawnObstacle();
        }
    }

    void TrySpawnObstacle()
    {
        // 현재 존재하는 장애물 수 확인
        RollingObstacle[] existing = FindObjectsOfType<RollingObstacle>();
        if (existing.Length >= maxObstacles) return;

        SpawnObstacle();
    }

    void SpawnObstacle()
    {
        // 스폰 위치 계산
        Vector3 spawnPos = transform.position;
        spawnPos.x += Random.Range(-spawnRandomX, spawnRandomX);
        spawnPos.y += Random.Range(-spawnRandomY, spawnRandomY);

        // 장애물 오브젝트 생성
        GameObject obstacle = new GameObject("RollingObstacle_DevilWang");
        obstacle.transform.position = spawnPos;
        obstacle.transform.localScale = Vector3.one * obstacleScale;

        // RollingObstacle 컴포넌트 추가 및 설정
        RollingObstacle rollingObstacle = obstacle.AddComponent<RollingObstacle>();
        rollingObstacle.obstacleSprite = obstacleSprite;
        rollingObstacle.gravityScale = gravityScale;
        rollingObstacle.friction = friction;
        rollingObstacle.bounciness = bounciness;
        rollingObstacle.linearDrag = linearDrag;
        rollingObstacle.angularDrag = angularDrag;
        rollingObstacle.enableRotation = enableRotation;
        rollingObstacle.knockbackForceX = knockbackForceX;
        rollingObstacle.knockbackForceY = knockbackForceY;
        rollingObstacle.initialVelocityX = initialVelocityX;
        rollingObstacle.initialVelocityY = initialVelocityY;
        rollingObstacle.autoDestroyTime = autoDestroyTime;
        rollingObstacle.enableTeleport = enableTeleport;
        rollingObstacle.teleportTarget = teleportTarget;
        rollingObstacle.resetVelocityOnTeleport = resetVelocityOnTeleport;
    }

    /// <summary>
    /// 에디터에서 스폰 위치를 시각적으로 확인하기 위한 기즈모
    /// </summary>
    void OnDrawGizmosSelected()
    {
        Gizmos.color = new Color(1f, 0.3f, 0.3f, 0.5f);
        Gizmos.DrawWireSphere(transform.position, 0.5f);

        // 스폰 랜덤 범위 표시
        if (spawnRandomX > 0f || spawnRandomY > 0f)
        {
            Gizmos.color = new Color(1f, 0.5f, 0f, 0.3f);
            Gizmos.DrawWireCube(
                transform.position,
                new Vector3(spawnRandomX * 2f, spawnRandomY * 2f, 0f)
            );
        }

        // 초기 속도 방향 표시
        if (Mathf.Abs(initialVelocityX) > 0.01f || Mathf.Abs(initialVelocityY) > 0.01f)
        {
            Gizmos.color = Color.yellow;
            Vector3 velocityDir = new Vector3(initialVelocityX, initialVelocityY, 0f).normalized;
            Gizmos.DrawLine(transform.position, transform.position + velocityDir * 2f);
            // 화살표 머리
            Gizmos.DrawWireSphere(transform.position + velocityDir * 2f, 0.15f);
        }
    }
}
