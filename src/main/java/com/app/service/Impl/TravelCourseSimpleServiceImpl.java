package com.app.service.Impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.travel.TravelCourseSimpleDAO;
import com.app.dto.travel.TravelCourseDetailDTO;
import com.app.dto.travel.TravelCourseSimpleDTO;
import com.app.mapper.TravelCourseDetailMapper;
import com.app.mapper.TravelCourseSimpleMapper;
import com.app.service.TravelCourseSimpleService;


@Service
public class TravelCourseSimpleServiceImpl implements TravelCourseSimpleService {

    @Autowired
    private TravelCourseSimpleMapper travelCourseSimpleMapper;

    @Autowired
    private TravelCourseDetailMapper travelCourseDetailMapper;
    
    @Autowired
    private TravelCourseSimpleDAO travelCourseSimpleDAO;



    @Override
    public List<TravelCourseSimpleDTO> getSimpleCourseList() {
        // summary-only list; same as full list here
        //return travelCourseSimpleMapper.selectAllSimpleCourses();
    	
    	return travelCourseSimpleDAO.selectAllSimpleCourses();
    }

    @Override
    public List<TravelCourseSimpleDTO> getCourseList() {
        // alias for getAllSimpleCourses()
        //return getAllSimpleCourses();
    	return null;
    }

    @Override
    public TravelCourseSimpleDTO getSimpleCourseById(Long courseId) {
        return travelCourseSimpleMapper.selectSimpleCourseById(courseId);
    }

    @Override
    public TravelCourseSimpleDTO getCourseDetail(Long courseId) {
        TravelCourseSimpleDTO course = travelCourseSimpleMapper.selectSimpleCourseById(courseId);
        if (course != null) {
            List<TravelCourseDetailDTO> details = travelCourseDetailMapper
                .selectByCourseId(courseId);
            course.setDetailList(details);
        }
        return course;
    }

    @Override
    public TravelCourseSimpleDTO getCourseDetail(String courseId) {
    	 return travelCourseSimpleMapper.selectById(courseId);
        }
    

    @Override
    public int registerCourse(TravelCourseSimpleDTO dto) {
        return travelCourseSimpleMapper.insertCourseSimple(dto);
    }

    @Override
    public int updateCourse(TravelCourseSimpleDTO dto) {
        return travelCourseSimpleMapper.update(dto);
    }

    @Override
    public int removeCourse(Long courseId) {
        // delete details first because of FK constraint
        travelCourseDetailMapper.deleteByCourseId(courseId);
        return travelCourseSimpleMapper.delete(courseId);
    }

    @Override
    public List<TravelCourseSimpleDTO> getCoursesByTag(String tag) {
        return travelCourseSimpleMapper.selectAllSimpleCourses().stream()
            .filter(c -> c.getTags() != null && c.getTags().contains(tag))
            .collect(Collectors.toList());
    }
}
