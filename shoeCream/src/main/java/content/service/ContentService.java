package content.service;

import java.util.List;
import java.util.Map;

import content.bean.AnnounceDTO;
import content.bean.ContentPaging;
import content.bean.EventDTO;

public interface ContentService {

	public List<AnnounceDTO> getAnnounceList(String pg);

	public ContentPaging announcePaging(String pg);

	public void writeAnnounce(AnnounceDTO announceDTO);

	public List<EventDTO> getEventList(String pg, String option);

	public ContentPaging eventPaging(String pg, String option);

	public List<AnnounceDTO> searchAnnounce(Map<String, Object> map);

	public ContentPaging serachAnnouncePaging(Map<String, Object> map);

	public ContentPaging serachEventPaging(Map<String, Object> map);

	public List<EventDTO> searchEvent(Map<String, Object> map);

}
