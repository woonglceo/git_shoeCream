package event.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import event.bean.EventPaging;
import event.bean.EventDTO;
import event.bean.EventPaging;
import event.dao.EventDAO;

@Service
public class EventServiceImpl implements EventService{
	@Autowired
	private EventDAO eventDAO;	
	@Autowired
	private EventPaging eventPaging;
	
	// 이벤트 리스트 뽑기
	@Override
	public List<EventDTO> getEventList(String pg, String option) {
		int endNum = Integer.parseInt(pg) * 10;
		int startNum = endNum - 9;
		
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("option", option);
	
		return eventDAO.getEventList(map);
	
	}
	
	@Override
	public List<EventDTO> getEventList(String pg) {
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("endNum", Integer.parseInt(pg) * 5);
		map.put("startNum", (Integer.parseInt(pg) * 5) - 4);
		
		List<EventDTO> list = eventDAO.getEventList(map);
		return list;
	}

	// 이벤트 리스트 페이징처리
	@Override
	public EventPaging eventPaging(String pg, String option) {
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("option", option);
		
		int total = eventDAO.getTotalEvent(map);

		eventPaging.setCurrentPage(Integer.parseInt(pg));
		eventPaging.setPageBlock(5);
		eventPaging.setPageSize(10);
		eventPaging.setTotalA(total);
		eventPaging.makePagingHTML();
		
		return eventPaging;
	}
	
	@Override
	public EventPaging eventPaging(String pg) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("option", "going");
		
		eventPaging.setCurrentPage(Integer.parseInt(pg)); //현재 페이지
		eventPaging.setPageBlock(6);
		eventPaging.setPageSize(5);
		eventPaging.setTotalA(eventDAO.getTotalEvent(map));
		eventPaging.makePagingHTML();
		
		return eventPaging;
	}
	
	// 이벤트 검색결과
	@Override
	public List<EventDTO> searchEvent(Map<String, Object> map) {
		int endNum = Integer.parseInt((String) map.get("searchPg")) * 10;
		int startNum = endNum - 9;
		
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		
		return eventDAO.searchEvent(map);
	}

	// 이벤트 검색결과 페이징처리
	@Override
	public EventPaging searchEventPaging(Map<String, Object> map) {
		
		int total = eventDAO.searchEventPaging(map);
		System.out.println("이벤트 검색 개수 "+ total);
		eventPaging.setCurrentPage(Integer.parseInt((String) map.get("searchPg")));
		eventPaging.setPageBlock(5);
		eventPaging.setPageSize(10);
		eventPaging.setTotalA(total);
		eventPaging.makePagingHTML();
		
		return eventPaging;
	}
}
