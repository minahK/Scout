package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReportController {

	@GetMapping("/reportMain")
	public String main() {
		return "/reportMain";
	}
	
	@GetMapping("/reportMain/report1")
	public String main1() {
		return "/report1";
	}
	
	@GetMapping("/reportMain/report2")
	public String main2() {
		return "/report2";
	}
}
