package com.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.app.dto.TagDTO;
import com.app.dto.travel.TravelCourseSimpleDTO;
import com.app.service.TagService;
import com.app.service.TravelCourseService;
import com.app.service.TravelCourseSimpleService;

@Controller
@RequestMapping("/travelCourse")
public class TravelCourseController {

	@Autowired
	private TravelCourseSimpleService travelCourseSimpleService;

	@Autowired
	private TagService tagService;

	@GetMapping("/list")
    public String list(Model model) {
        List<TravelCourseSimpleDTO> courses = travelCourseSimpleService.getSimpleCourseList();
        model.addAttribute("courseList", courses);
        return "travelCourseList";  // /WEB-INF/views/travelCourseList.jsp
    }

	@PostMapping("/addTag")
	public String addTag(@RequestParam("newTag") String newTag) {
		tagService.addTag(newTag);
		return "redirect:/travelCourse/list";
	}

	@GetMapping("/tag/{tag}")
	public String listByTag(@PathVariable("tag") String tag, Model model) {
		// Tag별 검색은 TravelCourseService 쪽으로 구현
		model.addAttribute("searchedTag", tag);
		return "travelCourseList";
	}

	 @GetMapping("/detail/{courseId}")
	    public String detail(@PathVariable String courseId, Model model) {
	        TravelCourseSimpleDTO course = travelCourseSimpleService.getCourseDetail(courseId);
	        model.addAttribute("course", course);
	        return "travelCourseDetail"; // /WEB-INF/views/travelCourseDetail.jsp
	    }
}