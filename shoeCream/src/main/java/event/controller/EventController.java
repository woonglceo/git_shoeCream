package event.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import event.bean.EventDTO;
import event.bean.EventPaging;
import event.service.EventService;

@Controller
@RequestMapping(value="/event")
public class EventController {
	@Autowired
	private EventService eventService;
	
	// 이벤트 기본 폼
	@GetMapping(value = "eventList")
	public String eventList(Model model, @RequestParam(required = false, defaultValue = "1") String pg) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/WEB-INF/adminViews/content/eventList.jsp");
		return "/admin/adminIndex";
	}
	
	// 이벤트 리스트 / 페이징 처리
	@PostMapping(value = "getEventList")
	@ResponseBody
	public Map<String, Object> getEventList(@RequestParam(required = false, defaultValue = "1") String pg, @RequestParam String option) {
		Map<String, Object> map = new HashedMap<String, Object>();		
			
		// 리스트 뽑아오기
		List<EventDTO> list = eventService.getEventList(pg, option);
		System.out.println(pg +  option);
		// 페이징 처리하기
		EventPaging eventPaging = eventService.eventPaging(pg, option);
					
		map.put("eventPaging", eventPaging);
		map.put("list", list);
		return map;
	}
	
	@PostMapping(value="getEventList")
	@ResponseBody
	public Map<String, Object> getEventList(@RequestParam(required=false, defaultValue="1") String pg) {
		List<EventDTO> list = eventService.getEventList(pg);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("eventPaging", eventService.eventPaging(pg));
		
		return map;
	}
	
	// 이벤트 검색결과
	@PostMapping(value = "searchEvent")
	@ResponseBody
	public Map<String, Object> searchEvent(@RequestParam Map<String, Object> map){		
		//페이징처리
		EventPaging eventPaging = eventService.searchEventPaging(map);
		// 검색 결과 리스트
		List<EventDTO> list = eventService.searchEvent(map);
		System.out.println("제목검색결과 목록" + list);
			
		// data로 보낼 결과물
		Map<String, Object> map2 = new HashMap<String, Object>();
		// 검색 결과 리스트
		map2.put("list", list);
		// 페이징처리의 결과 값
		map2.put("eventPaging", eventPaging);
		return map2;
		}

}	
