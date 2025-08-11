package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RecommendedCourseController {

	@GetMapping("/RecommendedCourse")
	public String RecommendedCourse() {
		
        return "course/RecommendedCourse";
    }
	
	@GetMapping("/RecommendedCourse/Detail1")
	public String RecommendedCourseDetail1() {
		
        return "course/RecommendedCourseDetail1";
    }
	
	@GetMapping("/RecommendedCourse/Detail2")
	public String RecommendedCourseDetail2() {
		
        return "course/RecommendedCourseDetail2";
    }
	
	@GetMapping("/RecommendedCourse/Detail3")
	public String RecommendedCourseDetail3() {
		
        return "course/RecommendedCourseDetail3";
    }
	
	@GetMapping("/RecommendedCourse/Detail4")
	public String RecommendedCourseDetail4() {
		
        return "course/RecommendedCourseDetail4";
    }
	
	@GetMapping("/RecommendedCourse/Detail5")
	public String RecommendedCourseDetail5() {
		
        return "course/RecommendedCourseDetail5";
    }
	
}
