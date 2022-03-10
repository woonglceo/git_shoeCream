package style.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class StyleReplyDTO {
	private int styleReplyId;
	private int styleId;
	private int userId;
	private String contents;
	private int reportCount;
	@JsonFormat(pattern = "M월d일H시", timezone = "Asia/Seoul")
	private Date regDate;
}
