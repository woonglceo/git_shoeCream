package deal.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import deal.bean.DealDTO;

@Repository
@Transactional
public class DealDAOMybatis implements DealDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<DealDTO> getDealList(Map<String, Integer> map) {
		return sqlSession.selectList("dealSQL.getDealList", map);
	}
	
	@Override
	public DealDTO getDeal(String dealId) {
		return sqlSession.selectOne("dealSQL.getDeal", Integer.parseInt(dealId));
	}
	
	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("dealSQL.getTotalCount");
	}
	
	@Override
	public List<DealDTO> getDealSearchList(Map<String, String> map) {
		return sqlSession.selectList("dealSQL.getDealSearchList", map);
	}
}
