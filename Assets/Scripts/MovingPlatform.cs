using UnityEngine;

/// <summary>
/// 움직이는 발판에 붙이는 스크립트입니다.
/// 플레이어가 위에 올라서면 발판의 자식으로 만들어 함께 이동하고,
/// 떠나면 자식 관계를 해제합니다.
/// </summary>
public class MovingPlatform : MonoBehaviour
{
    [Tooltip("플레이어의 태그입니다.")]
    public string playerTag = "Player";

    void OnCollisionEnter2D(Collision2D collision)
    {
        // 위에서 올라탔는지 확인 (법선 벡터가 위를 향하면 = 발판 윗면에 착지)
        if (collision.gameObject.CompareTag(playerTag))
        {
            foreach (ContactPoint2D contact in collision.contacts)
            {
                if (contact.normal.y < -0.5f)
                {
                    // 플레이어를 발판의 자식으로 설정
                    collision.transform.SetParent(transform);
                    return;
                }
            }
        }
    }

    void OnCollisionExit2D(Collision2D collision)
    {
        // 플레이어가 발판을 떠나면 자식 관계 해제
        if (collision.gameObject.CompareTag(playerTag))
        {
            collision.transform.SetParent(null);
        }
    }
}
