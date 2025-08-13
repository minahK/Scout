package com.app.controller;

import com.app.dao.community.CommunityDAO;
import com.app.dto.community.*;
import com.app.service.community.CommunityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.app.dto.user.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class CommunityController {

    @Autowired
    CommunityDAO communityDAO;

    @Autowired
    CommunityService communityService;

    // String 타입의 ID를 세션에서 가져오는 헬퍼 메서드
    private String getLoginUserId(HttpSession session) {
        if (session == null) return null;
        User user = (User) session.getAttribute("loginUser");
        return (user != null) ? user.getId() : null;
    }

    @GetMapping("/community/main")
    public String showCommunityMain(Model model, HttpSession session, HttpServletRequest request) {
        String loginId = getLoginUserId(session);
        if (loginId == null) {
            return "redirect:/Scout/signin";
        }

        User loginUser = communityService.getProfile(loginId);
        if (loginUser == null) {
            session.removeAttribute("loginUser");
            return "redirect:/Scout/signin";
        }
        model.addAttribute("loginUser", loginUser);

        List<CommunityPostDTO> postList = communityDAO.findAllPosts();
        model.addAttribute("posts", postList);

        Map<Integer, Map<String, Integer>> reactionMap = new HashMap<>();
        Map<Integer, List<MentionDTO>> commentsMap = new HashMap<>();
        for (CommunityPostDTO post : postList) {
            Map<String, Integer> r = new HashMap<>();
            r.put("likes", post.getLikesCount());
            r.put("retweets", post.getRepostsCount());
            reactionMap.put(post.getPostId(), r);

            commentsMap.put(post.getPostId(), communityDAO.findMentionsByPostId(post.getPostId()));
        }
        model.addAttribute("reactionMap", reactionMap);
        model.addAttribute("commentsMap", commentsMap);
        model.addAttribute("trends", communityService.findLatestTrends());
        model.addAttribute("recommendedUsers", communityService.findRecommendedUsers(loginId));

        return "community/communityMain";
    }

    @PostMapping("/community/post")
    public String createPost(@RequestParam("content") String content,
                             HttpSession session,
                             RedirectAttributes ra) {
        String loginId = getLoginUserId(session);
        if (loginId == null) return "redirect:/signin";

        CommunityPostDTO dto = new CommunityPostDTO();
        dto.setAuthorId(loginId);
        dto.setContent(content);

        int r = communityDAO.insertPost(dto);
        ra.addFlashAttribute("msg", r > 0 ? "게시물이 등록되었어요." : "등록 실패");
        return "redirect:/community/main";
    }

//    @PostMapping("/community/mention/add")
//    @ResponseBody
//    public String addMention(@ModelAttribute MentionDTO mentionDTO, HttpSession session) {
//        String loginId = getLoginUserId(session);
//        if (loginId == null) return "unauthorized";
//
//        CommentDTO comment = new CommentDTO();
//        comment.setPostId(mentionDTO.getPostId());
//        comment.setUserId(loginId);
//        comment.setContent(mentionDTO.getContent());
//        communityDAO.insertComment(comment);
//
//        int commentId = communityDAO.getLastCommentId();
//        mentionDTO.setCommentId(commentId);
//        int result = communityDAO.insertMention(mentionDTO);
//
//        return result > 0 ? "success" : "fail";
//    }

    @GetMapping("/community/search")
    public String searchPosts(@RequestParam(required = false) String keyword,
                              Model model, HttpSession session) {
        String loginId = getLoginUserId(session);
        if (loginId == null) return "redirect:/signin";

        model.addAttribute("loginUser", communityService.getProfile(loginId));

        if (keyword != null && !keyword.trim().isEmpty()) {
            List<CommunityPostDTO> posts = communityService.searchPostsByKeyword(keyword.trim());
            model.addAttribute("posts", posts);
        } else {
            model.addAttribute("posts", Collections.emptyList());
        }

        model.addAttribute("trends", communityService.findLatestTrends());
        model.addAttribute("recommendedUsers", communityService.findRecommendedUsers(loginId));

        model.addAttribute("keyword", keyword);

        return "community/communitySearch";
    }

    @GetMapping("/community/notifications")
    public String notificationPage(@RequestParam(defaultValue = "1") int page,
                                   @RequestParam(defaultValue = "20") int size,
                                   HttpSession session,
                                   HttpServletRequest req,
                                   Model model) {
        String loginId = getLoginUserId(session);
        if (loginId == null) {
            return "redirect:/Scout/signin";
        }

        User loginUser = communityService.getProfile(loginId);
        if (loginUser == null) {
            session.removeAttribute("loginUser");
            return "redirect:/Scout/signin";
        }
        model.addAttribute("loginUser", loginUser);

        model.addAttribute("notifications", communityService.listNotifications(loginId, page, size, req));
        model.addAttribute("unreadCount", communityService.countNotificationsUnread(loginId));
        model.addAttribute("recommendedUsers", communityService.findRecommendedUsers(loginId));
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        model.addAttribute("isPreview", false);

        return "community/communityNotifications";
    }

    @GetMapping("/community/messages")
    public String openMessagesPage(@RequestParam(value = "roomId", required = false) Integer roomId,
                                   Model model, HttpSession session) {
        String loginId = getLoginUserId(session);
        if (loginId == null) return "redirect:/signin";

        User loginUser = communityService.getProfile(loginId);
        List<ChatRoomDTO> chatRooms = communityService.findChatRoomsByUserId(loginId);

        if (roomId == null && !chatRooms.isEmpty()) {
            roomId = chatRooms.get(0).getChatRoomId();
        }

        List<ChatMessageDTO> messages = (roomId != null)
                ? communityService.findMessagesByRoomId(roomId)
                : Collections.emptyList();

        model.addAttribute("chatRooms", chatRooms);
        model.addAttribute("messages", messages);
        model.addAttribute("currentRoomId", roomId);
        model.addAttribute("loginUser", loginUser);

        return "community/communityMessages";
    }

//    @PostMapping("/community/messages/send")
//    @ResponseBody
//    public String sendMessage(@RequestParam int roomId, @RequestParam String content, HttpSession session) {
//        String loginId = getLoginUserId(session);
//        if (loginId == null) return "unauthorized";
//
//        ChatMessageDTO dto = new ChatMessageDTO();
//        dto.setChatRoomId(roomId);
//        dto.setSenderId(loginId);
//        dto.setContent(content);
//        int result = communityService.insertChatMessage(dto);
//        return result > 0 ? "success" : "fail";
//    }

    @GetMapping("/community/new-chat")
    public String newChatPage(Model model) {
        return "community/newChat";
    }

    @GetMapping("/community/communities")
    public String communitiesPage(HttpSession session, Model model) {
        String loginId = getLoginUserId(session);
        if (loginId == null) return "redirect:/signin";

        model.addAttribute("communityList", communityService.getAllCommunities());
        model.addAttribute("trendList", communityService.findLatestTrends());
        model.addAttribute("recommendedUsers", communityService.findRecommendedUsers(loginId));
        return "community/communityCommunities";
    }

    @PostMapping("/community/communities/create")
    public String createCommunity(@RequestParam String name, @RequestParam String description, HttpSession session) {
        String loginId = getLoginUserId(session);
        if (loginId == null) return "redirect:/signin";

        CommunityDTO dto = new CommunityDTO();
        dto.setName(name);
        dto.setDescription(description);
        communityService.createCommunity(dto);
        return "redirect:/community/communities";
    }

    @GetMapping("/community/profile")
    public String profilePage(
            @RequestParam(value = "id", required = false) String idParam,
            HttpSession session,
            Model model) {

        String loginId = getLoginUserId(session);
        String targetId = (idParam != null) ? idParam : loginId;

        if (targetId == null) {
            model.addAttribute("error", "조회할 사용자 정보를 찾을 수 없습니다.");
            return "community/error";
        }

        User profile = communityService.getProfile(targetId);
        model.addAttribute("user", profile);
        model.addAttribute("recommendedUsers", communityService.findRecommendedUsers(targetId));

        boolean isOwner = (loginId != null && loginId.equals(targetId));
        model.addAttribute("isOwner", isOwner);

        model.addAttribute("followerCount", communityService.getFollowerCount(targetId));
        model.addAttribute("followingCount", communityService.getFollowingCount(targetId));
        model.addAttribute("posts", communityService.getUserPosts(targetId, 1, 20));

        return "community/communityProfile";
    }

    @GetMapping("/community/profile/edit")
    public String profileEditForm(HttpSession session, Model model) {
        String loginId = getLoginUserId(session);
        if (loginId == null) return "redirect:/signin";

        User me = communityService.getProfile(loginId);
        model.addAttribute("loginUser", me);
        model.addAttribute("user", me);
        model.addAttribute("isOwner", true);
        model.addAttribute("preview", false);
        return "community/communityProfileEdit";
    }

    @GetMapping("/community/settings/account")
    public String accountSettingsPage(HttpSession session, Model model) {
        String loginId = getLoginUserId(session);
        if (loginId == null) {
            return "redirect:/login";
        }

        User user = communityService.getUserById(loginId);
        model.addAttribute("user", user);

        String displayName = (user != null && user.getName() != null && !user.getName().trim().isEmpty()) ? user.getName() : "Guest";
        model.addAttribute("displayName", displayName);
        model.addAttribute("atId", user.getId());

        return "community/settingsAccount";
    }

    @PostMapping("/community/settings/account")
    public String updateAccountSettings(@ModelAttribute User userForm,
                                        HttpSession session,
                                        RedirectAttributes redirectAttributes) {
        String loginId = getLoginUserId(session);
        if (loginId == null) {
            return "redirect:/login";
        }
        
        userForm.setId(loginId);
        communityService.updateUserAccount(userForm);

        redirectAttributes.addFlashAttribute("msg", "계정 정보가 수정되었습니다.");
        return "redirect:/community/settings/account";
    }

    private Integer safeInt(Object v) {
        if (v == null) return null;
        if (v instanceof Number) return ((Number) v).intValue();
        try { return Integer.parseInt(String.valueOf(v).trim()); } catch (Exception e) { return null; }
    }
    private String toStr(Object v) { return v == null ? null : String.valueOf(v).trim(); }
    private boolean isEmpty(String s){ return s==null || s.isEmpty(); }
}