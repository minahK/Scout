package com.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.app.dto.travel.TravelCourseDetailDTO;


@Mapper
public interface TravelCourseDetailMapper {
	  List<TravelCourseDetailDTO> selectByCourseId(Long courseId);
	    int insert(TravelCourseDetailDTO dto);
	    int deleteByCourseId(Long courseId);
}