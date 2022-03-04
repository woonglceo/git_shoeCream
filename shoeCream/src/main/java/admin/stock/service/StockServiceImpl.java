package admin.stock.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import admin.stock.bean.StockDTO;
import admin.stock.dao.StockDAO;
import admin.user.bean.UserDTO;

@Service
public class StockServiceImpl implements StockService {

	@Autowired
	private StockDAO stockDAO;
	
	
	@Override
	public List<StockDTO> getStockForm(String pg) {
		Map<String, Integer> map = new HashMap<String, Integer>(); 
		map.put("pg", Integer.parseInt(pg));
		
		List<StockDTO> list = stockDAO.getStockForm(map);
		return list;
	}

}
