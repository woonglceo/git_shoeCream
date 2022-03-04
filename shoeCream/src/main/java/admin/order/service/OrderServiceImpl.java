package admin.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.order.bean.OrderDTO;
import admin.order.bean.OrderDTO2;
import admin.order.dao.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDAO;	

/*
	@Autowired
	private UserService userService;
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private ProductService productService;
	@Autowired
	private DeliveryService deliveryService;
	@Autowired
	private AddressService addressService;
	
	
	@Override
	public List<OrderDTO2> getOrderList(String pg) {
		Map<String, Integer> map = new HashMap<String, Integer>(); 
		map.put("pg", Integer.parseInt(pg));
		
		List<OrderDTO> list = orderDAO.getOrderList(map);
		List<OrderDTO2> list2 = new ArrayList<OrderDTO2>();
		
		
		for(OrderDTO o : list) {
			OrderDTO2 o2 = new OrderDTO2();
			o2.setOrderId(o.getOrderId());
			o2.setUserDTO(userService.getUser(o.getUserId()));
			o2.setPaymentDTO(paymentService.getPayment(o.getPaymentId()));
			o2.setProductDTO(productService.getProduct(o.getProductId()));
			o2.setDeliveryDTO(deliveryService.getDelivery(o.getDeliveryId()));
			o2.setAddressDTO(addressService.getAddress(o.getAddressId()));
			o2.setOrderDate(o.getOrderDate());
			o2.setPhoneNum(o.getPhoneNum());
			
			list2.add(o2);
		}
		
		return list2;
	}
*/

	@Override
	public List<OrderDTO> getOrderList(String pg) {
		Map<String, Integer> map = new HashMap<String, Integer>(); 
		map.put("pg", Integer.parseInt(pg));
		
		List<OrderDTO> list = orderDAO.getOrderList(map);
		System.out.println("orderService list: "+list);
		return list;
	}
	
	@Override
	public OrderDTO getOrder(String orderId) {
		return orderDAO.getOrder(orderId);
	}
}
