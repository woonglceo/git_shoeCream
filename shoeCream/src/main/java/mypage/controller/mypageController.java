package mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mypage.service.MypageService;

@Controller
@RequestMapping(value="/my")
public class mypageController {
	@Autowired
	private MypageService mypageService;
	
	//관심상품 페이지
	@RequestMapping(value="/wish")
	public String wish(@RequestParam(required=false, defaultValue = "1") String pg, @RequestParam(required=false, defaultValue = "1") int userId, Model model) {
		model.addAttribute("wishList", mypageService.getWishList(pg, userId)); //로그인 완료되면 세션값으로 받아오기
		model.addAttribute("pg", pg);
		model.addAttribute("paging", mypageService.paging(pg, "wish_list", userId)); //로그인 완료되면 세션값으로 받아오기
		model.addAttribute("pageName", "wish");
		model.addAttribute("display", "/WEB-INF/views/wish.jsp");
		return "/WEB-INF/views/mypage"; 
	}
	
	//관심상품 페이지
	@RequestMapping(value="/deleteWish")
	@ResponseBody
	public void deleteWish(int wishListId) {
		mypageService.deleteWish(wishListId);
	}
}
