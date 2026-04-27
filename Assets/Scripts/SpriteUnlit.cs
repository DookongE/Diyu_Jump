using UnityEngine;

/// <summary>
/// SpriteRenderer의 머티리얼을 Sprites-Default (Unlit)로 변경하여
/// 조명 영향을 받지 않고 원색 그대로 표시되게 합니다.
/// 캐릭터, 블록 등 조명 영향을 받지 않아야 하는 오브젝트에 붙여주세요.
/// </summary>
public class SpriteUnlit : MonoBehaviour
{
    void Awake()
    {
        SpriteRenderer sr = GetComponent<SpriteRenderer>();
        if (sr != null)
        {
            // Sprites-Default는 Unity 기본 내장 Unlit 스프라이트 머티리얼
            sr.material = new Material(Shader.Find("Sprites/Default"));
        }
    }
}
