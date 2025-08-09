package com.app.controller;

import com.app.dao.community.CommunityDAO;
import com.app.dto.community.*;
import com.app.service.community.CommunityService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class CommunityController {

    @Autowired
    CommunityDAO communityDAO;

    @Autowired
    CommunityService communityService;

    @GetMapping("/community/main")
    public String showCommunityMain(Model model, HttpSession session) {
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        model.addAttribute("loginUser", loginUser);

        Integer currentUserId = (loginUser != null) ? loginUser.getUserId() : 1;

        List<CommunityPostDTO> postList = communityDAO.findAllPosts();
        model.addAttribute("posts", postList);

        Map<Integer, Map<String, Integer>> reactionMap = new HashMap<>();
        for (CommunityPostDTO post : postList) {
            Map<String, Integer> reaction = Map.of(
                "likes", post.getLikesCount(),
                "retweets", post.getRepostsCount()
            );
            reactionMap.put(post.getPostId(), reaction);
        }
        model.addAttribute("reactionMap", reactionMap);

        Map<Integer, List<MentionDTO>> commentsMap = new HashMap<>();
        for (CommunityPostDTO post : postList) {
            commentsMap.put(post.getPostId(), communityDAO.findMentionsByPostId(post.getPostId()));
        }
        model.addAttribute("commentsMap", commentsMap);

        model.addAttribute("trends", communityService.findLatestTrends());
        model.addAttribute("recommendedUsers", communityService.findRecommendedUsers(currentUserId));

        return "community/communityMain";
    }

    @GetMapping("/community/mentions/{postId}")
    public String getMentions(@PathVariable int postId, Model model) {
        List<MentionDTO> mentions = communityDAO.findMentionsByPostId(postId);
        model.addAttribute("mentions", mentions);
        return "community/mentions";
    }

    @PostMapping("/community/mention/add")
    @ResponseBody
    public String addMention(@ModelAttribute MentionDTO mentionDTO, HttpSession session) {
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        if (loginUser == null) return "unauthorized";

        CommentDTO comment = new CommentDTO();
        comment.setPostId(mentionDTO.getPostId());
        comment.setUserId(loginUser.getUserId());
        comment.setContent(mentionDTO.getContent());
        communityDAO.insertComment(comment);

        int commentId = communityDAO.getLastCommentId();
        mentionDTO.setCommentId(commentId);
        int result = communityDAO.insertMention(mentionDTO);

        return result > 0 ? "success" : "fail";
    }

    @GetMapping("/community/search")
    public String searchPosts(@RequestParam(required = false) String keyword, Model model, HttpSession session) {
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        model.addAttribute("loginUser", loginUser);

        if (keyword != null && !keyword.trim().isEmpty()) {
            List<CommunityPostDTO> posts = communityService.searchPostsByKeyword(keyword);
            model.addAttribute("posts", posts);
        }

        model.addAttribute("trends", communityService.findLatestTrends());
        model.addAttribute("recommendedUsers", 
            loginUser != null 
                ? communityService.findRecommendedUsers(loginUser.getUserId()) 
                : new ArrayList<>()
        );
        model.addAttribute("keyword", keyword);

        return "community/communitySearch";
    }
    
    
    
    

    private static final int DEMO_USER_ID = 1; // 샘플로 볼 사용자 ID (원하는 값으로 바꿔도 됨)

    @GetMapping("/community/notifications")
    public String notificationPage(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20") int size, @RequestParam(defaultValue = "false") boolean preview, 
                                   @RequestParam(required = false) Integer uid, HttpSession session, HttpServletRequest req, Model model) {

        Object idObj = session.getAttribute("loginUserId");

        if (idObj == null && preview) {
            int previewUserId = (uid != null) ? uid : DEMO_USER_ID;
            model.addAttribute("notifications", communityService.listNotifications(previewUserId, page, size, req));
            model.addAttribute("unreadCount", communityService.countNotificationsUnread(previewUserId));
            model.addAttribute("page", page);
            model.addAttribute("size", size);
            model.addAttribute("isPreview", true);
            return "community/communityNotifications";
        }

        if (idObj == null) {
            return "redirect:/login";
        }

        int userId = (idObj instanceof Number) ? ((Number) idObj).intValue() : Integer.parseInt(String.valueOf(idObj));

        model.addAttribute("notifications", communityService.listNotifications(userId, page, size, req));
        model.addAttribute("unreadCount", communityService.countNotificationsUnread(userId));
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        model.addAttribute("isPreview", false);
        return "community/communityNotifications";
    }
    
    
    
    
    

    @GetMapping("/community/messages")
    public String openMessagesPage(@RequestParam(value = "roomId", required = false) Integer roomId,
                                    Model model, HttpSession session) {
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            loginUser = new UserDTO();
            loginUser.setUserId(999);
            loginUser.setNickname("테스트유저");
            loginUser.setHandle("@testuser");
            loginUser.setProfileImage("community/dog.jpg");
        }

        int userId = loginUser.getUserId();

        List<ChatRoomDTO> chatRooms = communityService.findChatRoomsByUserId(userId);

        if (roomId == null && !chatRooms.isEmpty()) {
            roomId = chatRooms.get(0).getChatRoomId();
        }

        List<ChatMessageDTO> messages = (roomId != null)
            ? communityService.findMessagesByRoomId(roomId)
            : List.of();

        model.addAttribute("chatRooms", chatRooms);
        model.addAttribute("messages", messages);
        model.addAttribute("currentRoomId", roomId);
        model.addAttribute("loginUser", loginUser);

        return "community/communityMessages";
    }

    @PostMapping("/community/messages/send")
    @ResponseBody
    public String sendMessage(@RequestParam int roomId, @RequestParam String content, HttpSession session) {
        int userId = ((UserDTO) session.getAttribute("loginUser")).getUserId();
        ChatMessageDTO dto = new ChatMessageDTO();
        dto.setChatRoomId(roomId);
        dto.setSenderId(userId);
        dto.setContent(content);
        int result = communityService.insertChatMessage(dto);
        return result > 0 ? "success" : "fail";
    }
    
    
    

    @GetMapping("/community/communities")
    public String communitiesPage(HttpSession session, Model model) {

        List<CommunityDTO> communityList = communityService.getAllCommunities();
        model.addAttribute("communityList", communityList);

        List<TrendDTO> trendList = communityService.findLatestTrends();
        model.addAttribute("trendList", trendList);

        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        if (loginUser != null) {
            List<UserDTO> recommendedUsers = communityService.findRecommendedUsers(loginUser.getUserId());
            model.addAttribute("recommendedUsers", recommendedUsers);
        } else {
            model.addAttribute("recommendedUsers", Collections.emptyList());
        }

        return "community/communityCommunities";
    }

    @PostMapping("/community/communities/create")
    public String createCommunity(@RequestParam String name, @RequestParam String description) {
        CommunityDTO dto = new CommunityDTO();
        dto.setName(name);
        dto.setDescription(description);
        communityService.createCommunity(dto); 

        return "redirect:/community/communities";
    }
    
    
    
    
    
    
    @GetMapping("/community/profile")
    public String profilePage(@RequestParam(required = false) Integer userId,
                              @RequestParam(required = false) String handle,
                              @RequestParam(defaultValue = "1") int page,
                              @RequestParam(defaultValue = "20") int size,
                              HttpSession session,
                              Model model) {

        Integer loginId = null;
        Object idObj = session.getAttribute("loginUserId");
        if (idObj instanceof Number) loginId = ((Number) idObj).intValue();
        else if (idObj != null) {
            try { loginId = Integer.parseInt(String.valueOf(idObj)); } catch (Exception ignore) {}
        }
        boolean loggedIn = (loginId != null && loginId > 0);

        com.app.dto.community.UserDTO user = null;
        if (userId != null && userId > 0) {
            user = communityService.getProfile(userId);
        } else if (handle != null && !handle.isBlank()) {
            user = communityService.getProfileByHandle(handle);
        } else if (loggedIn) {
            user = communityService.getProfile(loginId);
        } else {
            model.addAttribute("guest", true);
            return "community/communityProfile";
        }

        if (user == null) {
            model.addAttribute("guest", true);
            return "community/communityProfile";
        }

        int targetId = user.getUserId();

        model.addAttribute("user", user);
        model.addAttribute("isOwner", loggedIn && (loginId == targetId));
        model.addAttribute("loggedIn", loggedIn);
        model.addAttribute("followerCount", communityService.getFollowerCount(targetId));
        model.addAttribute("followingCount", communityService.getFollowingCount(targetId));
        model.addAttribute("posts", communityService.getUserPosts(targetId, page, size));
        model.addAttribute("recommendedUsers", communityService.findRecommendedUsers(targetId));
        model.addAttribute("page", page);
        model.addAttribute("size", size);

        return "community/communityProfile";
    }
    

    @GetMapping("/community/profile/edit")
    public String profileEditForm(@RequestParam(defaultValue = "false") boolean preview,
                                  @RequestParam(required = false) Integer uid,
                                  HttpSession session, Model model) {
        Object idObj = session.getAttribute("loginUserId");

        // 로그인 안 됐는데 preview 요청이면 통과
        if (idObj == null && preview) {
            int targetId = (uid != null) ? uid : DEMO_USER_ID;
            model.addAttribute("user", communityService.getProfile(targetId));
            model.addAttribute("loginUser", null);
            model.addAttribute("isOwner", false);
            model.addAttribute("preview", true);     // ⬅ JSP에서 읽기전용 처리
            return "community/communityProfileEdit";
        }

        // 그 외엔 로그인 요구
        if (idObj == null) return "redirect:/login";

        int userId = (idObj instanceof Number) ? ((Number) idObj).intValue()
                                               : Integer.parseInt(String.valueOf(idObj));
        model.addAttribute("user", communityService.getProfile(userId));
        model.addAttribute("loginUser", communityService.getProfile(userId));
        model.addAttribute("isOwner", true);
        model.addAttribute("preview", false);
        return "community/communityProfileEdit";
    }

    @PostMapping("/community/profile/edit")
    public String profileEditSave(@RequestParam String nickname,
                                  @RequestParam(name = "profileImageFile", required = false) MultipartFile file,
                                  HttpServletRequest req,
                                  HttpSession session,
                                  RedirectAttributes ra) {
        Object idObj = session.getAttribute("loginUserId");
        if (idObj == null) return "redirect:/login";

        int userId = (idObj instanceof Number) ? ((Number) idObj).intValue()
                                               : Integer.parseInt(String.valueOf(idObj));
        try {

            communityService.updateProfileBasic(userId, nickname, file, req);
            ra.addFlashAttribute("msg", "프로필이 저장되었습니다.");
        } catch (Exception e) {
            ra.addFlashAttribute("msg", "저장 중 오류: " + e.getMessage());
        }
        return "redirect:/community/profile?userId=" + userId;
    }
}
