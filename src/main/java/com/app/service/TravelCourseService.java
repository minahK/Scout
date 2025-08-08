package com.app.service;

import java.util.List;

import com.app.dto.tour.TouristDestinationDTO;
import com.app.dto.travel.TravelCourseDTO;
import com.app.dto.travel.TravelCourseSimpleDTO;

public interface TravelCourseService {
	 List<TravelCourseDTO> getCourseList(String keyword, String sort);
	    TravelCourseDTO getCourseDetail(Long id);
	    List<TravelCourseDTO> getCourseListByTag(String tag);
	    int insertCourse(TravelCourseDTO course);
		List<TravelCourseSimpleDTO> getSimpleCourseList();
		   List<TouristDestinationDTO> getDestinationListByCourseId(Long courseId);
		
	    
	}

