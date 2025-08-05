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

	@Override
	public TravelDestination findTravelById(int travelId) {
		TravelDestination travelDestination = travelDestinationDAO.findTravelById(travelId);
		return travelDestination;
	}

	@Override
	public List<TravelDestination> findTravelGSList() {
		List<TravelDestination> travelList = travelDestinationDAO.findTravelGSList();
		return travelList;
	}

	@Override
	public List<TravelDestination> findTravelMJList() {
		List<TravelDestination> travelList = travelDestinationDAO.findTravelMJList();
		return travelList;
	}

	@Override
	public List<TravelDestination> findTravelHPList() {
		List<TravelDestination> travelList = travelDestinationDAO.findTravelHPList();
		return travelList;
	}
}
