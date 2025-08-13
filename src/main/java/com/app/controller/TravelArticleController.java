package com.app.controller;

import com.app.dto.travel.CommentDTO;
import com.app.dto.travel.TravelArticleDTO;
import com.app.dto.user.User;
import com.app.service.travel.TravelArticleService;
import com.app.service.travel.TravelCommentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
public class TravelArticleController {

    @Autowired
    private TravelArticleService travelArticleService;
    
    @Autowired
    private TravelCommentService travelCommentService;

    // 여행 목록
    @GetMapping("/travel/list")
    public String getTravelList(@RequestParam(required = false) String keyword,
                                @RequestParam(required = false, defaultValue = "latest") String sort,
                                Model model) {

        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);
        params.put("sort", sort);

        List<TravelArticleDTO> travelList = travelArticleService.findTravelList(params);
        
        int totalCount = travelArticleService.getTravelCount(params);
        
        model.addAttribute("travelList", travelList);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("sort", sort);

        return "travel/articleList";
    }

    // 여행 상세
    @GetMapping("/travel/{id}")
    public String getTravelDetail(@PathVariable("id") int id,
    								HttpSession session,
    								Model model) {

        travelArticleService.updateViewCount(id);

        TravelArticleDTO travel = travelArticleService.findTravelById(id);
        model.addAttribute("travel", travel);

        List<TravelArticleDTO> recommendedTravels = travelArticleService.findRecommendedTravels(id);
        model.addAttribute("recommendedTravels", recommendedTravels);
        
        List<CommentDTO> comments = travelCommentService.findCommentsByArticleId(id);
        model.addAttribute("comments", comments);
        
        Object loginUser = session.getAttribute("loginUser");
        boolean isLoggedIn = (loginUser != null);
        model.addAttribute("isLoggedIn", isLoggedIn);
        
        if (isLoggedIn) {
        	
        	String loginUserId = String.valueOf(((User) loginUser).getId());
        	model.addAttribute("loginUserId", loginUserId);
        	
        } else {
        	model.addAttribute("loginUserId", null);
        }

        return "travel/articleDetail";
    }
    
    //댓글 등록
    @PostMapping("/travel/{articleId}/comment")
    public String addComment(@PathVariable("articleId") int articleId,
                             @RequestParam("content") String content,
                             HttpSession session) {

        String loginUserId = getLoginUserId(session);
        if (loginUserId == null) return "redirect:/Scout/signin";

        CommentDTO comment = new CommentDTO();
        comment.setArticleId(articleId);
        comment.setAuthor(loginUserId);
        comment.setContent(content);

        travelCommentService.insertComment(comment);
        return "redirect:/travel/" + articleId;
    }

    // 댓글 수정 (본인만 가능)
    @PostMapping("/travel/{articleId}/comment/{id}/update")
    public String updateComment(@PathVariable("articleId") int articleId,
                                @PathVariable("id") int id,
                                @RequestParam("content") String content,
                                HttpSession session) {

        String loginUserId = getLoginUserId(session);
        if (loginUserId == null) return "redirect:/Scout/signin";

        CommentDTO origin = travelCommentService.findById(id); 
        if (origin == null || !loginUserId.equals(origin.getAuthor())) {
            return "redirect:/travel/" + articleId;
        }

        CommentDTO comment = new CommentDTO();
        comment.setId(id);
        comment.setContent(content);

        travelCommentService.updateComment(comment);
        return "redirect:/travel/" + articleId;
    }

    // 댓글 삭제 (본인만 가능)
    @PostMapping("/travel/{articleId}/comment/{id}/delete")
    public String deleteComment(@PathVariable("articleId") int articleId,
                                @PathVariable("id") int id,
                                HttpSession session) {

        String loginUserId = getLoginUserId(session);
        if (loginUserId == null) return "redirect:/Scout/signin";

        CommentDTO origin = travelCommentService.findById(id);
        if (origin == null || !loginUserId.equals(origin.getAuthor())) {
            return "redirect:/travel/" + articleId;
        }

        travelCommentService.deleteComment(id);
        return "redirect:/travel/" + articleId;
    }
    
    private String getLoginUserId(HttpSession session) {
        Object loginUser = session.getAttribute("loginUser");
        if (loginUser == null) 
        	
        	return null;

        if (loginUser instanceof User) {
        	return String.valueOf(((User) loginUser).getId());
        }

        return null;
    }
}
	