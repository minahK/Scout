package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.dto.TouristRequestDTO;




@Controller
@RequestMapping("/") // 모든 URL이 "/"에서 시작
public class PageController {

    @GetMapping
    public String rootRedirect() {
        // 루트 접근 시 메인 페이지로 리다이렉트
        return "redirect:/main";
    }

    @GetMapping("main")
    public String mainPage() {
        // /main 요청 시 mainpage.jsp로 이동
        return "mainpage";
    }

    @GetMapping("courses")
    public String courseList() {
        // /courses 요청 시 courseList.jsp로 이동
        return "courseList";
    }

    @GetMapping("place/detail")
    public String travelPlaceDetail() {
        // /place/detail 요청 시 travelPlaceDetail.jsp로 이동
        return "travelPlaceDetail";
    }

    @GetMapping("/write")
    public String writeForm(Model model) {
        model.addAttribute("touristRequest", new TouristRequestDTO());
        return "write";
    }
    
    
    @PostMapping("/write")
    public String submitWrite(@ModelAttribute("touristRequest") TouristRequestDTO dto) {
        // 저장로직
        return "redirect:/main";
    }
    
    
}