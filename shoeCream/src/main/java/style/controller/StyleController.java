package style.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import style.bean.StyleCardDTO;
import style.service.StyleService;

@Controller
@RequestMapping(value="/style")
public class StyleController {
	@Autowired
	private StyleService styleService;
	
	//스타일 메뉴 메인화면 (인기순 목록)
	@RequestMapping(value="/styleList")
	public String styleList(Model model) {
		model.addAttribute("display", "/WEB-INF/views/style/styleList.jsp");
		return "/index";
	}
	
	//인기순 목록 데이터
	@RequestMapping(value="/getPopularList")
	@ResponseBody
	public List<StyleCardDTO> getPopularList() { 
		return styleService.getPopularList();
	}
	
	//최신순 목록
	@RequestMapping(value="/styleListRecent")
	public String styleListRecent(Model model) {
		model.addAttribute("display", "/WEB-INF/views/style/styleListRecent.jsp");
		return "/index";
	}
	
	//최신순 목록 데이터
	@RequestMapping(value="/getRecentList")
	@ResponseBody
	public List<StyleCardDTO> getRecentList() { 
		return styleService.getRecentList();
	}
	
	//글 상세
	@RequestMapping(value="/styleView")
	public String styleView(Model model) {
		model.addAttribute("display", "/WEB-INF/views/style/styleView.jsp");
		return "/index";
	}
	
	//개인피드 목록
	@RequestMapping(value="/styleMyList")
	public String styleMyList(Model model) {
		model.addAttribute("display", "/WEB-INF/views/style/styleMyList.jsp");
		return "/index";
	}
	
	//개인피드 목록 데이터
	@RequestMapping(value="/getMyList")
	@ResponseBody
	public Map<String, Object> getMyList(int userId) { 
		return styleService.getMyList(userId);
	}
}
