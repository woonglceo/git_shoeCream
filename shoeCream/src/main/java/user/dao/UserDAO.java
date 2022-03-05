package user.dao;

import java.util.List;
import java.util.Map;

import user.bean.UserDTO;

public interface UserDAO {

	public List<UserDTO> getUserForm(Map<String, Integer> map);

	public UserDTO getUserId(String userId);

	public UserDTO getUser(String email);

	public void signUp(UserDTO userDTO);

	public String findEmailOk(String phoneNum);

	public UserDTO signIn(Map<String, String> map);
	
}
