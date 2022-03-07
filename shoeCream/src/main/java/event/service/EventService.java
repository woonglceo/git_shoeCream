package event.service;

import java.util.List;
import java.util.Map;

import event.bean.EventDTO;
import event.bean.EventPaging;

public interface EventService {

	public List<EventDTO> searchEvent(Map<String, Object> map);

	public EventPaging searchEventPaging(Map<String, Object> map);

	public List<EventDTO> getEventList(String pg, String option);
	public List<EventDTO> getEventList2(String pg);

	public EventPaging eventPaging(String pg, String option);
	public EventPaging eventPaging(String pg);
}
