package mypage.dao;

import java.util.List;
import java.util.Map;

import mypage.bean.WishListDTO;

public interface MypageDAO {

	public List<WishListDTO> getWishList(Map<String, Integer> map);

	public int getTotalDB(Map<String, Object> map);

	public void deleteWish(int wishListId);

}
