using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

/// <summary>
/// 씬 시작 시 자동으로 Global Volume + Bloom 효과를 설정합니다.
/// 이 스크립트를 아무 빈 오브젝트에 붙이거나, Main Camera에 붙이면 됩니다.
/// Emission 값이 1 이상인 스프라이트/머티리얼이 빛나게 됩니다.
/// </summary>
public class BloomSetup : MonoBehaviour
{
    [Header("Bloom 설정")]
    [Tooltip("Bloom 효과의 강도입니다. 높을수록 더 밝게 빛납니다.")]
    public float intensity = 1.5f;

    [Tooltip("Bloom이 적용되는 최소 밝기 기준입니다. 낮을수록 더 많은 영역이 빛납니다.")]
    public float threshold = 0.9f;

    [Tooltip("Bloom 확산 범위입니다. (1~10)")]
    [Range(1, 10)]
    public float scatter = 7f;

    [Tooltip("Bloom 색상 틴트")]
    public Color tint = Color.white;

    private Volume volume;
    private Bloom bloom;

    void Awake()
    {
        // 기존 Global Volume이 있는지 확인
        volume = FindObjectOfType<Volume>();

        if (volume == null)
        {
            // 없으면 새로 생성
            GameObject volumeObj = new GameObject("Global Volume (Bloom)");
            volume = volumeObj.AddComponent<Volume>();
            volume.isGlobal = true;
        }

        // Volume Profile 생성
        if (volume.profile == null)
        {
            volume.profile = ScriptableObject.CreateInstance<VolumeProfile>();
        }

        // Bloom 컴포넌트가 이미 있는지 확인
        if (!volume.profile.TryGet(out bloom))
        {
            bloom = volume.profile.Add<Bloom>(true);
        }

        // Bloom 설정 적용
        ApplyBloomSettings();
    }

    void ApplyBloomSettings()
    {
        if (bloom == null) return;

        bloom.active = true;
        bloom.intensity.overrideState = true;
        bloom.intensity.value = intensity;

        bloom.threshold.overrideState = true;
        bloom.threshold.value = threshold;

        bloom.scatter.overrideState = true;
        bloom.scatter.value = scatter;

        bloom.tint.overrideState = true;
        bloom.tint.value = tint;
    }

    // Inspector에서 값을 변경하면 실시간 반영
    void OnValidate()
    {
        if (bloom != null)
        {
            ApplyBloomSettings();
        }
    }
}
