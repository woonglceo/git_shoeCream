package order.dao;

import java.util.List;
import java.util.Map;

import order.bean.OrderDTO;

public interface OrderDAO {

	public List<OrderDTO> getOrderList(Map<String, Integer> map);

	public OrderDTO getOrder(String orderId);

	public int getTotalCount();

	public List<OrderDTO> getOrderSearchList(Map<String, String> map);

//	public List<OrderDTO2> convertOrderDTO(OrderDTO o);

}
