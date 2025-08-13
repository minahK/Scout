package com.app.dao.community;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.app.dto.community.*;
import com.app.dto.user.User;

public interface CommunityDAO {

    // ===== Posts =====
    List<CommunityPostDTO> findAllPosts();
    int insertPost(CommunityPostDTO dto);
    List<CommunityPostDTO> findPostsByKeyword(String keyword);
    List<CommunityPostDTO> findPostsByCategory(String category);
    List<CommunityPostDTO> findPostsByAuthor(@Param("id") String id,
                                             @Param("offset") int offset,
                                             @Param("limit") int limit);

    // ===== Comments & Mentions =====
    int insertComment(CommentDTO commentDTO);
    int getLastCommentId();
    int insertMention(MentionDTO mentionDTO);
    List<MentionDTO> findMentionsByPostId(int postId);

    // ===== Trends & Recommend =====
    List<TrendDTO> findLatestTrends();
    List<User> findRecommendedUsers(@Param("id") String id);

    // ===== Chat =====
    List<ChatRoomDTO> findChatRoomsByUserId(@Param("id") String id);
    List<ChatMessageDTO> findMessagesByRoomId(int chatRoomId);
    int insertChatMessage(ChatMessageDTO dto);

    // ===== Communities =====
    List<CommunityDTO> findAllCommunities();
    int insertCommunity(CommunityDTO dto);

    // ===== Notifications =====
    List<NotificationDTO> findNotificationsByUserId(@Param("id") String id,
                                                    @Param("offset") int offset,
                                                    @Param("limit") int limit);
    int countUnread(@Param("id") String id);
    int markAsRead(int notificationId);
    int markAllAsRead(@Param("id") String id);
    int insertNotification(NotificationDTO dto);

    // ===== Users/Profile =====
    User findUserById(@Param("id") String id);
    User findUserByHandle(@Param("handle") String handle);
    int updateAccountCore(User dto);
    int updateUserProfile(@Param("id") String id, @Param("name") String name);
    int updateUserPassword(@Param("id") String id, @Param("password") String password);

    // ===== Follow counts =====
    int countFollowers(@Param("id") String id);
    int countFollowing(@Param("id") String id);
    
    // 이 메서드는 로그인 ID를 받아 PK를 조회하는 용도이므로 int를 반환하는 것이 맞습니다.
    int selectUserPkByLoginId(@Param("id") String id); 
    
    User selectUserById(@Param("id") String id);
    void updateUserAccount(User user);
}