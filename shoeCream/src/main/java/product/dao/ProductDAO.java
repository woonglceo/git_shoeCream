package product.dao;

import java.util.List;
import java.util.Map;

import product.bean.ProductDTO;

public interface ProductDAO {

	public List<ProductDTO> getProductList(Map<String, Integer> map);

	public int getTotalProduct();

	public List<ProductDTO> searchProduct(Map<String, Object> map);

	public int getSearchTotalProduct(Map<String, Object> map);

	public List<Object> getProductStock(Map<String, Object> map);

	public void getProductWrite(Map<String, Object> map);

	public void deleteProduct(String modelId);

	public List<ProductDTO> getProductInfo(String modelId);

}
