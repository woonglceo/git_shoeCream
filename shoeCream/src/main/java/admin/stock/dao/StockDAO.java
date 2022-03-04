package admin.stock.dao;

import java.util.List;
import java.util.Map;

import admin.stock.bean.StockDTO;

public interface StockDAO {

	public List<StockDTO> getStockForm(Map<String, Integer> map);

}
