package style.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import style.bean.StyleBoardDTO;
import style.bean.StyleBoardPaging;
import style.bean.StyleCardDTO;
import style.bean.StyleReplyDTO;
import style.dao.StyleDAO;
import user.bean.UserDTO;

@Service
public class StyleServiceImpl implements StyleService {
	@Autowired
	private StyleDAO styleDAO;
	private SimpleDateFormat sdf = new SimpleDateFormat("M월d일H시"); 
	@Autowired
	private StyleBoardPaging styleBoardPaging; 
	
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
	public Map<String, Object> getUserFeed(String username) {
		int userId = styleDAO.getUserIdByUsername(username);
		return this.getUserFeed(userId);
	}
	
	@Override
	public Map<String, Object> getUserFeed(int userId) {
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
			UserDTO userDTO = styleDAO.getUserByUserId(userId);
			styleCardDTO.setUsername(userDTO.getUsername()); //회원 아이디
			styleCardDTO.setUserImg(userDTO.getImg()); //회원 프로필사진 src
			styleCardDTO.setUserIntroMsg(userDTO.getIntroMsg()); //소개메세지
			
			//상품 테이블 데이터
			styleCardDTO.setProductName(styleDAO.getProductByProductId(productId).getProductName()); //게시물에 태그된 상품명
			styleCardDTO.setProductImg(styleDAO.getProductByProductId(productId).getImg1());
			
			//판매 테이블 데이터
			Integer price = styleDAO.getLowestPriceByProductId(productId); //판매 테이블에서 최저 가격 1개 추출 (조건)상품번호, 판매상태=0, 가격 오름차순
			if (price == null) styleCardDTO.setPrice(0);
			else styleCardDTO.setPrice(price);
			
			//댓글 리스트
			styleCardDTO.setStyleReplyList(this.makeStyleReplyList(styleId)); 
			
			//styleCardDTO 객체 list에 담기
			list.add(styleCardDTO);
		}
		return list;
	}

	@Override
	public List<StyleBoardDTO> getStyleList(String pg, String option) {
		int endNum = Integer.parseInt(pg) * 10;
		int startNum = endNum - 9;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("option", option);
			
		return styleDAO.getStyleList(map);
	}
	
	// 댓글 작성자 프로필 사진을 포함한 댓글 리스트 리턴
	private List<Map<String, Object>> makeStyleReplyList(int styleId){
		List<Map<String, Object>> styleReplyList = new ArrayList<Map<String,Object>>(); //리턴할 댓글정보 list
		
		List<StyleReplyDTO> list = styleDAO.getReplyList(styleId); //게시글에 달린 댓글 list
		Map<String, Object> reply; //댓글DTO+프로필사진 담을 MAP
		
		for(StyleReplyDTO styleReplyDTO : list) {
			reply = new HashMap<String, Object>();
			reply.put("styleReplyId", styleReplyDTO.getStyleReplyId());
			int userId = styleReplyDTO.getUserId();
			reply.put("userId", userId);
			reply.put("replyUserImg", styleDAO.getUserByUserId(userId).getImg());
			reply.put("contents", styleReplyDTO.getContents());
			reply.put("reportCount", styleReplyDTO.getReportCount());
			Date regDate = styleReplyDTO.getRegDate();
			reply.put("regDate", sdf.format(regDate));
			
			styleReplyList.add(reply);
		}
		
		return styleReplyList;
	}
	@Override
	public StyleBoardPaging styleBoardPaging(String pg, String option) {
		int total = styleDAO.getTotalStyle(option);

		styleBoardPaging.setCurrentPage(Integer.parseInt(pg));
		styleBoardPaging.setPageBlock(5);
		styleBoardPaging.setPageSize(10);
		styleBoardPaging.setTotalA(total);
		styleBoardPaging.makePagingHTML();
		
		return styleBoardPaging;
	}
	
	@Override
	public List<StyleBoardDTO> searchStyleList(Map<String, Object> map) {
		int endNum = Integer.parseInt(map.get("searchPg") + "") * 10;
		int startNum = endNum - 9;

		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return styleDAO.searchStyleList(map);
	}
	
	@Override
	public StyleBoardPaging searchStyleBoardPaging(Map<String, Object> map) {
		int total = styleDAO.getTotalSearchStyle(map);

		styleBoardPaging.setCurrentPage(Integer.parseInt(map.get("searchPg") + ""));
		styleBoardPaging.setPageBlock(5);
		styleBoardPaging.setPageSize(10);
		styleBoardPaging.setTotalA(total);
		styleBoardPaging.makePagingHTML();
		
		return styleBoardPaging;
	}
	
	@Override
	public void deleteStyle(String styleId) {
		styleDAO.deleteStyle(styleId);
	}
	
	@Override
	public void deletStyleList(String[] checkBoxArr) {
		for(String styleId : checkBoxArr) {
			styleDAO.deleteStyle(styleId);
		}
	}
	
}
