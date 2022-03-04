package admin.user.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.user.bean.UserDTO;
import admin.user.service.UserService;


@Controller
@RequestMapping(value = "/adminViews/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	// 유저목록
	@GetMapping(value="userForm")
	public String userForm(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/user/userForm.jsp");
		return "/admin/adminIndex";
	}
	
	// 유저 상세보기
	@GetMapping(value="userView")
	public String userView(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/user/userView.jsp");
		return "/admin/adminIndex";
	}
	
	// 문의사항
	@GetMapping(value = "releaseList")
	public String releaseList(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/user/releaseList.jsp");
		return "/admin/adminIndex";
	}
	
	// 구매내역
	@GetMapping(value = "purchaseHistory")
	public String purchaseHistory(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/user/purchaseHistory.jsp");
		return "/admin/adminIndex";
	}
	
	// 판매내역
	@GetMapping(value = "sellHistory")
	public String sellHistory(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/user/sellHistory.jsp");
		return "/admin/adminIndex";
	}
	
	
	@PostMapping(value="getUserForm")
	@ResponseBody
	public List<UserDTO> getUserForm(@RequestParam(required=false, defaultValue="1") String pg) {
		System.out.println("pg: "+pg);
		List<UserDTO> list = userService.getUserForm(pg);
		System.out.println("list: "+list);
		return list;
	}
	
	/*
	 * // 1개값
	 * 
	 * @PostMapping(value="getUser")
	 * 
	 * @ResponseBody public UserDTO getUser(@RequestParam String UserId) { return
	 * userService.getUser(UserId); }
	 */
	
	
	// ajax에서 getUserId값 넘겨주기 위해 사용
	@PostMapping(value="getUserId")
	@ResponseBody
	public UserDTO getUserId(@RequestParam String userId) {
		return userService.getUserId(userId);
	}
	

	
	
	
	
	
	
	
}
