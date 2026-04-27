using UnityEngine;

public class PlayerController : MonoBehaviour
{
    [Header("이동 설정")]
    [Tooltip("플레이어의 이동 속도입니다.")]
    public float moveSpeed = 5f;
    [Header("점프 설정")]
    [Tooltip("캐릭터가 점프할 수 있는 최대 높이입니다.")]
    public float jumpHeight = 4f;
    [Tooltip("최고점까지 도달하는 데 걸리는 시간입니다. 이 값이 클수록 체공 시간이 길어집니다.")]
    public float timeToJumpApex = 0.4f;

    [Header("중력 설정")]
    [Tooltip("낙하 시 적용될 중력 배율입니다. 1보다 크면 더 빨리 떨어집니다.")]
    public float fallMultiplier = 2.5f;

    [Header("점프 충전 설정")]
    [Tooltip("최대 점프력을 얻기 위해 필요한 충전 시간(초)입니다.")]
    public float maxChargeTime = 1.0f;
    [Tooltip("최소 점프력 배율입니다. (0~1 사이)")]
    public float minJumpMultiplier = 0.3f;

    [Header("스프라이트 애니메이션")]
    [Tooltip("가만히 있을 때 스프라이트")]
    public Sprite idleSprite;
    [Tooltip("오른쪽 이동 스프라이트 1")]
    public Sprite moveR1Sprite;
    [Tooltip("오른쪽 이동 스프라이트 2")]
    public Sprite moveR2Sprite;
    [Tooltip("왼쪽 이동 스프라이트 1")]
    public Sprite moveL1Sprite;
    [Tooltip("왼쪽 이동 스프라이트 2")]
    public Sprite moveL2Sprite;
    [Tooltip("점프 충전 중 스프라이트")]
    public Sprite jumpReadySprite;
    [Tooltip("공중에 떠 있을 때 스프라이트")]
    public Sprite jumpSprite;
    [Tooltip("이동 애니메이션 프레임 전환 간격(초)")]
    public float animFrameTime = 0.15f;

    private float gravity;
    private float jumpVelocity;
    private float jumpHorizontalSpeed; // 점프 시 수평 속도
    private float currentChargeTime; // 현재 충전된 시간

    private Rigidbody2D rb;
    private SpriteRenderer spriteRenderer;
    private bool isGrounded;
    private float animTimer;
    private int animFrame; // 0 또는 1

    void Start()
    {
        // 물리 공식에 따른 중력과 점프 속도 계산
        // gravity = -(2 * height) / time^2
        // jumpVelocity = |gravity| * time
        gravity = -(2 * jumpHeight) / Mathf.Pow(timeToJumpApex, 2);
        jumpVelocity = Mathf.Abs(gravity) * timeToJumpApex;
        jumpHorizontalSpeed = moveSpeed; // 수평 점프 속도는 이동 속도와 동일하게 설정

        // SpriteRenderer 컴포넌트를 가져옵니다.
        spriteRenderer = GetComponent<SpriteRenderer>();

        // Rigidbody2D 컴포넌트를 가져옵니다.
        rb = GetComponent<Rigidbody2D>();
        if (rb == null)
        {
            Debug.LogError("Rigidbody2D 컴포넌트가 없습니다! 플레이어어게 Rigidbody2D를 추가해주세요.");
        }
        else
        {
            // 계산된 중력을 Rigidbody2D의 gravityScale에 적용 (Physics2D.gravity.y는 보통 -9.81)
            // rb.gravityScale = gravity / Physics2D.gravity.y;
            // 하지만 여기서는 직접 힘을 가하거나 gravityScale을 조절하는 방식보다,
            // Unity의 물리 엔진을 활용하되 gravityScale을 우리가 원하는 gravity에 맞춰 설정합니다.
            
            // Unity 기본 중력(-9.81)을 기준으로 gravityScale 설정
            rb.gravityScale = gravity / Physics2D.gravity.y;
        }
    }

