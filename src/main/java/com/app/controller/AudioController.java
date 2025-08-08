package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AudioController {

	@GetMapping("/audioMain")
	public String main() {
		return "/audioMain";
	}
	
	@GetMapping("/audioMain/tour")
	public String main1() {
		return "/tour";
	}

	@GetMapping("/audioMain/tour2")
	public String main2() {
		return "/tour2";
	}
	
	@GetMapping("/audioMain/tour3")
	public String main3() {
		return "/tour3";
	}
	
	@GetMapping("/audioMain/tour3-1")
	public String main4() {
		return "/tour3-1";
	}
	
	@GetMapping("/audioMain/tour3-2")
	public String main5() {
		return "/tour3-2";
	}
	@GetMapping("/audioMain/tour4")
	public String main6() {
		return "/tour4";
	}
	@GetMapping("/audioMain/tour5")
	public String main7() {
		return "/tour5";
	}
	@GetMapping("/audioMain/tour6")
	public String main8() {
		return "/tour6";
	}
	@GetMapping("/audioMain/tour6-1")
	public String main9() {
		return "/tour6-1";
	}
	@GetMapping("/audioMain/tour6-2")
	public String main10() {
		return "/tour6-2";
	}

}