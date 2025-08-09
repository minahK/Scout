package com.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.dto.festival.FestivalDTO;
import com.app.dto.travelDestination.DetailComment;
import com.app.dto.travelDestination.HashTags;
import com.app.dto.travelDestination.TravelDestination;
import com.app.dto.travelDestination.TravelInfo;
import com.app.dto.user.User;
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
		
		List<FestivalDTO> festivalList = travelDestinationService.findFestivalList();
		model.addAttribute("festivalList",festivalList);
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
	public String travelDestination(Model model,HttpServletRequest request) {
		String sort = request.getParameter("sort");
		String tag = request.getParameter("tag");
		model.addAttribute("tag", tag);
		model.addAttribute("sort", sort);
		
		List<TravelDestination> travelList;
		if (tag != null && !tag.isEmpty()) {
	        // **태그와 정렬 동시 적용!**
	        travelList = travelDestinationService.findTravelTagAndSortList(tag, sort);
	    } else if (sort != null && !sort.isEmpty()) {
	        travelList = travelDestinationService.findTravelList(sort);
	    } else {
	        travelList = travelDestinationService.findTravelList("recent"); // 기본 최신순
	    }
	    model.addAttribute("travelList", travelList);
		
		return "travelDestination/travelDestination";
	}
	
	//상세 페이지
	@GetMapping("/travelDestination/{travelId}")
	public String travelDestinationDetail(@PathVariable int travelId,Model model) {
		
		TravelDestination travelDestination = travelDestinationService.findTravelById(travelId);
		
		List<HashTags> hashtag = travelDestinationService.findHashTags(travelId);
		
		TravelInfo travelInfo = travelDestinationService.findTravelInfo(travelId);
		
		List<DetailComment> commentList = travelDestinationService.findCommentList(travelId);
		
		int commentCount = travelDestinationService.countComments(travelId);
		
		travelDestinationService.increaseView(travelId);
		model.addAttribute("commentCount",commentCount);
		model.addAttribute("commentList",commentList);
		model.addAttribute("travel", travelDestination);
		model.addAttribute("hashtag", hashtag);
		model.addAttribute("travelInfo", travelInfo);
		return "travelDestination/detail";
	}
	
	//댓글 입력값 받아오기
	@PostMapping("/travelDestination/{travelId}")
	public String travelDestinationDetailAction(@PathVariable int travelId,@RequestParam String content,HttpSession session) {
		
		User loginUser = (User) session.getAttribute("loginUser");
		
		DetailComment dc = new DetailComment();
		dc.setTravelId(travelId);
	    dc.setContent(content);
	    dc.setUserId(loginUser.getId());        // 세션의 User 객체에서 가져오기
	    dc.setName(loginUser.getName());        // 세션의 User 객체에서 가져오기
	    
	    if((dc.getContent().trim()).isEmpty()) {
	    	return "redirect:/travelDestination/" + travelId;
	    }
	    
	    travelDestinationService.insertComment(dc);
		
		
		
		return "redirect:/travelDestination/"+travelId;
	}
}
