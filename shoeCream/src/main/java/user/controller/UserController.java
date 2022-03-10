package user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

	@GetMapping(value = "/joinSocial")
	public String joinSocial() {
		return "/WEB-INF/views/joinSocial";
	}

	@PostMapping(value = "/chkUsername")
	@ResponseBody
	public String chkUsername(@RequestParam String username) {
		return userService.chkUsername(username);
	}

	@PostMapping(value = "/chkNickname")
	@ResponseBody
	public String chkNickname(@RequestParam String nickname) {
		return userService.chkNickname(nickname);
	}

	@PostMapping(value = "/chkEmail")
	@ResponseBody
	public String chkEmail(@RequestParam String email) {
		return userService.chkEmail(email);
	}

	@PostMapping(value = "/joinOk")
	@ResponseBody
	public void joinOk(@ModelAttribute UserDTO userDTO) {
		userService.joinOk(userDTO);
	}

	@GetMapping(value = "/login")
	public String login() {
		return "/WEB-INF/views/login";
	}

	@PostMapping(value = "/loginOk")
	@ResponseBody
	public String loginOk(@RequestParam Map<String, String> map) {
		return userService.loginOk(map);
	}

	@GetMapping(value = "/logout")
	public String logout(HttpSession session) {
		String accessToken = (String) session.getAttribute("access_Token");

		if (accessToken != null) {
			// 카카오 로그인할 때 세션에 담아둔 토큰을 꺼내서 로그아웃 메서드를 실행
			userService.kakaoLogout(accessToken);
		} else {
			userService.logout();
		}
		return "/index";
	}

	@GetMapping(value = "/findUser")
	public String findUser() {
		return "/WEB-INF/views/findUser";
	}

	@PostMapping(value = "/findUserOk")
	@ResponseBody
	public String findUserOk(@RequestParam String phoneNum) {
		return userService.findUserOk(phoneNum);
	}

	@PostMapping(value = "/findUserResult")
	public String findUserResult(@RequestParam String username, Model model) {
		model.addAttribute("username", username);
		return "/WEB-INF/views/findUserResult";
	}

	@GetMapping(value = "/findPwd")
	public String findPwd() {
		return "/WEB-INF/views/findPwd";
	}

	@PostMapping(value = "/findPwdOk")
	@ResponseBody
	public String findPwdOk(@RequestParam Map<String, String> map) {
		return userService.findPwdOk(map);
	}

	@PostMapping(value = "/sendSMS")
	@ResponseBody
	public Map<String, String> sendSMS(@RequestParam String phoneNum) {
		return userService.sendSMS(phoneNum);
	}

	@PostMapping(value = "/updatePwd")
	@ResponseBody
	public void updatePwd(@RequestParam Map<String, String> map) {
		userService.updatePwd(map);
	}

	@GetMapping(value = "/findPwdResult")
	public String findPwdResult() {
		return "/WEB-INF/views/findPwdResult";
	}

	@PostMapping(value = "/authEmail")
	@ResponseBody
	public int authEmail(@RequestParam String email) throws Exception {
		return userService.authEmail(email);
	}

	/* 서비스 호출 및 사용자 정보 출력 */
	@GetMapping(value = "/kakaoLogin")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model,
			HttpSession session) throws Exception {

		System.out.println("#########" + code);

		// 위에서 만든 코드 아래에 추가
		String access_Token = userService.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);

		// 위에서 만든 코드 아래에 코드 추가
		HashMap<String, Object> userInfo = userService.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###profile_image#### : " + userInfo.get("profile_image"));
		System.out.println("###email#### : " + userInfo.get("email"));

		String email = userService.chkEmail((String) userInfo.get("email"));

		if (email == "not_exist") {
			model.addAttribute("userInfo", userInfo);
			model.addAttribute("accessToken", access_Token);
			return "/WEB-INF/views/joinSocial";

		} else {
			// DB에 클라이언트의 정보가 존재할 때 세션에 해당 이메일과 토큰 등록
			userService.kakaoLoginOk(email);
			session.setAttribute("ssUser", email);
			session.setAttribute("accessToken", access_Token);
			return "/index";
		}
	}

	@PostMapping(value = "/joinSocialOk")
	@ResponseBody
	public void joinSocialOk(@ModelAttribute UserDTO userDTO, HttpSession session) {
		session.setAttribute("ssUser", userDTO.getEmail());
		session.setAttribute("accessToken", userDTO.getAccessToken());
		userService.joinSocialOk(userDTO);
	}

	// 휴대폰 본인인증
	@PostMapping(value = "/authPhoneNum")
	@ResponseBody
	public Map<String, String> authPhoneNum(@RequestParam("phoneNum") String phoneNum) throws Exception {
		return userService.authPhonNum(phoneNum);
	}

}
