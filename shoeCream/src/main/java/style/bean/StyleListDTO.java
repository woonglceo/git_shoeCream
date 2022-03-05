package style.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class StyleListDTO {
	//스타일 테이블
	private int styleId; //스타일 게시물 id
	private int userId; //회원번호
	private String contents; //스타일 게시물 내용
	private String styleImg; //스타일 게시물 썸네일 이미지 src
	private int like; //스타일 게시물 좋아요 갯수
	private int commentCount; //스타일 게시물 댓글 갯수 (집계 필요)
	private int productId; //게시물에 태그된 상품번호
	
	//회원 테이블
	private String username; //회원 아이디
	private String userImg; //회원 프로필사진 src
	
	//상품 테이블
	private String productName; //게시물에 태그된 상품명
	
	//판매 테이블
	private int price; //판매 테이블에서 최저 가격 1개 추출 (조건)상품번호, 판매상태=0, 가격 오름차순
}
