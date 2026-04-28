using UnityEngine;
using UnityEngine.SceneManagement;

/// <summary>
/// R키를 2초간 누르면 현재 씬을 재시작하는 스크립트입니다.
/// 빈 오브젝트에 붙여서 사용합니다.
/// </summary>
public class GameRestarter : MonoBehaviour
{
    [Tooltip("R키를 이 시간(초)만큼 누르면 재시작됩니다.")]
    public float holdDuration = 2f;

    private float holdTimer;

    /// <summary>현재 R키 홀드 비율 (0~1). UI 표시용.</summary>
    public float HoldRatio => Mathf.Clamp01(holdTimer / holdDuration);
    /// <summary>현재 R키를 누르고 있는지 여부.</summary>
    public bool IsHolding { get; private set; }

    void Update()
    {
        if (Input.GetKey(KeyCode.R))
        {
            holdTimer += Time.deltaTime;
            IsHolding = true;

            if (holdTimer >= holdDuration)
            {
                SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
            }
        }
        else
        {
            holdTimer = 0f;
            IsHolding = false;
        }
    }
}
