package admin.user.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class UserDTO {

	private int userId;
	private String email;
	private String username;
	private String pwd;
	private String nickname;
	private int auth;
	private int phonenum;
	private String introMsg;
	private int reportCount;
	private Date lastDate;
	private Date regDate;

}
