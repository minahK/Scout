package com.app.service.festival.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.festival.FestivalDAO;
import com.app.dto.festival.FestivalDTO;
import com.app.service.festival.FestivalService;

@Service
public class FestivalServieImpl implements FestivalService {

	@Autowired
	private FestivalDAO festivalDAO;
	
	@Override
	public List<FestivalDTO> findFestivalList(Map<String, Object> params) {
		return festivalDAO.findFestivalList(params);
	}

	@Override
	public FestivalDTO findFestivalById(int id) {
		return festivalDAO.findFestivalById(id);
	}

	@Override
	public void updateViewCount(int id) {
		festivalDAO.updateViewCount(id);
	}

}
