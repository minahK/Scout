package com.app.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.app.dto.TravelPlaceDTO;
import com.app.service.TravelPlaceService;


@Controller
@RequestMapping("/travelPlace")
public class TravelPlaceController {


	
    @Autowired
    private TravelPlaceService travelPlaceService;

    // 1. 여행지 목록 페이지
    @GetMapping("/list")
    public String listTravelPlace(Model model) {
        List<TravelPlaceDTO> travelPlaces = travelPlaceService.getAllPlaces(); // Service 메소드 맞게
        model.addAttribute("placeList", travelPlaces); // JSP에서 items="${placeList}"로 사용
        return "courseList"; // /WEB-INF/views/courseList.jsp
    }

    // 2. 여행지 상세 페이지
    @GetMapping("/detail")
    public String detail(@RequestParam("id") int id, Model model) {
        TravelPlaceDTO place = travelPlaceService.getPlaceById(id); // Service 메소드 맞게
        model.addAttribute("place", place);
        return "travelPlaceDetail"; // /WEB-INF/views/travelPlaceDetail.jsp
    }

    // 3. 글쓰기 폼 페이지
    @GetMapping("/write")
    public String writeTravelPlaceForm(Model model) {
        return "write";
    }

    // 4. 메인 페이지
    @GetMapping("/main")
    public String mainPage() {
        return "mainpage";
    }
}
