package product.service;

import java.util.List;
import java.util.Map;

import product.bean.ProductDTO;
import product.bean.ProductPaging;

public interface ProductService {

	public List<ProductDTO> getProductList(String pg);

	public ProductPaging productPaging(String pg);

	public ProductPaging searchProductPaging(Map<String, Object> map);

	public List<ProductDTO> searchProduct(Map<String, Object> map);

	public List<Object> getProductStock(Map<String, Object> map);

	public void getProductWrite(Map<String, Object> map);

	public void deleteProduct(String modelId);

	public List<ProductDTO> getProductInfo(String modelId);


}
