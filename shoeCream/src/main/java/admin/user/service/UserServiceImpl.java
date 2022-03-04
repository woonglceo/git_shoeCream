package admin.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.user.bean.UserDTO;
import admin.user.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;	
	
	
	@Override
	public List<UserDTO> getUserForm(String pg) {
		Map<String, Integer> map = new HashMap<String, Integer>(); 
		map.put("pg", Integer.parseInt(pg));
		
		List<UserDTO> list = userDAO.getUserForm(map);
		System.out.println("userService list: "+list);
		return list;
	}

	@Override
	public UserDTO getUserId(String userId) {
		return userDAO.getUserId(userId);
	}

	/*@Override
	public UserDTO getUser(String userId) {
		// TODO Auto-generated method stub
		return null;
	}*/

}
