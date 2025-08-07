package com.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.TravelCourseDTO;
import com.app.service.TagService;
import com.app.service.TravelCourseService;

@Controller
@RequestMapping("/travelCourse")
public class TravelCourseController {

    @Autowired
    private TravelCourseService travelCourseService;
    
    @Autowired
    private TagService tagService;
    
    //태그추가
    @PostMapping("/addTag")
    public String addTag(@RequestParam("newTag") String newTag) {
        tagService.addTag(newTag);
        return "redirect:/travelCourse/list";
    }
    
    
    // 여행 코스 리스트 페이지
    @GetMapping("/list")
    public String list(Model model) {
        List<TravelCourseDTO> list = travelCourseService.getCourseList(null, null);
        model.addAttribute("list", list);
        return "travelCourseList"; // /WEB-INF/views/travelCourseList.jsp
    }

    // 여행 코스 상세 페이지
    @GetMapping("/detail/")
    public String getCourseDetail(@PathVariable("id") Long id, Model model) {
        TravelCourseDTO course = travelCourseService.getCourseDetail(id);
        model.addAttribute("course", course);
        return "travelCourseDetail"; // /WEB-INF/views/travelCourseDetail.jsp
    }
    
    @GetMapping("/tag/{tag}")
    public String listByTag(@PathVariable("tag") String tag, Model model) {
        List<TravelCourseDTO> list = travelCourseService.getCourseListByTag(tag);
        model.addAttribute("list", list);
        model.addAttribute("searchedTag", tag);
        return "travelCourseList"; // 결과 보여줄 JSP
    }
    
    

  

    @PostMapping("/travelCourse/add")
    public String addCourse(TravelCourseDTO dto) {
        travelCourseService.insertCourse(dto);
        return "redirect:/travelCourse/list";
    }
    
    @GetMapping("/add")
    public String showInsertForm(Model model) {
        model.addAttribute("course", new TravelCourseDTO());
        return "travelCourseForm";
    }
    
}