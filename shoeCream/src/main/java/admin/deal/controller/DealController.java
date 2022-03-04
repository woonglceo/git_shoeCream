package admin.deal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.deal.bean.DealDTO;
import admin.deal.service.DealService;

@Controller
@RequestMapping(value="/admin/adminViews/order")
public class DealController {
	@Autowired
	private DealService dealService;
		
	@GetMapping(value="dealList")
	public String dealList(@RequestParam(required=false, defaultValue="1") String pg,
		      				Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/WEB-INF/adminViews/order/dealList.jsp");
		return "/admin/adminIndex";
	}
	
	@PostMapping(value="getDealList")
	@ResponseBody
	public Map<String, Object> getDealList(@RequestParam(required=false, defaultValue="1") String pg) {
		List<DealDTO> list = dealService.getDealList(pg);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("dealPaging", dealService.dealPaging(pg));
		
		return map;
	}
	
	@PostMapping(value="getDeal")
	@ResponseBody
	public DealDTO getDeal(@RequestParam String dealId) {
		return dealService.getDeal(dealId);
	}
	
	@PostMapping(value="getDealSearchList")
	@ResponseBody
	public Map<String, Object> getDealSearchList(@RequestParam Map<String, String> map, Model model) { //searchOption, keyword, pg(id=searchPg)
		System.out.println(map.get("searchOption")+", "+map.get("keyword")+", "+map.get("pg"));
		
		
		Map<String, Object> tempMap = new HashMap<String, Object>();
		tempMap.put("list", dealService.getDealSearchList(map));
		tempMap.put("dealPaging", dealService.dealPaging(map.get("pg")));
		
		return tempMap;
	}
}
