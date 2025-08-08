package com.app.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dto.tour.TouristDestinationDTO;
import com.app.dto.travel.TravelCourseDTO;
import com.app.dto.travel.TravelCourseSimpleDTO;
import com.app.mapper.TravelCourseDetailMapper;
import com.app.service.TravelCourseService;

@Service
public class TravelCourseServiceImpl implements TravelCourseService {
	
	@Autowired
	private TravelCourseDetailMapper travelCourseDetailMapper;

	@Override
	public List<TravelCourseDTO> getCourseList(String keyword, String sort) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TravelCourseDTO getCourseDetail(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TravelCourseDTO> getCourseListByTag(String tag) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertCourse(TravelCourseDTO course) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TravelCourseSimpleDTO> getSimpleCourseList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TouristDestinationDTO> getDestinationListByCourseId(Long courseId) {
		// TODO Auto-generated method stub
		return null;
	}
	
  
}