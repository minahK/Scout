package com.app.dao.travel.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.travel.TravelCourseSimpleDAO;
import com.app.dto.travel.TravelCourseSimpleDTO;

@Repository
public class TravelCourseSimpleDAOImpl implements TravelCourseSimpleDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<TravelCourseSimpleDTO> selectAllSimpleCourses() {

		List<TravelCourseSimpleDTO> travelCourseSimpleList = sqlSessionTemplate.selectList("travel_course_simple_mapper.selectAllSimpleCourses");
			
		return travelCourseSimpleList;
	}
	
	
}
