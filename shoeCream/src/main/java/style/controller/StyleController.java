package style.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import style.bean.StyleListDTO;
import style.service.StyleService;

@Controller
@RequestMapping(value="/style")
public class StyleController {
	@Autowired
	private StyleService styleService;
	
	@RequestMapping(value="/getPopularList")
	@ResponseBody
	public List<StyleListDTO> getPopularList() { 
		return styleService.getPopularList();
	}
}
