package style.dao;

import java.util.List;
import java.util.Map;

import style.bean.StyleBoardDTO;

public interface StyleDAO {

	public List<StyleBoardDTO> getListOrderByPopularity();

	public int totalComment(int styleId);

	public Map<String, String> getUserData(int userId);

	public String getProductNameByProductId(int productId);

	public Integer getLowestPriceByProductId(int productId);

}
