package com.app.service.community;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.app.dto.community.ChatMessageDTO;
import com.app.dto.community.ChatRoomDTO;
import com.app.dto.community.CommunityDTO;
import com.app.dto.community.CommunityPostDTO;
import com.app.dto.community.NotificationDTO;
import com.app.dto.community.TrendDTO;
import com.app.dto.user.User;

public interface CommunityService {

    // ===== 프로필/유저 =====
    User getProfile(String id);
    User getProfileByHandle(String handle);
    void updateProfileBasic(String id, String name, MultipartFile file, HttpServletRequest req);

    // ===== 게시글/검색 =====
    List<CommunityPostDTO> searchPostsByKeyword(String keyword);
    List<CommunityPostDTO> getUserPosts(String id, int page, int size);

    // ===== 트렌드/추천 =====
    List<TrendDTO> findLatestTrends();
    List<User> findRecommendedUsers(String id);

    // ===== 채팅 =====
    List<ChatRoomDTO> findChatRoomsByUserId(String id);
    List<ChatMessageDTO> findMessagesByRoomId(int roomId);
    int insertChatMessage(ChatMessageDTO dto);

    // ===== 커뮤니티 =====
    List<CommunityDTO> getAllCommunities();
    int createCommunity(CommunityDTO dto);

    // ===== 팔로우 카운트 =====
    int getFollowerCount(String id);
    int getFollowingCount(String id);
    
    // ===== 팔로우/유저 정보 (핸들 기반) =====
    int getFollowerCountByHandle(String handle);
    int getFollowingCountByHandle(String handle);
    List<CommunityPostDTO> getUserPostsByHandle(String handle, int page, int size);
    
    // ===== 알림 =====
    List<NotificationDTO> listNotifications(String id, int page, int size, HttpServletRequest req);
    int countNotificationsUnread(String id);

    // ===== 계정 관리 =====
    User getUserById(String id);
    void updateUserAccount(User user);
}