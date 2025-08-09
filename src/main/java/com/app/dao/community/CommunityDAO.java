// com/app/dao/community/CommunityDAO.java
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
    List<CommunityPostDTO> findPostsByAuthor(@Param("userId") int userId,
                                             @Param("offset") int offset,
                                             @Param("limit") int limit);

    // ===== Comments & Mentions =====
    int insertComment(CommentDTO commentDTO);
    int getLastCommentId();
    int insertMention(MentionDTO mentionDTO);
    List<MentionDTO> findMentionsByPostId(int postId);

    // ===== Trends & Recommend =====
    List<TrendDTO> findLatestTrends();
    List<UserDTO> findRecommendedUsers(int userId);

    // ===== Chat =====
    List<ChatRoomDTO> findChatRoomsByUserId(int userId);
    List<ChatMessageDTO> findMessagesByRoomId(int chatRoomId);
    int insertChatMessage(ChatMessageDTO dto);

    // ===== Communities =====
    List<CommunityDTO> findAllCommunities();
    int insertCommunity(CommunityDTO dto);

    // ===== Notifications =====
    List<NotificationDTO> findNotificationsByUserId(@Param("userId") int userId,
                                                    @Param("offset") int offset,
                                                    @Param("limit") int limit);
    int countUnread(int userId);
    int markAsRead(int notificationId);
    int markAllAsRead(int userId);
    int insertNotification(NotificationDTO dto);

    // ===== Users/Profile =====
    UserDTO findUserById(int userId);
    UserDTO findUserByHandle(String handle);
    int updateAccountCore(UserDTO dto); 
    int updateUserProfile(@Param("userId") int userId, @Param("nickname") String nickname);
    int updateUserPassword(@Param("userId") int userId,
                           @Param("password") String password);

    // ===== Follow counts =====
    int countFollowers(int userId);
    int countFollowing(int userId);
    
    int selectUserPkByLoginId(String id);
    
    User selectUserById(Integer userId);
    void updateUserAccount(User user);
}
