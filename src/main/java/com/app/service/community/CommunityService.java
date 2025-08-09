package com.app.service.community;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.app.dto.community.ChatMessageDTO;
import com.app.dto.community.ChatRoomDTO;
import com.app.dto.community.CommentDTO;
import com.app.dto.community.CommunityDTO;
import com.app.dto.community.CommunityPostDTO;
import com.app.dto.community.MentionDTO;
import com.app.dto.community.NotificationDTO;
import com.app.dto.community.TrendDTO;
import com.app.dto.community.UserDTO;

public interface CommunityService {

    /** 게시글 관련 **/
    List<CommunityPostDTO> getAllPosts();
    int createPost(CommunityPostDTO postDTO);
    List<CommunityPostDTO> searchPostsByKeyword(String keyword);
    List<CommunityPostDTO> getPostsByCategory(String category);

    /** 댓글 및 멘션 처리 **/
    void writeCommentWithMentions(CommentDTO commentDTO, List<MentionDTO> mentionList);
    List<MentionDTO> findMentionsByPostId(int postId);

    /** 실시간 트렌드 및 팔로우 추천 **/
    List<TrendDTO> findLatestTrends();
    List<UserDTO> findRecommendedUsers(int userId);

    /** 채팅 관련 **/
    List<ChatRoomDTO> findChatRoomsByUserId(int userId);
    List<ChatMessageDTO> findMessagesByRoomId(int roomId);
    int insertChatMessage(ChatMessageDTO dto);
    
    List<CommunityDTO> getAllCommunities(); 
    int createCommunity(CommunityDTO dto); 
    
    List<NotificationDTO> listNotifications(int userId, int page, int size, HttpServletRequest req);
    int countNotificationsUnread(int userId);
    void markNotificationAsRead(int notificationId);
    void markAllNotificationsAsRead(int userId);
    void createNotification(int toUserId, String type, int refId);
    
    
    UserDTO getProfile(int userId);
    UserDTO getProfileByHandle(String handle);
    int getFollowerCount(int userId);
    int getFollowingCount(int userId);
    List<CommunityPostDTO> getUserPosts(int userId, int page, int size);
    void updateProfileBasic(int userId, String nickname, MultipartFile profileImageFile, HttpServletRequest req) throws IOException;
}
