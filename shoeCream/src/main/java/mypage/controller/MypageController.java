package mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import account.bean.AccountDTO;
import mypage.service.MypageService;

@Controller
@RequestMapping(value="/my")
public class MypageController {
	@Autowired
	private MypageService mypageService;
	@Autowired
	private HttpSession session;
	
	//관심상품 페이지
	@RequestMapping(value="/wish")
	public String wish(@RequestParam(required=false, defaultValue = "1") String pg, Model model) {
		if(session.getAttribute("ssUserId") == null) return "/WEB-INF/views/login";
		else {
			int userId = (int) session.getAttribute("ssUserId");
			model.addAttribute("wishList", mypageService.getWishList(pg, userId)); 
			model.addAttribute("pg", pg);
			model.addAttribute("paging", mypageService.paging(pg, "wish_list", userId)); 
			model.addAttribute("pageName", "wish");
			model.addAttribute("display", "/WEB-INF/views/wish.jsp");
			return "/WEB-INF/views/mypage"; 
		}
	}
	
	//관심상품 페이지
	@RequestMapping(value="/deleteWish")
	@ResponseBody
	public void deleteWish(int wishListId) {
		mypageService.deleteWish(wishListId);
	}
	
	// 구매내역
	@GetMapping(value="/buying")
	public String buying(@RequestParam(required=false, defaultValue = "1") String pg, Model model) {
		if(session.getAttribute("ssUserId") == null) return "/WEB-INF/views/login";
		else {
		int userId = (int) session.getAttribute("ssUserId");
		// 5개씩 뽑아오기
		model.addAttribute("buyList", mypageService.getBuyList(pg, userId)); 
		model.addAttribute("totalCount", mypageService.getTotalBuying(userId));
		model.addAttribute("ingCount", mypageService.getIngBuying(userId));
		model.addAttribute("endCount", mypageService.getEndBuying(userId));
		model.addAttribute("pg", pg);
		model.addAttribute("paging", mypageService.paging(pg, "purchase_table", userId)); 
		model.addAttribute("pageName", "buying");
		model.addAttribute("display", "/WEB-INF/views/buying.jsp");
		return "/WEB-INF/views/mypage"; 
		}
	}
	
	/* 마이페이지 내정보 */
	@RequestMapping(value="myProfile")
	public String myProfile(Model model) {
		if(session.getAttribute("ssUserId") == null) return "/WEB-INF/views/login";
		else {
			int userId = (int) session.getAttribute("ssUserId");
			model.addAttribute("userDTO", mypageService.getUser(userId));
			model.addAttribute("pageName", "myProfile");
			model.addAttribute("display", "/WEB-INF/views/myProfile.jsp");
			return "/WEB-INF/views/mypage";			
		}
	}
	
	@RequestMapping(value="myAddress")
	public String myAddress(Model model) {
		if(session.getAttribute("ssUserId") == null) return "/WEB-INF/views/login";
		else {
			model.addAttribute("pageName", "myAddress");
			model.addAttribute("display", "/WEB-INF/views/myAddress.jsp");
			return "/WEB-INF/views/mypage";
		}
	}
	
	@RequestMapping(value="myAccount")
	public String myAccount(Model model) {
		if(session.getAttribute("ssUserId") == null) return "/WEB-INF/views/login";
		else {
			int userId = (int) session.getAttribute("ssUserId");
			model.addAttribute("accountDTO", mypageService.getAccount(userId));
			model.addAttribute("pageName", "myAccount");
			model.addAttribute("display", "/WEB-INF/views/myAccount.jsp");
			return "/WEB-INF/views/mypage";
		}
	}
	
	@RequestMapping(value="myStyle")
	public String myStyle(Model model) {
		if(session.getAttribute("ssUserId") == null) return "/WEB-INF/views/login";
		else {
			model.addAttribute("pageName", "myStyle");
			model.addAttribute("display", "/WEB-INF/views/myStyle.jsp");
			return "/WEB-INF/views/mypage";
		}
	}
	
	@RequestMapping(value="myWithdrawal")
	public String myWithdrawal(Model model) {
		if(session.getAttribute("ssUserId") == null) return "/WEB-INF/views/login";
		else {
			model.addAttribute("pageName", "myWithdrawal");
			model.addAttribute("display", "/WEB-INF/views/myWithdrawal.jsp");
			return "/WEB-INF/views/mypage";
		}
	}
	
	@RequestMapping(value="updateEmail")
	@ResponseBody
	public void updateEmail(@RequestParam String email) {
		mypageService.updateEmail(email);
	}
	
	@RequestMapping(value="updatePwd")
	@ResponseBody
	public void updatePwd(@RequestParam Map<String, String> map) {
		mypageService.updatePwd(map);
	}
	
	@RequestMapping(value="updateFullName")
	@ResponseBody
	public void updateFullName(@RequestParam String fullName) {
		mypageService.updateFullName(fullName);
	}
	
	@RequestMapping(value="updatePhoneNum")
	@ResponseBody
	public void updatePhoneNum(@RequestParam String phoneNum) {
		mypageService.updatePhoneNum(phoneNum);
		
	}
	
	@RequestMapping(value="updateAccount")
	@ResponseBody
	public void updateAccount(@ModelAttribute AccountDTO accountDTO) {
		mypageService.updateAccount(accountDTO);
	}
	
	
}
