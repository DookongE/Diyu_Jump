using UnityEngine;

/// <summary>
/// 장애물 블록에 붙이는 스크립트입니다.
/// 플레이어를 밀쳐내는 방향과 힘을 설정할 수 있습니다.
/// </summary>
public class ObstacleBlock : MonoBehaviour
{
    public enum KnockbackDirection
    {
        Auto,   // 충돌 방향에 따라 자동 결정
        Left,   // 항상 왼쪽으로 밀기
        Right   // 항상 오른쪽으로 밀기
    }

    [Header("밀치기 방향")]
    [Tooltip("플레이어를 밀쳐내는 방향입니다.")]
    public KnockbackDirection knockbackDirection = KnockbackDirection.Auto;

    [Header("넉백 힘")]
    [Tooltip("튕겨나가는 수평 힘")]
    public float knockbackForceX = 8f;
    [Tooltip("튕겨나가는 수직 힘")]
    public float knockbackForceY = 6f;

    /// <summary>
    /// 넉백 수평 방향을 반환합니다. (-1: 왼쪽, 1: 오른쪽, 0: 자동)
    /// </summary>
    public float GetKnockbackDirectionX()
    {
        switch (knockbackDirection)
        {
            case KnockbackDirection.Left:  return -1f;
            case KnockbackDirection.Right: return 1f;
            default:                       return 0f; // Auto
        }
    }
}
