package style.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import style.bean.StyleListDTO;
import style.service.StyleService;

@Controller
@RequestMapping(value="/style")
public class StyleController {
	@Autowired
	private StyleService styleService;
	
	@GetMapping(value="styleList")
	public String styleList(Model model) {
		model.addAttribute("display", "/WEB-INF/views/style/styleList.jsp");
		return "/index";
	}
	
	@GetMapping(value="styleMyList")
	public String styleMyList(Model model) {
		model.addAttribute("display", "/WEB-INF/views/style/styleMyList.jsp");
		return "/index";
	}

	@GetMapping(value="styleView")
	public String styleView(Model model) {
		model.addAttribute("display", "/WEB-INF/views/style/styleView.jsp");
		return "/index";
	}
	
	@PostMapping(value="/getPopularList")
	@ResponseBody
	public List<StyleListDTO> getPopularList() { 
		return styleService.getPopularList();
	}
}
