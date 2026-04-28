using UnityEngine;

public class WallGenerator : MonoBehaviour
{
    [Header("벽 설정")]
    [Tooltip("벽 타일 스프라이트입니다. (Wall.png)")]
    public Sprite wallSprite;

    [Tooltip("위로 쌓을 벽 타일 개수입니다.")]
    public int tileCount = 10;

    [Tooltip("벽 타일의 정렬 레이어입니다.")]
    public string sortingLayerName = "Default";

    [Tooltip("벽 타일의 정렬 순서입니다.")]
    public int sortingOrder = 5;

    void Start()
    {
        GenerateWall();
    }

    /// <summary>
    /// 현재 오브젝트 위치를 기준으로 위쪽 방향으로 벽 타일을 쌓습니다.
    /// </summary>
    public void GenerateWall()
    {
        // 기존에 생성된 자식 타일 제거
        for (int i = transform.childCount - 1; i >= 0; i--)
        {
            if (Application.isPlaying)
                Destroy(transform.GetChild(i).gameObject);
            else
                DestroyImmediate(transform.GetChild(i).gameObject);
        }

        if (wallSprite == null)
        {
            Debug.LogError("WallGenerator: wallSprite가 설정되지 않았습니다!");
            return;
        }

        // 스프라이트의 실제 월드 크기 계산 (Pixels Per Unit 반영)
        float tileHeight = wallSprite.bounds.size.y;

        for (int i = 0; i < tileCount; i++)
        {
            GameObject tile = new GameObject($"WallTile_{i}");
            tile.transform.SetParent(transform);

            // 현재 오브젝트 위치를 기준으로 위로 쌓기
            tile.transform.localPosition = new Vector3(0f, i * tileHeight, 0f);
            tile.transform.localRotation = Quaternion.identity;
            tile.transform.localScale = Vector3.one;

            // SpriteRenderer 설정
            SpriteRenderer sr = tile.AddComponent<SpriteRenderer>();
            sr.sprite = wallSprite;
            sr.sortingLayerName = sortingLayerName;
            sr.sortingOrder = sortingOrder;

            // BoxCollider2D 추가 (스프라이트 크기에 자동 맞춤)
            BoxCollider2D boxCol = tile.AddComponent<BoxCollider2D>();

            // 마찰력 0 물리 재질 적용 (플레이어가 벽에 걸리지 않도록)
            PhysicsMaterial2D noFriction = new PhysicsMaterial2D("WallNoFriction");
            noFriction.friction = 0f;
            noFriction.bounciness = 0f;
            boxCol.sharedMaterial = noFriction;

            // Rigidbody2D 추가 (Static: 움직이지 않는 벽)
            Rigidbody2D rb = tile.AddComponent<Rigidbody2D>();
            rb.bodyType = RigidbodyType2D.Static;
        }
    }
}
