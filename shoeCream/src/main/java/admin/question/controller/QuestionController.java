package admin.question.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Component
@RequestMapping(value="/adminViews/question")
public class QuestionController {
	
	// 공지사항
	@GetMapping(value = "questionList")
	public String announce(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/question/questionList.jsp");
		return "/admin/adminIndex";
	}
}
