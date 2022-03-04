package admin.product.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Component
@RequestMapping(value="/adminViews/product")
public class ProductController {
	
	// 상품목록
	@GetMapping(value = "productList")
	public String productList(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/product/productList.jsp");
		return "/admin/adminIndex";
	}
	
	// 상품등록
	@GetMapping(value = "productWrite")
	public String productWrite(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/product/productWrite.jsp");
		return "/admin/adminIndex";
	}

}
