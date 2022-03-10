package style.dao;

import java.util.List;

import product.bean.ProductDTO;
import style.bean.StyleBoardDTO;
import style.bean.StyleReplyDTO;
import user.bean.UserDTO;

public interface StyleDAO {

	public List<StyleBoardDTO> getListOrderByPopularity();

	public int totalComment(int styleId);

	public UserDTO getUserByUserId(int userId);

	public ProductDTO getProductByProductId(int productId);

	public Integer getLowestPriceByProductId(int productId);

	public List<StyleBoardDTO> getListOrderByRecentDate();

	public int totalMyStyle(int userId);

	public List<StyleBoardDTO> getMyList(int userId);

	public List<StyleReplyDTO> getReplyList(int styleId);

}
