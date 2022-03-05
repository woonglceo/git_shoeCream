package admin.content.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import admin.content.bean.AnnounceDTO;
import admin.content.bean.ContentPaging;
import admin.content.bean.EventDTO;
import admin.content.service.ContentService;

@Controller
@Component
@RequestMapping(value="/adminViews/content")
public class ContentController {
	@Autowired
	private ContentService contentService;
	
	// 공지사항 기본 폼
	@GetMapping(value = "announceList")
	public String announce(Model model, @RequestParam(required = false, defaultValue = "1") String pg) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/WEB-INF/adminViews/content/announceList.jsp");
		return "/admin/adminIndex";
	}
	
	// 공지사항 등록
	@PostMapping(value = "writeAnnounce")
	@ResponseBody
	public void writeAnnounce(@ModelAttribute AnnounceDTO announceDTO, @RequestParam MultipartFile[] image, HttpSession session) {
		
	}
	
	// 공지사항 리스트 / 페이징 처리
	@PostMapping(value = "getAnnounceList")
	@ResponseBody
	public Map<String, Object> getAnnounceList(@RequestParam(required = false, defaultValue = "1") String pg) {
		Map<String, Object> map = new HashedMap<String, Object>();		
		
		// 리스트 뽑아오기
		List<AnnounceDTO> list = contentService.getAnnounceList(pg);
		// 페이징 처리하기
		System.out.println("pg" + pg);
		ContentPaging announcePaging = contentService.announcePaging(pg);
				
		map.put("announcePaging", announcePaging);
		map.put("list", list);
		return map;
	}
	
	// 공지사항 검색결과
	@PostMapping(value = "searchAnnounce")
	@ResponseBody
	public Map<String, Object> searchList(@RequestParam Map<String, Object> map){		
		//페이징처리
		ContentPaging announcePaging = contentService.serachAnnouncePaging(map);
		// 검색 결과 리스트
		List<AnnounceDTO> list = contentService.searchAnnounce(map);
		
		// data로 보낼 결과물
		Map<String, Object> map2 = new HashMap<String, Object>();
		// 검색 결과 리스트
		map2.put("list", list);
		// 페이징처리의 결과 값
		map2.put("announcePaging", announcePaging);
		return map2;
	}
	
	// 공지사항 수정 폼 띄우기
	@GetMapping(value = "updateAnnounceView")
	public String updateAnnounceView(Model model, @RequestParam String pg, @RequestParam String announceId) {
		model.addAttribute("announceId", announceId);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/WEB-INF/adminViews/content/updateAnnounceView.jsp");
		return "/admin/adminIndex";
	}
	
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
		List<EventDTO> list = contentService.getEventList(pg, option);
		System.out.println(pg +  option);
		// 페이징 처리하기
		ContentPaging eventPaging = contentService.eventPaging(pg, option);
					
		map.put("eventPaging", eventPaging);
		map.put("list", list);
		return map;
	}
	
	// 이벤트 검색결과
	@PostMapping(value = "searchEvent")
	@ResponseBody
	public Map<String, Object> searchEvent(@RequestParam Map<String, Object> map){		
		//페이징처리
		ContentPaging eventPaging = contentService.serachEventPaging(map);
		// 검색 결과 리스트
		List<EventDTO> list = contentService.searchEvent(map);
		System.out.println("제목검색결과 목록" + list);
			
		// data로 보낼 결과물
		Map<String, Object> map2 = new HashMap<String, Object>();
		// 검색 결과 리스트
		map2.put("list", list);
		// 페이징처리의 결과 값
		map2.put("eventPaging", eventPaging);
		return map2;
		}
	
	// 게시글 기본 폼
	@GetMapping(value = "styleList")
	public String styleList(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/content/styleList.jsp");
		return "/admin/adminIndex";
	}
	
	// 공지사항 작성 기본 폼
	@GetMapping(value = "announceWrite")
	public String announceWrite(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/content/announceWrite.jsp");
		return "/admin/adminIndex";
	}
		
	// 이벤트 작성 기본 폼
	@GetMapping(value = "eventWrite")
	public String eventWrite(Model model) {
		model.addAttribute("display", "/WEB-INF/adminViews/content/eventWrite.jsp");
		return "/admin/adminIndex";
	}
	

}
