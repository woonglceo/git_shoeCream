package admin.user.dao;

import java.util.List;
import java.util.Map;

import admin.user.bean.UserDTO;

public interface UserDAO {

	public List<UserDTO> getUserForm(Map<String, Integer> map);

	public UserDTO getUserId(String userId);

}
