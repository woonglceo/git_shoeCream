package serviceCenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/serviceCenter")
public class ServiceCenterController {
	
	@RequestMapping(value="/notice")
	public String notice(Model model) {
		return "/WEB-INF/views/serviceCenter"; 
	}
	
	@RequestMapping(value="/notice2")
	public String notice2(Model model) {
		return "/WEB-INF/views/notice";
	}
	
	@RequestMapping(value="faq")
	public String faq(Model model) {
		return "/WEB-INF/views/faq";
	}
	
	@RequestMapping(value="noticeDetail")
	public String noticeDetail(Model model) {
		return "/WEB-INF/views/noticeDetail";
	}
	
}
