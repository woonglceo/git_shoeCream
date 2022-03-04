package admin.order.dao;

import java.util.List;
import java.util.Map;

import admin.order.bean.OrderDTO;

public interface OrderDAO {

	public List<OrderDTO> getOrderList(Map<String, Integer> map);

	public OrderDTO getOrder(String orderId);

}
