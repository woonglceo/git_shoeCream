package content.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import content.bean.AnnounceDTO;
import content.bean.EventDTO;

@Repository
public class ContentDAOMybatis implements ContentDAO {
	@Autowired
	private SqlSession sqlSession;

	// 공지사항 리스트 뽑아오기
	@Override
	public List<AnnounceDTO> getAnnounceList(Map<String, Integer> map) {
		System.out.println(sqlSession.selectList("contentSQL.getAnnounceList",map));
		return sqlSession.selectList("contentSQL.getAnnounceList",map);
	}

	// 총 글의 갯수
	@Override
	public int getTotalAnnounce() {
		return sqlSession.selectOne("contentSQL.getTotalAnnounce");
	}

	// 공지사항 작성하기
	@Override
	public void writeAnnounce(AnnounceDTO announceDTO) {
		sqlSession.insert("contentSQL.writeAnnounce", announceDTO);
	}

	// 공지사항 검색결과
	@Override
	public List<AnnounceDTO> searchAnnounce(Map<String, Object> map) {
		return sqlSession.selectList("contentSQL.searchAnnounce", map);
	}
	
	// 공지사항 검색결과 페이징
	@Override
	public int searchTotalAnnounce(Map<String, Object> map) {
		return sqlSession.selectOne("contentSQL.searchTotalAnnounce", map);
	}
	
	// 이벤트 리스트 뽑아오기
	@Override
	public List<EventDTO> getEventList(Map<String, Object> map) {
		System.out.println("option" + map);
		return sqlSession.selectList("contentSQL.getEventList",map);
	}

	// 이벤트 페이징
	@Override
	public int getTotalEvent(Map<String, Object> map) {
		return sqlSession.selectOne("contentSQL.getTotalEvent", map);
	}
	
	// 이벤트 검색결과
	@Override
	public List<EventDTO> searchEvent(Map<String, Object> map) {
		return sqlSession.selectList("contentSQL.searchEvent", map);
	}
	
	// 이벤트 검색결과 페이징
	@Override
	public int serachEventPaging(Map<String, Object> map) {
		System.out.println("map이당" + map);
		return sqlSession.selectOne("contentSQL.serachEventPaging", map);
	}

}
