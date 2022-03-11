package mypage.service;

import java.util.List;
import java.util.Map;

import mypage.bean.MypagePaging;

public interface MypageService {
	
	public MypagePaging paging(String pg, String tableName, int userId);

	public List<Map<String, Object>> getWishList(String pg, int userId);

	public void deleteWish(int wishListId);

}
