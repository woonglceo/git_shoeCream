package admin.order.service;

import java.util.List;

import admin.order.bean.OrderDTO;

public interface OrderService {

	public List<OrderDTO> getOrderList(String pg);
//	public List<OrderDTO2> getOrderList(String pg);

	public OrderDTO getOrder(String orderId);

}
