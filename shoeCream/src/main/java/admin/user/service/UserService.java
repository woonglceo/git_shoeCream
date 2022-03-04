package admin.user.service;

import java.util.List;

import admin.user.bean.UserDTO;

public interface UserService {

	public List<UserDTO> getUserForm(String pg);

	public UserDTO getUserId(String userId);

}
