package com.app.dao.festival;

import java.util.List;
import java.util.Map;

import com.app.dto.festival.FestivalDTO;

public interface FestivalDAO {
	
	List<FestivalDTO> findFestivalList(Map<String, Object> params);
	FestivalDTO findFestivalById(int id);
	void updateViewCount(int id);
}
