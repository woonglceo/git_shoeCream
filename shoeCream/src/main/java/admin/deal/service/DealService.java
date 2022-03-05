package admin.deal.service;

import java.util.List;
import java.util.Map;

import admin.deal.bean.DealDTO;
import admin.deal.bean.DealPaging;

public interface DealService {

	public List<DealDTO> getDealList(String pg);

	public DealDTO getDeal(String dealId);

	public DealPaging dealPaging(String pg);
	public DealPaging dealPaging(Map<String, String> map);

	public List<DealDTO> getDealSearchList(Map<String, String> map);

}
