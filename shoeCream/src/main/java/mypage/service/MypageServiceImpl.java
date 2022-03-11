package mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mypage.bean.MypagePaging;
import mypage.bean.WishListDTO;
import mypage.dao.MypageDAO;
import product.bean.ProductDTO;
import product.dao.ProductDAO;
import style.dao.StyleDAO;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO mypageDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ProductDTO productDTO;
	@Autowired
	private StyleDAO styleDAO;
	@Autowired
	private MypagePaging mypagePaging;
	
	//관심 상품 불러오기
	@Override
	public List<Map<String, Object>> getWishList(String pg, int userId) {
		//해당 회원의 관심상품 목록 가져오기(최신 순으로 페이징 처리)
		Map<String, Integer> map = this.getPageRange(pg);
		map.put("userId", 1);
		List<WishListDTO> list = mypageDAO.getWishList(map);
		
		if(list == null) return null;
		else {
			//페이지에 뿌릴 데이터 담기
			List<Map<String, Object>> wishList = new ArrayList<Map<String,Object>>();
			Map<String, Object> wishProduct;
			for(WishListDTO wish : list) {
				wishProduct = new HashMap<String, Object>();
				wishProduct.put("wishListId", wish.getWishListId());
				int productId = wish.getProductId();
				productDTO = productDAO.getProductById(productId);
				wishProduct.put("productId", productId);
				wishProduct.put("img", productDTO.getImg1());
				wishProduct.put("brand", productDTO.getBrandName());
				wishProduct.put("productName", productDTO.getProductName());
				
				Integer price = styleDAO.getLowestPriceByProductId(productId); //판매 테이블에서 최저 가격 1개 추출 (조건)상품번호, 판매상태=0, 가격 오름차순
				if (price == null) wishProduct.put("price", 0);
				else wishProduct.put("price", price);
				
				wishList.add(wishProduct);
			}
			return wishList;
		}
	}
	
	//관심상품 삭제
	@Override
	public void deleteWish(int wishListId) {
		mypageDAO.deleteWish(wishListId);
	}
	
	//페이징 객체 생성
	@Override
	public MypagePaging paging(String pg, String tableName, int userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tableName", tableName);
		map.put("userId", 1);
		int totalA = mypageDAO.getTotalDB(map); 
		mypagePaging.setCurrentPage(Integer.parseInt(pg)); //현재 페이지
		mypagePaging.setPageBlock(5);
		mypagePaging.setPageSize(5);
		mypagePaging.setTotalA(totalA);
		mypagePaging.makePagingHTML();
		
		return mypagePaging;
	}
	
	//페이지 글 범위 생성
	private Map<String, Integer> getPageRange(String pg) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int pgNum = Integer.parseInt(pg);
		int qtyInPage = 5; // 한 페이지에 보여줄 갯수
		int endNum = pgNum * qtyInPage; //선택 페이지의 끝 글번호
		int startNum = endNum - (qtyInPage-1); //선택 페이지의 시작 글번호
		
		map.put("startNum",startNum);
		map.put("endNum",endNum);		
		return map;
	}
	
}
