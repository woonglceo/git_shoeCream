package user.dao;

import java.util.List;
import java.util.Map;

import user.bean.UserDTO;

public interface UserDAO {

	public List<UserDTO> getUserForm(Map<String, Integer> map);

	public UserDTO getUserId(String userId);
	
	public UserDTO chkUsername(String username);

	public UserDTO chkNickname(String nickname);
	
	public UserDTO chkEmail(String email);

	public void joinOk(UserDTO userDTO);

	public String findUserOk(String phoneNum);

	public UserDTO chkUserPwd(Map<String, String> map);
	
	public void loginOk(String email);
	
	public UserDTO findPwdOk(Map<String, String> map);

	public void updatePwd(Map<String, String> map);

	public UserDTO chkAccessToken(String access_Token);

	public void joinSocialOk(UserDTO userDTO);

	public void kakaoLoginOk(String email);

	
}
