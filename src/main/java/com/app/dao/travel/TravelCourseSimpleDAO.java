package com.app.dao.travel;

import java.util.List;

import com.app.dto.travel.TravelCourseSimpleDTO;

public interface TravelCourseSimpleDAO {

	List<TravelCourseSimpleDTO> selectAllSimpleCourses();
}
