package com.app.service.festival;

import java.util.List;
import java.util.Map;

import com.app.dto.festival.FestivalDTO;

public interface FestivalService {

	List<FestivalDTO> findFestivalList(Map<String, Object> params);
	FestivalDTO findFestivalById(int id);
	void updateViewCount(int id);
}
