using UnityEngine;
using System.Collections.Generic;

/// <summary>
/// 캐릭터를 따라 배경 타일을 상하좌우로 자동 생성/삭제하는 무한 스크롤 배경 시스템입니다.
/// 메인 카메라나 빈 오브젝트에 붙여서 사용합니다.
/// </summary>
public class BackgroundScroller : MonoBehaviour
{
    [Header("배경 설정")]
    [Tooltip("배경으로 사용할 스프라이트")]
    public Sprite backgroundSprite;

    [Tooltip("추적할 대상 (캐릭터)")]
    public Transform target;

    [Tooltip("카메라 주변으로 얼마나 여유 있게 배경을 생성할지 (카메라 크기 기준 배율)")]
    public float bufferMultiplier = 2f;

    [Tooltip("배경 정렬 순서 (낮을수록 뒤에 그려짐)")]
    public int sortingOrder = -10;

    [Header("배경 스케일")]
    [Tooltip("배경 스프라이트의 X 스케일")]
    public float scaleX = 1f;
    [Tooltip("배경 스프라이트의 Y 스케일")]
    public float scaleY = 1f;

    // 타일 관리: 그리드 좌표 -> 타일 오브젝트
    private Dictionary<Vector2Int, GameObject> tiles = new Dictionary<Vector2Int, GameObject>();
    private float tileWidth;  // 한 타일의 월드 너비
    private float tileHeight; // 한 타일의 월드 높이
    private Camera mainCam;

    void Start()
    {
        mainCam = Camera.main;

        if (backgroundSprite == null)
        {
            Debug.LogError("BackgroundScroller: 배경 스프라이트를 설정해주세요!");
            return;
        }

        if (target == null)
        {
            Debug.LogError("BackgroundScroller: 추적 대상(캐릭터)을 설정해주세요!");
            return;
        }

        // 타일 크기 계산 (스프라이트 크기 * 스케일)
        tileWidth = backgroundSprite.bounds.size.x * scaleX;
        tileHeight = backgroundSprite.bounds.size.y * scaleY;

        // 초기 타일 생성
        UpdateTiles();
    }

    void LateUpdate()
    {
        if (backgroundSprite == null || target == null) return;
        UpdateTiles();
    }

    /// <summary>
    /// 카메라 위치 기준으로 필요한 타일을 생성하고 불필요한 타일을 삭제합니다.
    /// </summary>
    void UpdateTiles()
    {
        float camHalfHeight = mainCam.orthographicSize;
        float camHalfWidth = camHalfHeight * mainCam.aspect;
        Vector3 camPos = mainCam.transform.position;

        // 버퍼 적용된 범위
        float left   = camPos.x - camHalfWidth * bufferMultiplier;
        float right  = camPos.x + camHalfWidth * bufferMultiplier;
        float bottom = camPos.y - camHalfHeight * bufferMultiplier;
        float top    = camPos.y + camHalfHeight * bufferMultiplier;

        // 범위에 해당하는 그리드 좌표 계산
        int minCol = Mathf.FloorToInt(left / tileWidth);
        int maxCol = Mathf.CeilToInt(right / tileWidth);
        int minRow = Mathf.FloorToInt(bottom / tileHeight);
        int maxRow = Mathf.CeilToInt(top / tileHeight);

        // 필요한 타일 좌표 셋
        HashSet<Vector2Int> neededCoords = new HashSet<Vector2Int>();

        for (int col = minCol; col <= maxCol; col++)
        {
            for (int row = minRow; row <= maxRow; row++)
            {
                Vector2Int coord = new Vector2Int(col, row);
                neededCoords.Add(coord);

                // 아직 없는 타일이면 생성
                if (!tiles.ContainsKey(coord))
                {
                    CreateTile(coord);
                }
            }
        }

        // 범위 밖의 타일 삭제
        List<Vector2Int> toRemove = new List<Vector2Int>();
        foreach (var kvp in tiles)
        {
            if (!neededCoords.Contains(kvp.Key))
            {
                toRemove.Add(kvp.Key);
            }
        }

        foreach (var coord in toRemove)
        {
            if (tiles[coord] != null)
            {
                Destroy(tiles[coord]);
            }
            tiles.Remove(coord);
        }
    }

    /// <summary>
    /// 그리드 좌표에 배경 타일을 생성합니다.
    /// 정수 그리드 좌표를 사용하여 어긋남을 방지합니다.
    /// </summary>
    void CreateTile(Vector2Int coord)
    {
        GameObject tile = new GameObject($"BG_Tile_{coord.x}_{coord.y}");

        // 정확한 그리드 위치 계산 (정수 * 타일크기 = 어긋남 없음)
        float posX = coord.x * tileWidth;
        float posY = coord.y * tileHeight;
        tile.transform.position = new Vector3(posX, posY, 10f);
        tile.transform.localScale = new Vector3(scaleX, scaleY, 1f);

        SpriteRenderer sr = tile.AddComponent<SpriteRenderer>();
        sr.sprite = backgroundSprite;
        sr.sortingOrder = sortingOrder;

        tiles[coord] = tile;
    }
}
