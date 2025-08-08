package com.app.controller;

import java.util.List;

import com.app.dto.tour.TouristDestinationDTO;
import com.app.dto.travel.TravelCourseDetailDTO;
import com.app.service.TouristDestinationService;
import com.app.service.TouristDestinationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/destination")
public class TouristDestinationController {

	@Autowired
	private TouristDestinationService touristDestinationService;

	@GetMapping("/list")
	public String list(Model model) {
		List<TouristDestinationDTO> destinations = touristDestinationService.getAllDestinations();
		model.addAttribute("destinations", destinations);
		return "destination/list";
	}

	@GetMapping("/{id}")
	public String detail(@PathVariable Long id, Model model) {
		TouristDestinationDTO destination = touristDestinationService.getDestinationById(id);
		model.addAttribute("destination", destination);
		return "destination/detail";
	}
}