package com.app.service;

import java.util.List;

import com.app.dto.tour.TouristDestinationDTO;
import com.app.dto.travel.TravelCourseDetailDTO;
import com.app.dto.travel.TravelCourseSimpleDTO;

public interface TouristDestinationService {
	List<TouristDestinationDTO> getAllDestinations();

	TouristDestinationDTO getDestinationById(Long id);

	int addDestination(TouristDestinationDTO dto);

	int updateDestination(TouristDestinationDTO dto);

	int deleteDestination(Long id);
}
