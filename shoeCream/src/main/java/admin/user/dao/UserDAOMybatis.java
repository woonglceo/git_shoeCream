package admin.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import admin.user.bean.UserDTO;

@Repository
@Transactional
public class UserDAOMybatis implements UserDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<UserDTO> getUserForm(Map<String, Integer> map) {
		return sqlSession.selectList("userSQL.getUserForm", map);
	}

	@Override
	public UserDTO getUserId(String userId) {
		return sqlSession.selectOne("userSQL.getUserId",userId);

	}

}
