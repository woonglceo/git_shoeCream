package style.bean;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import lombok.Data;

@Component
@Data
public class StyleCardDTO { 
	//스타일 테이블
	private StyleBoardDTO styleBoardDTO; 
	private int commentCount; //스타일 게시물 댓글 갯수 (집계 필요)

	//회원 테이블
	private String username; //회원 아이디
	private String userImg; //회원 프로필사진 src
	private String userIntroMsg; //소개글
	
	
	//상품 테이블
	private String productName; //게시물에 태그된 상품명
	private String productImg; //게시물에 태그된 상품 썸네일
	
	//판매 테이블
	private int price; //판매 테이블에서 최저 가격 1개 추출 (조건)상품번호, 판매상태=0, 가격 오름차순
	
	//댓글 테이블
	private List<Map<String, Object>> styleReplyList;
}
