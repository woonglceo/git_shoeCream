package style.service;

import java.util.List;
import java.util.Map;

import style.bean.StyleCardDTO;

public interface StyleService {

	public List<StyleCardDTO> getPopularList();

	public List<StyleCardDTO> getRecentList();

	public Map<String, Object> getMyList(int userId);
	
}
