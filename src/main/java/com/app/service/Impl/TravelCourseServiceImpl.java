package com.app.service.Impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.app.dto.TravelCourseDTO;
import com.app.entity.TravelCourse;
import com.app.entity.TravelPlace;
import com.app.service.TravelCourseService;

//실제 구현 클래스 (Service 어노테이션 필수)
@Service
public class TravelCourseServiceImpl implements TravelCourseService {
    @Override
    public List findAll() {
        List<TravelCourse> list = new ArrayList<>();
        list.add(new TravelCourse(1L, "여수 바다 올인원 코스", "예술과 바다, 자연까지!", 101L, 1L, new Date()));
        return list;
    }

	@Override
	public void save(TravelPlace place) {
		
		
	}

	@Override
	public List<TravelCourseDTO> getAllCourses() {
	
		return null;
	}
}