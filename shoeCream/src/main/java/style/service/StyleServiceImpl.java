package style.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import style.bean.StyleBoardDTO;
import style.bean.StyleCardDTO;
import style.dao.StyleDAO;

@Service
public class StyleServiceImpl implements StyleService {
	@Autowired
	private StyleDAO styleDAO;
	
	@Override
	public List<StyleCardDTO> getPopularList() {
		//style_board 테이블의 데이터를 정렬 기준(인기순)에 맞춰 list로 뽑아오기
		List<StyleBoardDTO> styleBoardDTOList = styleDAO.getListOrderByPopularity();
		
		//style_board 테이블 외의 테이블에서도 필요한 데이터를 뽑아 객체로 묶고, 리스트로 만들기
		List<StyleCardDTO> list = this.makeStyleCardDTOList(styleBoardDTOList);
		
		return list;
	}
	
	@Override
	public List<StyleCardDTO> getRecentList() {
		//style_board 테이블의 데이터를 정렬 기준(최신순)에 맞춰 list로 뽑아오기
		List<StyleBoardDTO> styleBoardDTOList = styleDAO.getListOrderByRecentDate();
		
		//style_board 테이블 외의 테이블에서도 필요한 데이터를 뽑아 객체로 묶고, 리스트로 만들기
		List<StyleCardDTO> list = this.makeStyleCardDTOList(styleBoardDTOList);
		
		return list;
	}
	
	@Override
	public Map<String, Object> getMyList(int userId) {
		// 총 작성 게시글 갯수
		int styleCount = styleDAO.totalMyStyle(userId);
		
		//style_board 테이블의 특정 회원의 데이터를 최신순으로 list 뽑아오기
		List<StyleBoardDTO> styleBoardDTOList = styleDAO.getMyList(userId);
		//style_board 테이블 외의 테이블에서도 필요한 데이터를 뽑아 객체로 묶고, 리스트로 만들기
		List<StyleCardDTO> list = this.makeStyleCardDTOList(styleBoardDTOList);
		
		//보내줄 map에 담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("styleCount", styleCount);
		map.put("list", list);
		return map;
	}
	
	// 정렬 기준(인기, 최신)에 맞춰 가져온 StyleBoardDTOList에 일부 데이터를 추가해 Style페이지 리스트 카드 목록 형태로 가공
	private List<StyleCardDTO> makeStyleCardDTOList(List<StyleBoardDTO> styleBoardDTOList){
		List<StyleCardDTO> list = new ArrayList<StyleCardDTO>();
		StyleCardDTO styleCardDTO;
		for(int i=0; i<styleBoardDTOList.size(); i++) {  //페이징 객체 추가되면 조건식 변경
			styleCardDTO = new StyleCardDTO();
			
			//스타일 테이블 데이터
			styleCardDTO.setStyleBoardDTO(styleBoardDTOList.get(i));
			int styleId = styleBoardDTOList.get(i).getStyleId();
			int userId = styleBoardDTOList.get(i).getUserId();
			int productId = styleBoardDTOList.get(i).getProductId();
			styleCardDTO.setCommentCount(styleDAO.totalComment(styleId)); //스타일 게시물 댓글 갯수 (집계 필요)
			
			//회원 테이블 데이터
			styleCardDTO.setUsername(styleDAO.getUserByUserId(userId).getUsername()); //회원 아이디
			styleCardDTO.setUserImg(styleDAO.getUserByUserId(userId).getImg()); //회원 프로필사진 src
			styleCardDTO.setIntroMsg(styleDAO.getUserByUserId(userId).getIntroMsg()); //소개메세지
			
			//상품 테이블 데이터
			styleCardDTO.setProductName(styleDAO.getProductByProductId(productId).getProductName()); //게시물에 태그된 상품명
			styleCardDTO.setImg1(styleDAO.getProductByProductId(productId).getImg1());
			
			//판매 테이블 데이터
			Integer price = styleDAO.getLowestPriceByProductId(productId); //판매 테이블에서 최저 가격 1개 추출 (조건)상품번호, 판매상태=0, 가격 오름차순
			if (price == null) styleCardDTO.setPrice(0);
			else styleCardDTO.setPrice(price);
			
			//댓글 테이블 데이터
			styleCardDTO.setStyleReplyList(styleDAO.getReplyList(styleId));
			
			//styleCardDTO 객체 list에 담기
			list.add(styleCardDTO);
		}
		return list;
	}
}
