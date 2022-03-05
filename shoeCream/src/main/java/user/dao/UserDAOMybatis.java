package user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import user.bean.UserDTO;

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

	@Override
	public UserDTO getUser(String email) {
		return sqlSession.selectOne("userSQL.getUser", email);
	}

	@Override
	public void signUp(UserDTO userDTO) {
		sqlSession.insert("userSQL.signUp", userDTO);
	}

	@Override
	public String findEmailOk(String phoneNum) {
		return sqlSession.selectOne("userSQL.findEmailOk", phoneNum);
	}

	@Override
	public UserDTO signIn(Map<String, String> map) {
		return sqlSession.selectOne("userSQL.signIn", map);
	}
}
