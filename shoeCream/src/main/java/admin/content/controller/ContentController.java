package admin.content.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Component
@RequestMapping(value="/adminViews/content")
public class ContentController {
	
	// 공지사항
	@GetMapping(value = "announceList")
	public String announce(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/content/announceList.jsp");
		return "/admin/adminIndex";
	}
	
	// 이벤트
	@GetMapping(value = "eventList")
	public String eventList(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/content/eventList.jsp");
		return "/admin/adminIndex";
	}
	
	// 게시글
	@GetMapping(value = "styleList")
	public String styleList(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/content/styleList.jsp");
		return "/admin/adminIndex";
	}
	
	// 공지사항 작성
	@GetMapping(value = "announceWrite")
	public String announceWrite(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/content/announceWrite.jsp");
		return "/admin/adminIndex";
	}
		
	// 이벤트 작성
	@GetMapping(value = "eventWrite")
	public String eventWrite(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/content/eventWrite.jsp");
		return "/admin/adminIndex";
	}
	

}
