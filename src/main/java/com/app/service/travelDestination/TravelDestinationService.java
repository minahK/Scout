package com.app.service.travelDestination;

import java.util.List;

import com.app.dto.travelDestination.TravelDestination;

public interface TravelDestinationService {

	List<TravelDestination> findTravelList();

	TravelDestination findTravelById(int travelId);

	List<TravelDestination> findTravelGSList();

	List<TravelDestination> findTravelMJList();

	List<TravelDestination> findTravelHPList();

	
}
