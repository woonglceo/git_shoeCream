package content.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component
public class AnnounceDTO {
	private int announceId;
	private String title;
	private String contents;
	private int hit;
	private String img1;
	private String img2;
	private String img3;
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date regDate;
}