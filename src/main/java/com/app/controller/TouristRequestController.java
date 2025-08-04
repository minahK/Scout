package com.app.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.dto.TouristRequestDTO;
import com.app.service.TouristRequestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/tourist")
public class TouristRequestController {

    private final TouristRequestService touristRequestService;

    public TouristRequestController(TouristRequestService touristRequestService) {
        this.touristRequestService = touristRequestService;
    }

    // 관광정보 요청 리스트 (JSP 파일명: tourList.jsp)
    @GetMapping("/list")
    public String listRequests(Model model) {
        List<TouristRequestDTO> list = touristRequestService.getAllRequests();
        model.addAttribute("list", list);
        model.addAttribute("username", "안녕하세요! (사용자명)");
        return "tourList";  // <- 여기서 JSP 이름에 맞게!
    }

    // 관광정보 요청 등록 폼 (JSP 파일명: tourWrite.jsp)
    @GetMapping("/write")
    public String showWriteForm(Model model) {
        model.addAttribute("touristRequest", new TouristRequestDTO());
        return "tourWrite";
    }

    // 등록 처리
    @PostMapping("/write")
    public String submitRequest(@ModelAttribute("touristRequest") TouristRequestDTO dto,
                                @RequestParam("file") MultipartFile file) {
        touristRequestService.saveRequest(dto, file);
        return "redirect:/tourist/list";
    }
}