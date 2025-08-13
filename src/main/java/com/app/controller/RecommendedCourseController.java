package com.app.controller;

import com.app.dto.Travel;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RecommendedCourseController {

	@GetMapping("/RecommendedCourse")
	public String RecommendedCourse(Model model) {
		
		  List<Travel> allTravelList = new ArrayList<>();
		  allTravelList.add(new Travel(
				    1, "제주올레길", "제주 제주시",
				    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/4b/83/43/olle-trail-along-the.jpg?w=700&h=400&s=1",
				    "올레길,한라산,섬여행,힐링,사진스팟"));

				allTravelList.add(new Travel(
				    2, "제주 사계해안도로", "제주 서귀포시",
				    "https://allways.kg-mobility.com/wp-content/uploads/2021/06/shutterstock_1235487067.jpg",
				    "바다,해변,드라이브코스,커플여행,야경"));

				allTravelList.add(new Travel(
				    3, "한라산 숲 안에서 보내는 하루밤", "제주 제주시",
				    "https://cdn.jejusori.net/news/photo/201102/95115_102616_1845.jpg",
				    "한라산,에코투어,힐링,가족여행"));

				allTravelList.add(new Travel(
				    4, "제주도 세계자연유산 탐방 1코스", "제주 제주시",
				    "https://cdn.jejusori.net/news/photo/202110/334570_346433_5355.jpg",
				    "한라산,세계자연유산,에코투어,가족여행"));

				allTravelList.add(new Travel(
				    5, "몸과 마음을 치유하는 에코 테라피", "제주 서귀포시",
				    "https://api.cdn.visitjeju.net/photomng/imgpath/202111/05/8b95bbda-f861-43f8-bc38-726c0c421b70.jpg",
				    "에코투어,힐링,가족여행"));
				
				  model.addAttribute("allTravelList", allTravelList);

		 
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
