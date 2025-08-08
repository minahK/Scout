package com.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.app.dto.travel.TravelCourseDTO;

@Mapper
public interface TravelCourseMapper {
	List<TravelCourseDTO> selectCourseList(@Param("keyword") String keyword, @Param("sort") String sort);

	TravelCourseDTO getCourseDetail(@Param("id") Long id);

	List<TravelCourseDTO> getCourseListByTag(@Param("tag") String tag);

	int insertCourse(TravelCourseDTO dto);

	int updateCourse(TravelCourseDTO dto);

	int deleteCourse(Long courseId);
}