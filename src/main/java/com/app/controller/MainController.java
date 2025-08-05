package com.app.controller;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.app.dto.travelDestination.TravelDestination;
import com.app.service.travelDestination.TravelDestinationService;

@Controller
public class MainController {
	@Autowired
	TravelDestinationService travelDestinationService;
	
	@GetMapping("/")
	public String scoutMainPage() {
		return "main/main";
	}
	
	@ResponseBody
	@GetMapping("/weather/jeju")
	public String getJejuWeather() {
		
		
        return "";
    }
	
	@GetMapping("/travelDestination")
	public String travelDestination(Model model) {
		
		List<TravelDestination> travelList = travelDestinationService.findTravelList();
		
		model.addAttribute("travelList", travelList);
		
		return "travelDestination/travelDestination";
	}
	
	@GetMapping("/travelDestination/detail")
	public String travelDestinationDetail() {
		
		return "travelDestination/detail";
	}
}
