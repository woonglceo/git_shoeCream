package event.dao;

import java.util.List;
import java.util.Map;

import event.bean.EventDTO;

public interface EventDAO {

	public List<EventDTO> getEventList(Map<String, Object> map);
	//public List<EventDTO> getEventList(Map<String, Integer> map);

	public int getTotalEvent(Map<String, Object> map);

	public List<EventDTO> searchEvent(Map<String, Object> map);

	public int searchEventPaging(Map<String, Object> map);
}
