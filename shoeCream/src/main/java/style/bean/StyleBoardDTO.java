package style.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class StyleBoardDTO {
	private int styleId;
	private int userId;
	private int productId;
	private String title;
	private String contents;
	private int hit;
	private int likeCount;
	private int reportCount;
	private String img1;
	private String img2;
	private String img3;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "MM월dd일")
	private Date date;
}
