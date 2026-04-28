using UnityEngine;

public class LevelGenerator : MonoBehaviour
{
    [Header("Generation Settings")]
    [Tooltip("생성할 발판의 개수입니다.")]
    public int numberOfPlatforms = 100;
    [Tooltip("발판이 생성될 가로 범위입니다.")]
    public float levelWidth = 2.5f;
    [Tooltip("발판 간의 최소 높이 간격입니다.")]
    public float minY = 0.5f;
    [Tooltip("발판 간의 최대 높이 간격입니다.")]
    public float maxY = 1.5f;

    [Header("Prefabs")]
    [Tooltip("생성할 발판 프리팹입니다. 프로젝트 뷰에서 드래그해서 넣어주세요.")]
    public GameObject platformPrefab;

    void Start()
    {
        Vector3 spawnPosition = new Vector3();

        // 첫 번째 발판은 플레이어 바로 아래에 생성하지 않고, 조금 위부터 시작
        spawnPosition.y = -2f; 

        for (int i = 0; i < numberOfPlatforms; i++)
        {
            spawnPosition.y += Random.Range(minY, maxY);
            spawnPosition.x = Random.Range(-levelWidth, levelWidth);
            GameObject platform = Instantiate(platformPrefab, spawnPosition, Quaternion.identity);
            // 발판 레이어를 8번으로 설정 (넉백 시 통과 대상)
            platform.layer = 8;
        }
    }
}
