using UnityEngine;

/// <summary>
/// 장애물에 부딪힌 플레이어를 지정된 위치로 강제 이동시키는 컴포넌트입니다.
/// 어떤 장애물(Devil_Wang, ObstacleBlock 등)에든 붙여서 사용할 수 있습니다.
/// 
/// [사용법]
/// 1. 장애물 오브젝트에 이 스크립트를 추가합니다.
/// 2. 빈 오브젝트를 만들어 이동시킬 위치에 배치합니다.
/// 3. teleportTarget에 그 빈 오브젝트를 드래그합니다.
/// 4. isActive 체크박스로 기능을 켜고 끌 수 있습니다.
/// </summary>
public class PlayerTeleporter : MonoBehaviour
{
    [Header("기능 ON/OFF")]
    [Tooltip("이 기능을 사용할지 여부입니다. 체크 해제하면 텔레포트가 작동하지 않습니다.")]
    public bool isActive = true;

    [Header("이동 위치 설정")]
    [Tooltip("플레이어를 이동시킬 위치의 빈 오브젝트를 드래그하세요.")]
    public Transform teleportTarget;

    [Header("플레이어 설정")]
    [Tooltip("플레이어의 태그입니다.")]
    public string playerTag = "Player";

    [Header("이동 후 처리")]
    [Tooltip("텔레포트 후 플레이어의 속도를 초기화할지 여부입니다.")]
    public bool resetVelocity = true;

    [Header("디버그")]
    [Tooltip("씬 뷰에서 이동 위치와 연결선을 표시합니다.")]
    public bool showGizmo = true;

    void OnCollisionEnter2D(Collision2D collision)
    {
        if (!isActive) return;
        if (teleportTarget == null) return;

        if (collision.gameObject.CompareTag(playerTag))
        {
            TeleportPlayer(collision.gameObject);
        }
    }

    /// <summary>
    /// 플레이어를 지정된 위치로 이동시킵니다.
    /// </summary>
    void TeleportPlayer(GameObject player)
    {
        player.transform.position = new Vector3(teleportTarget.position.x, teleportTarget.position.y, player.transform.position.z);

        if (resetVelocity)
        {
            Rigidbody2D rb = player.GetComponent<Rigidbody2D>();
            if (rb != null)
            {
                rb.velocity = Vector2.zero;
                rb.angularVelocity = 0f;
            }
        }
    }

    /// <summary>
    /// 에디터에서 이동 위치를 시각적으로 확인하기 위한 기즈모
    /// </summary>
    void OnDrawGizmosSelected()
    {
        if (!showGizmo || teleportTarget == null) return;

        Vector2 dest = teleportTarget.position;

        // 도착 지점 표시
        Gizmos.color = new Color(0f, 1f, 0.5f, 0.8f);
        Gizmos.DrawWireSphere(dest, 0.5f);
        Gizmos.DrawWireCube(dest, new Vector3(0.3f, 0.3f, 0f));

        // 장애물 → 도착 지점 연결선
        Gizmos.color = new Color(1f, 1f, 0f, 0.5f);
        Gizmos.DrawLine(transform.position, (Vector3)dest);
    }
}
