package com.app.service;

import java.util.List;

import com.app.dto.TravelCourseDTO;

public interface TravelCourseService {
	 List<TravelCourseDTO> getCourseList(String keyword, String sort);
	    TravelCourseDTO getCourseDetail(Long id);
	    List<TravelCourseDTO> getCourseListByTag(String tag);
	    int insertCourse(TravelCourseDTO course);
	    
	    
	}