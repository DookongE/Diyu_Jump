using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    [Tooltip("따라갈 대상(플레이어)입니다.")]
    public Transform target;

    void LateUpdate()
    {
        if (target != null)
        {
            // 플레이어의 X, Y축 위치를 모두 따라갑니다.
            Vector3 newPos = new Vector3(target.position.x, target.position.y, transform.position.z);
            transform.position = newPos;
        }
    }
}
