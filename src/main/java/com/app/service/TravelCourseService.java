package com.app.service;

import java.util.List;

import com.app.dto.TravelCourseDTO;
import com.app.entity.TravelCourse;
import com.app.entity.TravelPlace;

public interface TravelCourseService {
	void save(TravelPlace place);

	List<TravelPlace> findAll();

	   List<TravelCourseDTO> getAllCourses();
	    // ...기존 메소드들
	}
