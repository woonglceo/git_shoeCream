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
		return sqlSession.selectOne("userSQL.getUserId", userId);
	}

	@Override
	public UserDTO chkUsername(String username) {
		return sqlSession.selectOne("userSQL.chkUsername", username);
	}

	@Override
	public UserDTO chkNickname(String nickname) {
		return sqlSession.selectOne("userSQL.chkNickname", nickname);
	}

	@Override
	public UserDTO chkEmail(String email) {
		return sqlSession.selectOne("userSQL.chkEmail", email);
	}

	@Override
	public void joinOk(UserDTO userDTO) {
		sqlSession.insert("userSQL.joinOk", userDTO);
	}

	@Override
	public UserDTO chkUserPwd(Map<String, String> map) {
		return sqlSession.selectOne("userSQL.chkUserPwd", map);
	}

	@Override
	public void loginOk(String email) {
		sqlSession.update("userSQL.loginOk", email);
	}

	@Override
	public String findUserOk(String phoneNum) {
		return sqlSession.selectOne("userSQL.findUserOk", phoneNum);
	}

	@Override
	public UserDTO findPwdOk(Map<String, String> map) {
		return sqlSession.selectOne("userSQL.findPwdOk", map);
	}

	@Override
	public void updatePwd(Map<String, String> map) {
		sqlSession.update("userSQL.updatePwd", map);
	}

	@Override
	public UserDTO chkAccessToken(String access_Token) {
		return sqlSession.selectOne("userSQL.chkAccessToken", access_Token);
	}

	@Override
	public void joinSocialOk(UserDTO userDTO) {
		sqlSession.insert("userSQL.joinSocialOk", userDTO);
	}

	@Override
	public void kakaoLoginOk(String email) {
		sqlSession.update("userSQL.kakaoLoginOk", email);
	}

}
