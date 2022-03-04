package admin.order.service;

import java.util.List;
import java.util.Map;

import admin.order.bean.OrderDTO;
import admin.order.bean.OrderDTO2;
import admin.order.bean.OrderPaging;

public interface OrderService {

	public List<OrderDTO> getOrderList(String pg);
//	public List<OrderDTO2> getOrderList(String pg);

	public OrderDTO getOrder(String orderId);

	public OrderPaging orderPaging(String pg);
	public OrderPaging orderPaging(Map<String, String> map);

	public List<OrderDTO> getOrderSearchList(Map<String, String> map);

//	public List<OrderDTO2> convertOrderDTO(OrderDTO orderDTO);


}
