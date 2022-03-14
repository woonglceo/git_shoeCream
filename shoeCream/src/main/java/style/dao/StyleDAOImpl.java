package style.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import product.bean.ProductDTO;
import style.bean.StyleBoardDTO;
import style.bean.StyleReplyDTO;
import user.bean.UserDTO;

@Repository
public class StyleDAOImpl implements StyleDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<StyleBoardDTO> getListOrderByPopularity() {
		return sqlSession.selectList("styleSQL.getListOrderByPopularity");
	}
	
	@Override
	public List<StyleBoardDTO> getListOrderByRecentDate() {
		return sqlSession.selectList("styleSQL.getListOrderByRecentDate");
	}
	
	@Override
	public List<StyleBoardDTO> getMyList(int userId) {
		return sqlSession.selectList("styleSQL.getMyList", userId);
	}
	
	@Override
	public int totalComment(int styleId) {
		return sqlSession.selectOne("styleSQL.totalComment", styleId);
	}
	
	@Override
	public int totalMyStyle(int userId) {
		return sqlSession.selectOne("styleSQL.totalMyStyle", userId);
	}
	
	@Override
	public UserDTO getUserByUserId(int userId) {
		return sqlSession.selectOne("styleSQL.getUserByUserId", userId);
	}
	
	@Override
	public int getUserIdByUsername(String username) {
		return sqlSession.selectOne("styleSQL.getUserIdByUsername", username);
	}
	
	@Override
	public ProductDTO getProductByProductId(int productId) {
		return sqlSession.selectOne("styleSQL.getProductByProductId", productId);
	}
	
	@Override
	public Integer getLowestPriceByProductId(int productId) {
		return sqlSession.selectOne("styleSQL.getLowestPriceByProductId", productId);
	}
	
	@Override
	public List<StyleReplyDTO> getReplyList(int styleId) {
		return sqlSession.selectList("styleSQL.getReplyList", styleId);
	}

	// 관리자
	@Override
	public List<StyleBoardDTO> getStyleList(Map<String, Object> map) {
		return sqlSession.selectList("styleSQL.getStyleList", map);
	}
	
	@Override
	public int getTotalStyle(String option) {
		return sqlSession.selectOne("styleSQL.getTotalStyle", option);
	}
	
	@Override
	public List<StyleBoardDTO> searchStyleList(Map<String, Object> map) {
		return sqlSession.selectList("styleSQL.searchStyleList", map);
	}
	
	@Override
	public int getTotalSearchStyle(Map<String, Object> map) {
		return sqlSession.selectOne("styleSQL.getTotalSearchStyle", map);
	}
	
	@Override
	public void deleteStyle(String styleId) {
		sqlSession.delete("styleSQL.deleteStyle",Integer.parseInt(styleId));
	}

}
