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
import com.app.dto.community.UserDTO;
import com.app.dto.user.User;

public interface CommunityService {

    // ===== 프로필/유저 =====
    UserDTO getProfile(int userId);
    UserDTO getProfileByHandle(String handle);
    void updateProfileBasic(int userId, String nickname, MultipartFile file, HttpServletRequest req);

    // ===== 게시글/검색 =====
    List<CommunityPostDTO> searchPostsByKeyword(String keyword);
    List<CommunityPostDTO> getUserPosts(int userId, int page, int size);

    // ===== 트렌드/추천 =====
    List<TrendDTO> findLatestTrends();
    List<UserDTO> findRecommendedUsers(int userId);

    // ===== 채팅 =====
    List<ChatRoomDTO> findChatRoomsByUserId(int userId);
    List<ChatMessageDTO> findMessagesByRoomId(int roomId);
    int insertChatMessage(ChatMessageDTO dto);

    // ===== 커뮤니티 =====
    List<CommunityDTO> getAllCommunities();
    int createCommunity(CommunityDTO dto);

    // ===== 팔로우 카운트 =====
    int getFollowerCount(int userId);
    int getFollowingCount(int userId);

    // ===== 알림 =====
    List<NotificationDTO> listNotifications(int userId, int page, int size, HttpServletRequest req);
    int countNotificationsUnread(int userId);
    
    User getProfileAsUser(Integer userId);
    User getProfileByHandleAsUser(String handle);
    List<User> findRecommendedUsersAsUser(Integer userId);
    
    int getFollowerCountByHandle(String handle);
    int getFollowingCountByHandle(String handle);
    List<CommunityPostDTO> getUserPostsByHandle(String handle, int page, int size);
    
    User getUserById(Integer userId);
    void updateUserAccount(User user);
}
