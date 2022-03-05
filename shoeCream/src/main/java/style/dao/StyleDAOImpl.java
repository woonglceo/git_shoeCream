package style.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import style.bean.StyleBoardDTO;

@Repository
public class StyleDAOImpl implements StyleDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<StyleBoardDTO> getListOrderByPopularity() {
		return sqlSession.selectList("styleSQL.getStyleBoardDTOList");
	}
	
	@Override
	public int totalComment(int styleId) {
		return sqlSession.selectOne("styleSQL.totalComment", styleId);
	}
	
	@Override
	public Map<String, String> getUserData(int userId) {
		return sqlSession.selectOne("styleSQL.getUserData", userId);
	}
	
	@Override
	public String getProductNameByProductId(int productId) {
		return sqlSession.selectOne("styleSQL.getProductNameByProductId", productId);
	}
	
	@Override
	public Integer getLowestPriceByProductId(int productId) {
		return sqlSession.selectOne("styleSQL.getLowestPriceByProductId", productId);
	}
}
