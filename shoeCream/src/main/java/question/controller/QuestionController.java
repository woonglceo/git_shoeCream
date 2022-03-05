package question.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Component
@RequestMapping(value="/adminViews/question")
public class QuestionController {
	
	// 문의사항 기본 폼
	@GetMapping(value = "questionList")
	public String announce(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/question/questionList.jsp");
		return "/admin/adminIndex";
	}
	
	// 문의사항 개별보기 기본 폼
	@GetMapping(value = "questionView")
	public String questionView(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/question/questionView.jsp");
		return "/admin/adminIndex";
	}
		
	// 문의사항 답글작성 기본 폼
	@GetMapping(value = "questionWrite")
	public String questionWrite(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/question/questionWrite.jsp");
		return "/admin/adminIndex";
	}
}
