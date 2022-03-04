package admin.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.order.bean.OrderDTO;
import admin.order.service.OrderService;

@Controller
@RequestMapping(value="/admin/adminViews/order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@GetMapping(value="orderList")
	public String orderView(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/order/orderList.jsp");
		return "/admin/adminIndex";
	}
	
	@PostMapping(value="getOrderList")
	@ResponseBody
	public List<OrderDTO> getOrderList(@RequestParam(required=false, defaultValue="1") String pg) {
		List<OrderDTO> list = orderService.getOrderList(pg);
		return list;
	}
	
	@PostMapping(value="getOrder")
	@ResponseBody
	public OrderDTO getOrder(@RequestParam String orderId) {
		return orderService.getOrder(orderId);
	}
}	
