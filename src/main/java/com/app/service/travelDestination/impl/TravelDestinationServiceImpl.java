package com.app.service.travelDestination.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.travelDestination.TravelDestinationDAO;
import com.app.dto.travelDestination.TravelDestination;
import com.app.service.travelDestination.TravelDestinationService;

@Service
public class TravelDestinationServiceImpl implements TravelDestinationService {
	
	@Autowired
	TravelDestinationDAO travelDestinationDAO;

	@Override
	public List<TravelDestination> findTravelList() {
		List<TravelDestination> travelList = travelDestinationDAO.findTravelList();
		return travelList;
	}
}
