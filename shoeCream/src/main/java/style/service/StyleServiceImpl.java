package style.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import style.bean.StyleBoardDTO;
import style.bean.StyleListDTO;
import style.dao.StyleDAO;

@Service
public class StyleServiceImpl implements StyleService {
	@Autowired
	private StyleDAO styleDAO;
	
	@Override
	public List<StyleListDTO> getPopularList() {
		/*
		스타일 테이블
		private String styleId; //스타일 게시물 id
		private int userId; //회원번호
		private String contents; //스타일 게시물 내용
		private String styleImg; //스타일 게시물 썸네일 이미지 src
		private int like; //스타일 게시물 좋아요 갯수
		private int commentCount; //스타일 게시물 댓글 갯수 (집계 필요)
		private int productId; //게시물에 태그된 상품번호
		회원 테이블
		private String username; //회원 아이디
		private String userImg; //회원 프로필사진 src
		상품 테이블
		private String productName; //게시물에 태그된 상품명
		판매 테이블
		private int price; //판매 테이블에서 최저 가격 1개 추출 (조건)상품번호, 판매상태=0, 가격 오름차순
		*/
		
		//필요한 테이블의 데이터 list 뽑아오기
		List<StyleBoardDTO> styleBoardDTOList = styleDAO.getListOrderByPopularity();
		
		//전달할 객체에 담고, 그 객체를 list에 추가하기
		List<StyleListDTO> list = new ArrayList<StyleListDTO>();
		StyleListDTO styleListDTO;
		for(int i=0; i<10; i++) {  //페이징 객체 추가되면 조건식 변경
			styleListDTO = new StyleListDTO();
			
			//스타일 테이블 데이터
			int styleId = styleBoardDTOList.get(i).getStyleId();
			styleListDTO.setStyleId(styleId);
			int userId = styleBoardDTOList.get(i).getUserId();
			styleListDTO.setUserId(userId);
			styleListDTO.setContents(styleBoardDTOList.get(i).getContents());
			styleListDTO.setStyleImg(styleBoardDTOList.get(i).getImg1());
			styleListDTO.setLike(styleBoardDTOList.get(i).getLikeCount());
			styleListDTO.setCommentCount(styleDAO.totalComment(styleId));
			int productId = styleBoardDTOList.get(i).getProductId();
			styleListDTO.setProductId(productId);
			
			//회원 테이블 데이터
			Map<String, String> userDataMap = styleDAO.getUserData(userId);
			//System.out.println(userDataMap.toString());
			styleListDTO.setUsername(userDataMap.get("USERNAME"));
			styleListDTO.setUserImg(userDataMap.get("IMG"));
			
			//상품 테이블 데이터
			styleListDTO.setProductName(styleDAO.getProductNameByProductId(productId));
			
			//판매 테이블 데이터
			Integer price = styleDAO.getLowestPriceByProductId(productId);
			if (price == null) styleListDTO.setPrice(0);
			else styleListDTO.setPrice(price);
			
			list.add(styleListDTO);
		}
		
		return list;
	}
}
