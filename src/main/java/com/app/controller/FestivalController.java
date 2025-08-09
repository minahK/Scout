package com.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.festival.FestivalDTO;
import com.app.service.festival.FestivalService;

@Controller
public class FestivalController {
	
	@Autowired
	private FestivalService festivalService;
	
	@GetMapping("/festival/list")
	public String getFestivalList(@RequestParam(required = false) String keyword,
								  @RequestParam(required = false) String sort,
								  @RequestParam(required = false) String status,
								  Model model) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", keyword);
		params.put("sort", sort);
		params.put("status", status);
		
		List<FestivalDTO> festivalList = festivalService.findFestivalList(params);
		model.addAttribute("festivalList", festivalList);
		model.addAttribute("sort", sort);
		model.addAttribute("status", status);
		
		return "festival/festivalList";
	}
	
	@GetMapping("/festival/detail")
	public String getFestivalDetail(@RequestParam("id") int id, Model model) {
		
		festivalService.updateViewCount(id);
		FestivalDTO festival = festivalService.findFestivalById(id);
		model.addAttribute("festival", festival);
		
		return "festival/festivalDetail";
	}
}
