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

    @GetMapping("/community/main")
    public String showCommunityMain(Model model, HttpSession session, HttpServletRequest request) {
    	Integer userId = getLoginUserId(session);
        if (userId == null) {
            return "redirect:/Scout/signin";
        }

        UserDTO loginUser = communityService.getProfile(userId);
        if (loginUser == null) {
            session.removeAttribute("loginUserId");
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
        model.addAttribute("recommendedUsers", communityService.findRecommendedUsers(userId));

        return "community/communityMain";
    }

    private Integer getLoginUserId(HttpSession session) {
        if (session == null) return null;

        Object v = session.getAttribute("loginUserId");

        Integer pk = safeInt(v);
        if (pk != null) return pk;

        String loginId = toStr(session.getAttribute("id"));
        if (isEmpty(loginId)) loginId = toStr(session.getAttribute("loginId"));
        if (isEmpty(loginId)) loginId = toStr(v);

        if (!isEmpty(loginId)) {
            try {
                UserDTO profile = communityService.getProfileByHandle(loginId);
                if (profile != null) {
                    session.setAttribute("loginUserId", profile.getUserId());
                    putCommunitySession(session, profile);
                    return profile.getUserId();
                }
            } catch (Exception ignore) {}
        }
        return null;
    }
    
    private void putCommunitySession(HttpSession session, UserDTO p) {
        if (session == null || p == null) return;
        session.setAttribute("communityUser", p);
        String dn = (p.getNickname()!=null && !p.getNickname().isEmpty()) ? p.getNickname()
                  : (p.getHandle()!=null && !p.getHandle().isEmpty()) ? p.getHandle()
                  : String.valueOf(p.getUserId());
        session.setAttribute("displayName", dn);
    }

    private Integer safeInt(Object v) {
        if (v == null) return null;
        if (v instanceof Number) return ((Number) v).intValue();
        try { return Integer.parseInt(String.valueOf(v).trim()); } catch (Exception e) { return null; }
    }
    private String toStr(Object v) { return v == null ? null : String.valueOf(v).trim(); }
    private boolean isEmpty(String s){ return s==null || s.isEmpty(); }


    @PostMapping("/community/post")
    public String createPost(@RequestParam("content") String content,
                             HttpSession session,
                             RedirectAttributes ra) {
        Integer userId = getLoginUserId(session);
        if (userId == null) return "redirect:/signin";

        CommunityPostDTO dto = new CommunityPostDTO();
        dto.setAuthorId(userId);
        dto.setContent(content);

        int r = communityDAO.insertPost(dto);
        ra.addFlashAttribute("msg", r > 0 ? "게시물이 등록되었어요." : "등록 실패");
        return "redirect:/community/main";
    }

    @PostMapping("/community/mention/add")
    @ResponseBody
    public String addMention(@ModelAttribute MentionDTO mentionDTO, HttpSession session) {
        Integer userId = getLoginUserId(session);
        if (userId == null) return "unauthorized";

        CommentDTO comment = new CommentDTO();
        comment.setPostId(mentionDTO.getPostId());
        comment.setUserId(userId);
        comment.setContent(mentionDTO.getContent());
        communityDAO.insertComment(comment);

        int commentId = communityDAO.getLastCommentId();
        mentionDTO.setCommentId(commentId);
        int result = communityDAO.insertMention(mentionDTO);

        return result > 0 ? "success" : "fail";
    }

    @GetMapping("/community/search")
    public String searchPosts(@RequestParam(required = false) String keyword,
                              Model model, HttpSession session) {
        Integer userId = getLoginUserId(session);
        if (userId == null) return "redirect:/signin";

        model.addAttribute("loginUser", communityService.getProfile(userId));

        if (keyword != null && !keyword.trim().isEmpty()) {
            List<CommunityPostDTO> posts = communityService.searchPostsByKeyword(keyword.trim());
            model.addAttribute("posts", posts);
        } else {
            model.addAttribute("posts", Collections.emptyList());
        }

        model.addAttribute("trends", communityService.findLatestTrends());
        model.addAttribute("recommendedUsers", communityService.findRecommendedUsers(userId));
        model.addAttribute("keyword", keyword);

        return "community/communitySearch";
    }

    @GetMapping("/community/notifications")
    public String notificationPage(@RequestParam(defaultValue = "1") int page,
                                   @RequestParam(defaultValue = "20") int size,
                                   HttpSession session,
                                   HttpServletRequest req,
                                   Model model) {
        Integer userId = getLoginUserId(session);
        if (userId == null) {
            return "redirect:/Scout/signin";
        }

        UserDTO loginUser = communityService.getProfile(userId);
        if (loginUser == null) {
            session.removeAttribute("loginUserId");
            session.removeAttribute("loginUser");
            return "redirect:/Scout/signin";
        }
        model.addAttribute("loginUser", loginUser);
        session.setAttribute("loginUser", loginUser);

        model.addAttribute("notifications", communityService.listNotifications(userId, page, size, req));
        model.addAttribute("unreadCount", communityService.countNotificationsUnread(userId));
        model.addAttribute("recommendedUsers", communityService.findRecommendedUsers(userId));
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        model.addAttribute("isPreview", false);

        return "community/communityNotifications";
    }


    @GetMapping("/community/messages")
    public String openMessagesPage(@RequestParam(value = "roomId", required = false) Integer roomId,
                                   Model model, HttpSession session) {
        Integer userId = getLoginUserId(session);
        if (userId == null) return "redirect:/signin";

        UserDTO loginUser = communityService.getProfile(userId);
        List<ChatRoomDTO> chatRooms = communityService.findChatRoomsByUserId(userId);

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

    @PostMapping("/community/messages/send")
    @ResponseBody
    public String sendMessage(@RequestParam int roomId, @RequestParam String content, HttpSession session) {
        Integer userId = getLoginUserId(session);
        if (userId == null) return "unauthorized";

        ChatMessageDTO dto = new ChatMessageDTO();
        dto.setChatRoomId(roomId);
        dto.setSenderId(userId);
        dto.setContent(content);
        int result = communityService.insertChatMessage(dto);
        return result > 0 ? "success" : "fail";
    }

    @GetMapping("/community/communities")
    public String communitiesPage(HttpSession session, Model model) {
        Integer userId = getLoginUserId(session);
        if (userId == null) return "redirect:/signin";

        model.addAttribute("communityList", communityService.getAllCommunities());
        model.addAttribute("trendList", communityService.findLatestTrends());
        model.addAttribute("recommendedUsers", communityService.findRecommendedUsers(userId));
        return "community/communityCommunities";
    }

    @PostMapping("/community/communities/create")
    public String createCommunity(@RequestParam String name, @RequestParam String description, HttpSession session) {
        Integer userId = getLoginUserId(session);
        if (userId == null) return "redirect:/signin";

        CommunityDTO dto = new CommunityDTO();
        dto.setName(name);
        dto.setDescription(description);
        communityService.createCommunity(dto);
        return "redirect:/community/communities";
    }

    @GetMapping("/community/profile")
    public String profilePage(
            @RequestParam(value = "userId", required = false) Integer userIdParam,
            HttpSession session,
            Model model) {

        Integer targetUserId = resolveTargetUserId(userIdParam, session);

        if (targetUserId == null) {
            model.addAttribute("error", "조회할 사용자 정보를 찾을 수 없습니다.");
            return "community/error";
        }
        int uid = targetUserId;

        UserDTO profile = communityService.getProfile(uid);
        model.addAttribute("user", profile);
        model.addAttribute("recommendedUsers", communityService.findRecommendedUsers(targetUserId));
        
        return "community/communityProfile";
    }
    
    private Integer resolveTargetUserId(Integer userIdParam, HttpSession session) {
        if (userIdParam != null) return userIdParam;

        return getLoginUserId(session);
    }

    @GetMapping("/community/profile/edit")
    public String profileEditForm(HttpSession session, Model model) {
        Integer userId = getLoginUserId(session);
        if (userId == null) return "redirect:/signin";

        UserDTO me = communityService.getProfile(userId);

        model.addAttribute("loginUser", me);
        model.addAttribute("user", asViewUser(me));

        model.addAttribute("isOwner", true);
        model.addAttribute("preview", false);
        return "community/communityProfileEdit";
    }
    
    private Map<String, Object> asViewUser(UserDTO dto) {
        if (dto == null) return Collections.emptyMap();
        Map<String, Object> m = new HashMap<>();
        m.put("name", dto.getNickname()); 
        m.put("id", dto.getHandle()); 
        m.put("userId", dto.getUserId());
        m.put("nickname", dto.getNickname());
        m.put("handle", dto.getHandle());
        return m;
    }   
    
    @GetMapping("/community/settings/account")
    public String accountSettingsPage(HttpSession session, Model model) {
        Integer loginUserId = (Integer) session.getAttribute("loginUserId");
        if (loginUserId == null) {
            return "redirect:/login";
        }

        User user = communityService.getUserById(loginUserId);
        model.addAttribute("user", user);

        String idLike = null;
        if (user != null) {
            try {
                idLike = user.getId(); 
            } catch (Exception ignore) { }
        }
        String displayName = (idLike != null && !idLike.trim().isEmpty()) ? idLike : "Guest";
        String atId        = displayName;

        model.addAttribute("displayName", displayName);
        model.addAttribute("atId", atId);

        return "community/settingsAccount";
    }

    @PostMapping("/community/settings/account")
    public String updateAccountSettings(@ModelAttribute User userForm,
                                        HttpSession session,
                                        RedirectAttributes redirectAttributes) {
        Integer loginUserId = (Integer) session.getAttribute("loginUserId");
        if (loginUserId == null) {
            return "redirect:/login";
        }

        userForm.setId(String.valueOf(loginUserId));
        communityService.updateUserAccount(userForm);

        redirectAttributes.addFlashAttribute("msg", "계정 정보가 수정되었습니다.");
        return "redirect:/community/settings/account";
    }

    
}
