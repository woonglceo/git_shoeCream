package mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mypage.bean.WishListDTO;

@Repository
public class MypageDAOImpl implements MypageDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<WishListDTO> getWishList(Map<String, Integer> map) {
		return sqlSession.selectList("mypageSQL.getWishList", map);
	}
	
	@Override
	public int getTotalDB(Map<String, Object> map) {
		return sqlSession.selectOne("mypageSQL.getTotalDB", map);
	}
	
	@Override
	public void deleteWish(int wishListId) {
		sqlSession.delete("mypageSQL.deleteWish", wishListId);
	}
}
