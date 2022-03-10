package user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import user.bean.UserDTO;

public interface UserService {

	public List<UserDTO> getUserForm(String pg);

	public UserDTO getUserId(String userId);
	
	public String chkUsername(String username);
	
	public String chkNickname(String nickname);
	
	public String chkEmail(String email);

	public void joinOk(UserDTO userDTO);

	public String findUserOk(String phoneNum);

	public String loginOk(Map<String, String> map);
	
	public void logout();

	public String findPwdOk(Map<String, String> map);

	public Map<String, String> sendSMS(String phoneNum);

	public void updatePwd(Map<String, String> map);
	
	public int authEmail(String email) throws Exception;

	public String getAccessToken(String code);

	public HashMap<String, Object> getUserInfo(String access_Token);

	public void kakaoLogout(String accessToken);

	public void kakaoLoginOk(String email);

	public void joinSocialOk(UserDTO userDTO);

	public Map<String, String> authPhonNum(String phoneNum);

	

}
