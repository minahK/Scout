package com.app.service;

import java.util.List;

import com.app.dto.travel.TravelCourseSimpleDTO;

public interface TravelCourseSimpleService {

		List<TravelCourseSimpleDTO> getCourseList();
	    TravelCourseSimpleDTO getCourseDetail(String courseId);
	    int registerCourse(TravelCourseSimpleDTO dto);
	    int updateCourse(TravelCourseSimpleDTO dto);
	    int removeCourse(Long courseId);
	    TravelCourseSimpleDTO getSimpleCourseById(Long courseId);
		TravelCourseSimpleDTO getCourseDetail(Long courseId);
		List<TravelCourseSimpleDTO> getCoursesByTag(String tag);
		
		
		List<TravelCourseSimpleDTO> getSimpleCourseList();

}