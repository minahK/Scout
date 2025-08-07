package com.app.service.Impl;


import com.app.dto.TravelCourseDTO;
import com.app.mapper.TravelCourseMapper;
import com.app.service.TravelCourseService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class TravelCourseServiceImpl implements TravelCourseService {

	@Autowired
	private TravelCourseMapper travelCourseMapper;

	@Override
	public List<TravelCourseDTO> getCourseList(String keyword, String sort) {
		return travelCourseMapper.getCourseList(keyword, sort);
	}

	@Override
	public TravelCourseDTO getCourseDetail(Long id) {
		return travelCourseMapper.getCourseDetail(id);
	}
	@Override
	public List<TravelCourseDTO> getCourseListByTag(String tag) {
	    return travelCourseMapper.getCourseListByTag(tag);
	}
	
	@Override
	public int insertCourse(TravelCourseDTO course) {
	    return travelCourseMapper.insertCourse(course);
	}
	
	
}