package admin.stock.service;

import java.util.List;

import admin.stock.bean.StockDTO;

public interface StockService {

	public List<StockDTO> getStockForm(String pg);

}
