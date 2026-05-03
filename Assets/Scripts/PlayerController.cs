using UnityEngine;
using UnityEngine.SceneManagement;

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

    [Header("넉백 설정")]
    [Tooltip("넉백 후 발판을 통과하는 시간(초)")]
    public float passThroughDuration = 1f;
    [Tooltip("넉백 후 맞은 상태가 유지되는 시간(초). 이 시간 동안 땅을 밟아도 조작 불가.")]
    public float knockbackStunDuration = 1f;

    [Header("낙하 스턴 설정")]
    [Tooltip("이 높이 이상에서 떨어지면 스턴이 걸립니다.")]
    public float fallStunHeight = 5f;
    [Tooltip("스턴 지속 시간(초)")]
    public float stunDuration = 1.5f;

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
    [Tooltip("피격 시 스프라이트")]
    public Sprite hitSprite;
    [Tooltip("낙하 스턴 시 스프라이트")]
    public Sprite stunSprite;
    [Tooltip("이동 애니메이션 프레임 전환 간격(초)")]
    public float animFrameTime = 0.15f;

    // 레이어 번호 (8, 9번은 Unity에서 비어있는 User Layer)
    private const int PLATFORM_LAYER = 8;
    private const int KNOCKEDBACK_LAYER = 9;

    private float gravity;
    private float jumpVelocity;
    private float jumpHorizontalSpeed;
    private float currentChargeTime;

    /// <summary>현재 충전 비율 (0~1). UI 게이지에서 사용.</summary>
    public float ChargeRatio => Mathf.Clamp01(currentChargeTime / maxChargeTime);
    /// <summary>현재 충전 중인지 여부.</summary>
    public bool IsCharging { get; private set; }

    private Rigidbody2D rb;
    private SpriteRenderer spriteRenderer;
    private int originalLayer;

    private bool isGrounded;
    private bool wasGrounded;
    private bool isKnockedBack;
    private float knockbackStunTimer;
    private bool isStunned;
    private float stunTimer;
    private float highestY;
    private bool trackingFall;
    private float passThroughTimer;
    private float animTimer;
    private int animFrame;
    private float restartHoldTimer;

    void Start()
    {
        gravity = -(2 * jumpHeight) / Mathf.Pow(timeToJumpApex, 2);
        jumpVelocity = Mathf.Abs(gravity) * timeToJumpApex;
        jumpHorizontalSpeed = moveSpeed;

        spriteRenderer = GetComponent<SpriteRenderer>();
        rb = GetComponent<Rigidbody2D>();
        originalLayer = gameObject.layer;

        if (rb == null)
        {
            Debug.LogError("Rigidbody2D 컴포넌트가 없습니다!");
        }
        else
        {
            rb.gravityScale = gravity / Physics2D.gravity.y;
        }

        // ────────────────────────────────────────
        // 레이어 충돌 설정:
        // KNOCKEDBACK_LAYER(9)는 PLATFORM_LAYER(8)와 충돌하지 않음
        // KNOCKEDBACK_LAYER(9)는 벽/바닥(Default 등)과는 정상 충돌
        // ────────────────────────────────────────
        Physics2D.IgnoreLayerCollision(KNOCKEDBACK_LAYER, PLATFORM_LAYER, true);
    }

    // ───────────────────────────────────────────
    //  바닥 감지
    // ───────────────────────────────────────────
    void FixedUpdate()
    {
        // 넉백 통과 타이머
        if (passThroughTimer > 0f)
        {
            passThroughTimer -= Time.fixedDeltaTime;
            if (passThroughTimer <= 0f)
            {
                // 통과 시간 끝 → 원래 레이어로 복원
                gameObject.layer = originalLayer;
            }
        }

        wasGrounded = isGrounded;
        isGrounded = false;
    }

    void OnCollisionStay2D(Collision2D collision)
    {
        if (collision.gameObject.CompareTag("Block")) return;

        foreach (ContactPoint2D contact in collision.contacts)
        {
            if (contact.normal.y > 0.5f)
            {
                isGrounded = true;
                return;
            }
        }
    }

    void OnCollisionEnter2D(Collision2D collision)
    {
        if (collision.gameObject.CompareTag("Block"))
        {
            ApplyKnockback(collision);
            return;
        }

        foreach (ContactPoint2D contact in collision.contacts)
        {
            if (contact.normal.y > 0.5f)
            {
                isGrounded = true;
                return;
            }
        }
    }

    // ───────────────────────────────────────────
    //  메인 로직
    // ───────────────────────────────────────────
    void Update()
    {
        // R키 2초 홀드 → 재시작
        if (Input.GetKey(KeyCode.R))
        {
            restartHoldTimer += Time.unscaledDeltaTime;
            if (restartHoldTimer >= 2f)
            {
                SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
                return;
            }
        }
        else
        {
            restartHoldTimer = 0f;
        }

        // 착지 순간
        if (isGrounded && !wasGrounded)
        {
            OnLanded();
        }
        // 바닥에서 벗어남
        else if (!isGrounded && wasGrounded)
        {
            currentChargeTime = 0f;
            IsCharging = false;
        }

        // 스턴 상태
        if (isStunned)
        {
            stunTimer -= Time.deltaTime;
            if (stunTimer <= 0f) isStunned = false;
            UpdateSpriteAnimation(0f, false);
            return;
        }

        // 넉백 상태 → 모든 키 차단
        if (isKnockedBack)
        {
            knockbackStunTimer -= Time.deltaTime;
            if (knockbackStunTimer <= 0f)
            {
                isKnockedBack = false;
            }
            else
            {
                UpdateSpriteAnimation(0f, false);
                return;
            }
        }

        // 대화 중 → 이동/점프 차단
        if (DialogueUI.Instance != null && DialogueUI.Instance.IsDialogueActive)
        {
            if (rb != null) rb.velocity = new Vector2(0f, rb.velocity.y);
            UpdateSpriteAnimation(0f, false);
            return;
        }

        // 낙하 높이 추적
        if (!isGrounded)
        {
            if (!trackingFall)
            {
                trackingFall = true;
                highestY = transform.position.y;
            }
            else if (transform.position.y > highestY)
            {
                highestY = transform.position.y;
            }
        }

        // 점프 실행
        if (Input.GetButtonUp("Jump") && isGrounded)
        {
            Jump(Input.GetAxisRaw("Horizontal"));
        }

        // 충전 로직
        IsCharging = Input.GetButton("Jump") && isGrounded;
        bool isCharging = IsCharging;

        float moveInput = 0f;
        if (!isCharging)
        {
            moveInput = Input.GetAxisRaw("Horizontal");
            currentChargeTime = 0f;
        }
        else
        {
            currentChargeTime += Time.deltaTime;
        }
        
        // 이동 적용
        if (rb != null)
        {
            if (isGrounded)
            {
                rb.velocity = new Vector2(moveInput * moveSpeed, rb.velocity.y);
            }
            else
            {
                rb.velocity = new Vector2(Input.GetAxisRaw("Horizontal") * moveSpeed, rb.velocity.y);
            }
        }

        // 스프라이트 업데이트
        UpdateSpriteAnimation(moveInput, isCharging);

        // 중력 조절
        if (rb != null)
        {
            float baseGravity = gravity / Physics2D.gravity.y;
            rb.gravityScale = (rb.velocity.y < 0) ? baseGravity * fallMultiplier : baseGravity;
        }
    }

    void Jump(float directionX)
    {
        if (rb == null) return;

        float chargeRatio = Mathf.Clamp01(currentChargeTime / maxChargeTime);
        float jumpMultiplier = Mathf.Lerp(minJumpMultiplier, 1f, chargeRatio);

        rb.velocity = new Vector2(directionX * jumpHorizontalSpeed, jumpVelocity * jumpMultiplier);
        isGrounded = false;
        currentChargeTime = 0f;
    }

    void OnLanded()
    {

        if (trackingFall)
        {
            float fallDistance = highestY - transform.position.y;
            if (fallDistance >= fallStunHeight)
            {
                isStunned = true;
                stunTimer = stunDuration;
                rb.velocity = Vector2.zero;
            }
            trackingFall = false;
        }
    }

    void ApplyKnockback(Collision2D collision)
    {
        if (rb == null) return;

        isKnockedBack = true;
        knockbackStunTimer = knockbackStunDuration;
        isGrounded = false;
        currentChargeTime = 0f;
        IsCharging = false;

        // 플레이어를 KNOCKEDBACK 레이어로 변경
        // → PLATFORM 레이어와 충돌하지 않으므로 발판을 통과함
        // → 벽/바닥은 Default 레이어이므로 정상 충돌
        gameObject.layer = KNOCKEDBACK_LAYER;
        passThroughTimer = passThroughDuration;

        ObstacleBlock obstacle = collision.gameObject.GetComponent<ObstacleBlock>();
        RollingObstacle rollingObstacle = collision.gameObject.GetComponent<RollingObstacle>();

        float forceX = 8f;
        float forceY = 6f;
        float dirX = 0f;

        if (obstacle != null)
        {
            forceX = obstacle.knockbackForceX;
            forceY = obstacle.knockbackForceY;
            dirX = obstacle.GetKnockbackDirectionX();
        }
        else if (rollingObstacle != null)
        {
            forceX = rollingObstacle.knockbackForceX;
            forceY = rollingObstacle.knockbackForceY;
            // 굴러오는 방향 기반으로 넉백 방향 자동 결정
            dirX = 0f;
        }

        if (Mathf.Abs(dirX) < 0.1f)
        {
            Vector2 knockbackDir = Vector2.zero;
            foreach (ContactPoint2D contact in collision.contacts)
            {
                knockbackDir += contact.normal;
            }
            knockbackDir.Normalize();
            dirX = knockbackDir.x;

            if (Mathf.Abs(dirX) < 0.1f)
            {
                dirX = (transform.position.x > collision.transform.position.x) ? 1f : -1f;
            }
        }

        rb.velocity = new Vector2(dirX * forceX, forceY);
    }

    // ───────────────────────────────────────────
    //  스프라이트 애니메이션
    // ───────────────────────────────────────────
    void UpdateSpriteAnimation(float moveInput, bool isCharging)
    {
        if (spriteRenderer == null) return;

        if (isStunned)
        {
            if (stunSprite != null) spriteRenderer.sprite = stunSprite;
            return;
        }

        if (isKnockedBack)
        {
            if (hitSprite != null) spriteRenderer.sprite = hitSprite;
            return;
        }

        if (!isGrounded)
        {
            if (jumpSprite != null) spriteRenderer.sprite = jumpSprite;
            return;
        }

        if (isCharging)
        {
            if (jumpReadySprite != null) spriteRenderer.sprite = jumpReadySprite;
            return;
        }

        if (Mathf.Abs(moveInput) > 0.01f)
        {
            animTimer += Time.deltaTime;
            if (animTimer >= animFrameTime)
            {
                animTimer = 0f;
                animFrame = 1 - animFrame;
            }

            if (moveInput > 0)
                spriteRenderer.sprite = (animFrame == 0) ? moveR1Sprite : moveR2Sprite;
            else
                spriteRenderer.sprite = (animFrame == 0) ? moveL1Sprite : moveL2Sprite;
        }
        else
        {
            animTimer = 0f;
            animFrame = 0;
            if (idleSprite != null) spriteRenderer.sprite = idleSprite;
        }
    }
}
