package user.service;

import java.util.List;
import java.util.Map;

import user.bean.UserDTO;

public interface UserService {

	public List<UserDTO> getUserForm(String pg);

	public UserDTO getUserId(String userId);

	public String checkEmail(String email);

	public void signUp(UserDTO userDTO);

	public String findEmailOk(String phoneNum);

	public String signIn(Map<String, String> map);

}
