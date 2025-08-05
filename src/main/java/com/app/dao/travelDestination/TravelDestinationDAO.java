package com.app.dao.travelDestination;

import java.util.List;

import com.app.dto.travelDestination.TravelDestination;

public interface TravelDestinationDAO {

	List<TravelDestination> findTravelList();

	TravelDestination findTravelById(int travelId);

	List<TravelDestination> findTravelGSList();

	List<TravelDestination> findTravelMJList();
	
	List<TravelDestination> findTravelHPList();

}
