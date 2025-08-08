package com.app.mapper;

import java.util.List;

import com.app.dto.tour.TouristDestinationDTO;
import com.app.dto.travel.TravelCourseDetailDTO;
import com.app.dto.travel.TravelCourseSimpleDTO;

public interface TouristDestinationMapper {
	List<TravelCourseDetailDTO> selectAllDestinations();

	TravelCourseDetailDTO selectDestinationById(Long id);

	List<TravelCourseDetailDTO> selectDestinationsByCourseId(Long courseId);

	List<TravelCourseSimpleDTO> selectSimpleCourseList();
	int deleteDestination(Long id);
	List<TouristDestinationDTO> getAllDestinations();
}