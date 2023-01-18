package com.foodhunter.DAO;

import com.foodhunter.DTO.Favorite;

import java.util.List;

public interface FavoriteDAO {

    /**즐겨찾기 등록**/
    public Favorite save(Favorite favorite);
    /**마이페이지에서 사용 -> 내가 즐겨찾기한 가게 리스트업**/
    public List<Favorite> findByUserId(Long userId);
    public List<Favorite> findByStoreId(long storeId);
    /**즐겨찾기 삭제**/
    public Long delete(Favorite favorite);
    public Long findOne(Favorite favorite);

}
