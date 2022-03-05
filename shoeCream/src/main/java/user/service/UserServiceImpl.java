package user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.bean.UserDTO;
import user.dao.UserDAO;

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
	

	@Override
	public String checkEmail(String email) {
		UserDTO userDTO = userDAO.getUser(email);

		if (userDTO == null)
			return "not_exist";
		else
			return "exist";
	}

	@Override
	public void signUp(UserDTO userDTO) {
		userDAO.signUp(userDTO);
	}

	@Override
	public String findEmailOk(String phoneNum) {
		String email = userDAO.findEmailOk(phoneNum);
		if(email==null)
			return "not_exist";
		else
			return userDAO.findEmailOk(phoneNum);
	}

	@Override
	public String signIn(Map<String, String> map) {
		UserDTO userDTO = userDAO.signIn(map);

		if (userDTO == null)
			return "fail";
		else
			return "success";
	}
	
}
