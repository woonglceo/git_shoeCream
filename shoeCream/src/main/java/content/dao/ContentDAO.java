package content.dao;

import java.util.List;
import java.util.Map;

import content.bean.AnnounceDTO;
import content.bean.EventDTO;

public interface ContentDAO {

	public List<AnnounceDTO> getAnnounceList(Map<String, Integer> map);

	public int getTotalAnnounce();

	public void writeAnnounce(AnnounceDTO announceDTO);

	public List<EventDTO> getEventList(Map<String, Object> map);

	public int getTotalEvent(Map<String, Object> map);

	public List<AnnounceDTO> searchAnnounce(Map<String, Object> map);

	public int searchTotalAnnounce(Map<String, Object> map);

	public List<EventDTO> searchEvent(Map<String, Object> map);

	public int serachEventPaging(Map<String, Object> map);

	

}
