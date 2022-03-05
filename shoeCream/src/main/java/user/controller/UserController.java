package user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import user.bean.UserDTO;
import user.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	private UserService userService;

	@GetMapping(value = "/join")
	public String join() {
		return "/WEB-INF/views/join";
	}

	@GetMapping(value = "/join_social")
	public String socialjoin() {
		return "/WEB-INF/views/join_social";
	}

	@PostMapping(value = "/checkEmail")
	@ResponseBody
	public String checkEmail(@RequestParam String email) {
		return userService.checkEmail(email);
	}

	@PostMapping(value = "/signUp")
	@ResponseBody
	public void signUp(@ModelAttribute UserDTO userDTO) {
		userService.signUp(userDTO);
	}

	@GetMapping(value = "/login")
	public String login() {
		return "/WEB-INF/views/login";
	}

	@PostMapping(value = "signIn")
	@ResponseBody
	public String signIn(@RequestParam Map<String, String> map) {
		return userService.signIn(map);
	}

	@GetMapping(value = "/find_email")
	public String findEmail() {
		return "/WEB-INF/views/find_email";
	}

	@PostMapping(value = "/find_email_ok")
	@ResponseBody
	public String findEmailOk(@RequestParam String phoneNum) {
		return userService.findEmailOk(phoneNum);
	}

	@GetMapping(value = "find_email_success")
	public String findEmailResult(@RequestParam String email, Model model) {
		model.addAttribute("email", email);
		return "/WEB-INF/views/find_email_success";
	}

	@GetMapping(value = "/find_password")
	public String findPassword() {

		return "/WEB-INF/views/find_password";
	}

	/*
	 * @GetMapping(value="/find_password_result") public String findPasswordResult()
	 * { return "/WEB-INF/views/find_password_result"; }
	 */

}
