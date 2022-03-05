package admin.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import admin.product.bean.ProductPaging;
import admin.product.bean.ProductDTO;
import admin.product.service.ProductService;

@Controller
@Component
@RequestMapping(value="/adminViews/product")
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductDTO productDTO;
	
	// 상품목록 기본 폼
	@GetMapping(value = "productList")
	public String productList(Model model, @RequestParam(required = false, defaultValue = "1") String pg) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/WEB-INF/adminViews/product/productList.jsp");
		return "/admin/adminIndex";
	}
	
	// 상품목록 리스트
	@PostMapping(value = "getproductList")
	@ResponseBody
	public Map<String, Object> getproductList(@RequestParam(required = false, defaultValue = "1") String pg) {
		Map<String, Object> map = new HashedMap<String, Object>();		
		
		// 리스트 뽑아오기
		List<ProductDTO> list = productService.getproductList(pg);
		// 페이징 처리하기
		ProductPaging productPaging = productService.productPaging(pg);

		map.put("productPaging", productPaging);
		map.put("list", list);
		return map;
	}
	
	// 상품등록 기본 폼
	@GetMapping(value = "productWrite")
	public String productWrite(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/product/productWrite.jsp");
		return "/admin/adminIndex";
	}
	
	// 상품등록
	@PostMapping(value = "getProductWrite")
	@ResponseBody
	public void getProductWrite(@RequestParam Map<String, Object> map, @RequestParam("img[]") List<MultipartFile> list, HttpSession session) {
		// 실제폴더에 업로드
		String filePath = session.getServletContext().getRealPath("/storage");
		String fileName; // 실제이름
		File file; // 파일 생성

		System.out.println(list.size());
		System.out.println(list);
		
		int count=0;
		for (MultipartFile img : list) {
			fileName = img.getOriginalFilename();
			file = new File(filePath, fileName);
			System.out.println(fileName);
			// 파일 이동
			try {
				img.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			count++;
			map.put("img" + count, fileName);

		} // end for
		System.out.println(map);
		productService.getProductWrite(map);
		
		
	}
	
	// 재고량 확인 기본 폼
	@GetMapping(value = "stockView")
	public String stockView(Model model, @RequestParam(required = false, defaultValue = "1") String pg, @ModelAttribute ProductDTO productDTO) {
		model.addAttribute("modelId", productDTO.getModelId());
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/WEB-INF/adminViews/product/stockView.jsp");
		return "/admin/adminIndex";
	}
	
	// 상품재고 불러오기
	@PostMapping(value = "getProductStock")
	@ResponseBody
	public List<Object> getProductStock(@RequestParam Map<String, Object> map) {	
		List<Object> list =  productService.getProductStock(map);	
		return list;
	}
	
	// 상품 검색
	@PostMapping(value = "searchProduct")
	@ResponseBody
	public Map<String, Object> searchProduct(@RequestParam Map<String, Object> map){		
		//페이징처리
		ProductPaging productPaging = productService.searchProductPaging(map);
		// 검색 결과 리스트
		List<ProductDTO> list = productService.searchProduct(map);

		// data로 보낼 결과물
		Map<String, Object> map2 = new HashMap<String, Object>();
		// 검색 결과 리스트
		map2.put("list", list);
		// 페이징처리의 결과 값
		map2.put("productPaging", productPaging);
		return map2;
	}
	
	// 상품 삭제
	@GetMapping(value = "deleteProduct")
	public String deleteProduct(@RequestParam String modelId, Model model) {		
		productService.deleteProduct(modelId);
		
		model.addAttribute("display", "/WEB-INF/adminViews/product/productList.jsp");
		return "/admin/adminIndex";
	}
	
	// 상품수정 폼
	@GetMapping(value = "updateProduct")
	public String updateProduct(@RequestParam String modelId,@RequestParam String pg, Model model) {		
		
		model.addAttribute("pg", pg);
		model.addAttribute("modelId", modelId);
		model.addAttribute("display", "/WEB-INF/adminViews/product/productUpdate.jsp");
		return "/admin/adminIndex";
	}
	
	// 상품수정을 위한 상품정보
	@PostMapping(value = "getProductInfo")
	@ResponseBody
	public Map<String, Object> getProductInfo(@RequestParam String modelId){	
		List<ProductDTO> list = productService.getProductInfo(modelId);
		Map<String, Object> map = new HashMap<String, Object>();
		
		for(ProductDTO productDTO : list) {
			map.put("productDTO", productDTO);
		}
		
		return map;
	}
	

}
