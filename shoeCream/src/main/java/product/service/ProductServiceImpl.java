package product.service;

import java.util.Date;
import java.util.List;

import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.bean.ProductPaging;
import product.bean.ProductDTO;
import product.dao.ProductDAO;


@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ProductPaging productPaging;
	@Autowired
	private ProductDTO productDTO;

	// 상품목록
	@Override
	public List<ProductDTO> getproductList(String pg) {
		int endNum = Integer.parseInt(pg) * 10;
		int startNum = endNum - 9;
		
		Map<String, Integer> map = new HashedMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return productDAO.getproductList(map);
	}

	// 상품목록 페이징
	@Override
	public ProductPaging productPaging(String pg) {
		int total = productDAO.getTotalProduct();

		productPaging.setCurrentPage(Integer.parseInt(pg));
		productPaging.setPageBlock(5);
		productPaging.setPageSize(10);
		productPaging.setTotalA(total);
		productPaging.makePagingHTML();
		
		return productPaging;
	}

	// 상품목록 검색
	@Override
	public List<ProductDTO> searchProduct(Map<String, Object> map) {
		int endNum = Integer.parseInt((String) map.get("searchPg")) * 10;
		int startNum = endNum - 9;
		
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return productDAO.searchProduct(map);
	}

	// 상품목록 검색 페이징
	@Override
	public ProductPaging searchProductPaging(Map<String, Object> map) {
		int total = productDAO.getSearchTotalProduct(map);

		productPaging.setCurrentPage(Integer.parseInt((String) map.get("searchPg")));
		productPaging.setPageBlock(5);
		productPaging.setPageSize(10);
		productPaging.setTotalA(total);
		productPaging.makePagingHTML();
		
		return productPaging;
	}

	// 상품등록
	@Override
	public void getProductWrite(Map<String, Object> map) {
		productDAO.getProductWrite(map);
	}
	
	// 상품 재고
	@Override
	public List<Object> getProductStock(Map<String, Object> map) {
		return productDAO.getProductStock(map);
	}
	
	// 삼풍삭제
	@Override
	public void deleteProduct(String modelId) {
		productDAO.deleteProduct(modelId);		
	}
	
	// 상품수정을 위한 상품정보
	@Override
	public List<ProductDTO> getProductInfo(String modelId) {
		return productDAO.getProductInfo(modelId);
	}
	
	// 상품수정
	@Override
	public void productUpdate(Map<String, Object> map) {		
		productDAO.productUpdate(map);
	}
	

		
}
