package com.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.app.dto.travel.TravelCourseDetailDTO;
import com.app.dto.travel.TravelCourseSimpleDTO;


@Mapper
public interface TravelCourseSimpleMapper {
    int insert(TravelCourseSimpleDTO dto);
    int update(TravelCourseSimpleDTO dto);
    int delete(Long courseId);
    List<TravelCourseSimpleDTO> selectAllSimpleCourses();
    TravelCourseSimpleDTO selectById(String courseId);
    List<TravelCourseDetailDTO> selectCourseDetails(@Param("courseId") String courseId);
	TravelCourseSimpleDTO selectSimpleCourseById(Long courseId);
	int insertCourseSimple(TravelCourseSimpleDTO dto);
}