package user.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class UserDTO {
	private String userId;
	private String email;
	private String username;
	private String pwd;
	private String nickname;
	private int auth;
	private String phoneNum;
	private String introMsg;
	private int reportCount;
	private Date lastDate;
	private Date regDate;
}