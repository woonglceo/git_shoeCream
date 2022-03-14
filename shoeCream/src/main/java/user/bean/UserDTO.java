package user.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class UserDTO {
	private int userId;
	private String username;
	private String pwd;
	private String fullName;
	private String email;
	private String phoneNum;
	private int auth;
	private String introMsg;
	private String img;
	private int reportCount;
	private String accessToken;
	private String platformType;
	private Date lastDate;
	private Date regDate;
}