package com.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.app.dto.travel.TravelCourseSimpleDTO;
import com.app.service.TravelCourseSimpleService;

@Controller
@RequestMapping("/simpleCourse")
public class TravelCourseSimpleController {

	private final TravelCourseSimpleService service;

	@Autowired
	public TravelCourseSimpleController(TravelCourseSimpleService service) {
		this.service = service;
	}

	@Autowired
    private TravelCourseSimpleService travelCourseSimpleService;

	@GetMapping("/travelCourse/list")
	public String list(Model model) {
		List<TravelCourseSimpleDTO> courses = travelCourseSimpleService.getAllSimpleCourses();
		model.addAttribute("courses", courses);
		return "travelCourseList";
	}

	// 상세 뷰
	@GetMapping("/detail/{courseId}")
	public String detail(@PathVariable("courseId") String courseId, Model model) {
		model.addAttribute("course", service.getCourseDetail(courseId));
		return "travelCourseDetail";
	}
}