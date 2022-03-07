package event.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import event.bean.EventDTO;

@Repository
@Transactional
public class EventDAOMybatis implements EventDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 이벤트 리스트 뽑아오기
	@Override
	public List<EventDTO> getEventList(Map<String, Object> map) {
		System.out.println("option" + map);
		return sqlSession.selectList("eventSQL.getEventList",map);
	}
	
	@Override
	public List<EventDTO> getEventList2(Map<String, Object> map) {
		return sqlSession.selectList("eventSQL.getEventList",map);
	}

	// 이벤트 페이징
	@Override
	public int getTotalEvent(Map<String, Object> map) {
		return sqlSession.selectOne("eventSQL.getTotalEvent", map);
	}
	
	// 이벤트 검색결과
	@Override
	public List<EventDTO> searchEvent(Map<String, Object> map) {
		return sqlSession.selectList("eventSQL.searchEvent", map);
	}
	
	// 이벤트 검색결과 페이징
	@Override
	public int searchEventPaging(Map<String, Object> map) {
		System.out.println("map이당" + map);
		return sqlSession.selectOne("eventSQL.serachEventPaging", map);
	}
}
