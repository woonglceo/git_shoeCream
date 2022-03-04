package admin.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import admin.order.bean.OrderDTO;

@Repository
@Transactional
public class OrderDAOMybatis implements OrderDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<OrderDTO> getOrderList(Map<String, Integer> map) {
		return sqlSession.selectList("orderSQL.getOrderList", map);
	}
	
	@Override
	public OrderDTO getOrder(String orderId) {
		return sqlSession.selectOne("orderSQL.getOrder", Integer.parseInt(orderId));
	}
}