    void Update()
    {
        // 1. 점프 실행 (뗐을 때) - 가장 먼저 처리하여 chargeTime이 초기화되기 전에 사용
        if (Input.GetButtonUp("Jump") && isGrounded)
        {
            // 방향 결정 (A: -1, D: 1, 그 외: 0)
            float directionX = Input.GetAxisRaw("Horizontal");
            Jump(directionX);
        }

        // 2. 충전 로직
        // 점프 충전 중인지 확인 (스페이스바 누르고 있고 바닥에 있을 때)
        bool isCharging = Input.GetButton("Jump") && isGrounded;

        float moveInput = 0f;

        if (!isCharging)
        {
            // 좌우 이동 입력 (충전 중이 아닐 때만 이동 가능)
            moveInput = Input.GetAxisRaw("Horizontal");
            currentChargeTime = 0f; // 충전 중이 아니면 초기화
        }
        else
        {
            // 충전 중일 때는 이동 멈춤 & 충전 시간 증가
            moveInput = 0f;
            currentChargeTime += Time.deltaTime;
        }
        
        // 3. 이동 적용 (y축 속도는 유지)
        if (rb != null)
        {
            // 공중에서는 기존 수평 속도 유지 (관성) 또는 제어 가능 여부에 따라 다름
            // 여기서는 바닥에 있을 때만 멈추고 공중에서는 이동 가능하게 할 수도 있지만, 
            // "충전 중 이동 불가" 요구사항에 따라 바닥에서만 0으로 설정.
            if (isGrounded)
            {
                 rb.velocity = new Vector2(moveInput * moveSpeed, rb.velocity.y);
            }
            else
            {
                // 공중 이동 제어 (원한다면)
                // 지금은 공중에서도 키 입력으로 움직일 수 있게 둠 (moveInput이 0이 아니면)
                // 단, 점프 직후에는 moveInput이 0일 수 있음. 
                // 점프 후 공중 제어를 원하면 아래 로직 유지. 
                // 하지만 "어디로 점프할 지 정한다"는 것은 점프 순간의 방향이 중요하므로,
                // 점프 후 공중 제어를 막고 싶다면 공중 이동 로직을 수정해야 함.
                // 일단은 공중 제어 유지.
                rb.velocity = new Vector2(Input.GetAxisRaw("Horizontal") * moveSpeed, rb.velocity.y);
            }
        }

        // 4. 스프라이트 애니메이션 업데이트
        UpdateSpriteAnimation(moveInput, isCharging);

        // 낙하 시 중력 조절 (기본 중력 스케일은 위에서 계산됨)
        if (rb != null)
        {
            float currentGravityScale = gravity / Physics2D.gravity.y;

            if (rb.velocity.y < 0)
            {
                rb.gravityScale = currentGravityScale * fallMultiplier;
            }
            else if (rb.velocity.y > 0 && !Input.GetButton("Jump"))
            {
                // 낮은 점프(버튼을 빨리 뗐을 때) 구현하려면 여기에도 로직 추가 가능하지만,
                // 지금 요청은 "뗐을 때 점프"이므로 이미 뗐을 때 점프가 시작됨.
                // 따라서 상승 중에는 기본 중력 적용.
                 rb.gravityScale = currentGravityScale;
            }
            else
            {
                rb.gravityScale = currentGravityScale;
            }
        }
    }

    void Jump(float directionX)
    {
        if (rb != null)
        {
            // 충전 비율 계산 (0~1)
            float chargeRatio = Mathf.Clamp01(currentChargeTime / maxChargeTime);
            
            // 점프 힘 배율 계산 (최소 점프력 ~ 1.0)
            float jumpMultiplier = Mathf.Lerp(minJumpMultiplier, 1f, chargeRatio);

            // 최종 점프 속도 적용
            float finalJumpVelocity = jumpVelocity * jumpMultiplier;

            // 수직 속도는 계산된 finalJumpVelocity, 수평 속도는 입력 방향 * jumpHorizontalSpeed
            rb.velocity = new Vector2(directionX * jumpHorizontalSpeed, finalJumpVelocity);
            isGrounded = false; // 점프 직후에는 땅에 있지 않음
            
            currentChargeTime = 0f; // 점프 후 충전 시간 초기화
        }
    }

    // 바닥 충돌 감지
    void OnCollisionEnter2D(Collision2D collision)
    {
        // 충돌한 물체의 법선 벡터가 위쪽을 향하면 바닥으로 간주
        foreach (ContactPoint2D contact in collision.contacts)
        {
            if (contact.normal.y > 0.5f)
            {
                isGrounded = true;
                break;
            }
        }
    }

    // 스프라이트 애니메이션 업데이트
    void UpdateSpriteAnimation(float moveInput, bool isCharging)
    {
        if (spriteRenderer == null) return;

        // 공중에 떠 있을 때 — Jump 스프라이트
        if (!isGrounded)
        {
            if (jumpSprite != null)
            {
                spriteRenderer.sprite = jumpSprite;
            }
            animTimer = 0f;
            animFrame = 0;
            return;
        }

        // 스페이스바 충전 중 — JumpReady 스프라이트
        if (isCharging)
        {
            if (jumpReadySprite != null)
            {
                spriteRenderer.sprite = jumpReadySprite;
            }
            animTimer = 0f;
            animFrame = 0;
            return;
        }

        if (Mathf.Abs(moveInput) > 0.01f)
        {
            // 이동 중 — 프레임 전환 타이머
            animTimer += Time.deltaTime;
            if (animTimer >= animFrameTime)
            {
                animTimer = 0f;
                animFrame = 1 - animFrame; // 0 ↔ 1 토글
            }

            if (moveInput > 0)
            {
                // 오른쪽 이동
                spriteRenderer.sprite = (animFrame == 0) ? moveR1Sprite : moveR2Sprite;
            }
            else
            {
                // 왼쪽 이동
                spriteRenderer.sprite = (animFrame == 0) ? moveL1Sprite : moveL2Sprite;
            }
        }
        else
        {
            // 정지 — Idle 스프라이트
            animTimer = 0f;
            animFrame = 0;
            if (idleSprite != null)
            {
                spriteRenderer.sprite = idleSprite;
            }
        }
    }
}
