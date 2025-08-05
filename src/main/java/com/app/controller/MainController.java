package com.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.dto.travelDestination.TravelDestination;
import com.app.service.travelDestination.TravelDestinationService;

@Controller
public class MainController {
	@Autowired
	TravelDestinationService travelDestinationService;
	
	//메인 페이지
	@GetMapping("/")
	public String scoutMainPage(Model model) {
		
		List<TravelDestination> travelHPList = travelDestinationService.findTravelHPList();
		List<TravelDestination> travelMJList = travelDestinationService.findTravelMJList();
		List<TravelDestination> travelGSList = travelDestinationService.findTravelGSList();
		
		model.addAttribute("travelHPList", travelHPList);
		model.addAttribute("travelMJList", travelMJList);
		model.addAttribute("travelGSList", travelGSList);
		return "main/main";
	}
	
	@ResponseBody
	@GetMapping("/weather/jeju")
	public String getJejuWeather() {
		
		
        return "";
    }
	
	//여행지 페이지
	@GetMapping("/travelDestination")
	public String travelDestination(Model model) {
		
		List<TravelDestination> travelList = travelDestinationService.findTravelList();
		
		model.addAttribute("travelList", travelList);
		
		
		return "travelDestination/travelDestination";
	}
	
	//상세 페이지
	@GetMapping("/travelDestination/{travelId}")
	public String travelDestinationDetail(@PathVariable int travelId,Model model) {
		
		TravelDestination travelDestination = travelDestinationService.findTravelById(travelId);
		
		model.addAttribute("travel", travelDestination);
		
		return "travelDestination/detail";
	}
}
