package com.app.dao.community;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.app.dto.community.MentionDTO;
import com.app.dto.community.NotificationDTO;
import com.app.dto.community.TrendDTO;
import com.app.dto.community.UserDTO;
import com.app.dto.community.ChatMessageDTO;
import com.app.dto.community.ChatParticipantDTO;
import com.app.dto.community.ChatRoomDTO;
import com.app.dto.community.CommentDTO;
import com.app.dto.community.CommunityDTO;
import com.app.dto.community.CommunityPostDTO;


public interface CommunityDAO {
    List<CommunityPostDTO> findAllPosts();
    
    int insertPost(CommunityPostDTO dto);
    
    List<MentionDTO> findMentionsByPostId(int postId);
    
    int insertComment(CommentDTO commentDTO);
    int insertMention(MentionDTO mentionDTO);
    
    int getLastCommentId();
    
    List<CommunityPostDTO> findPostsByKeyword(String keyword);
    
    List<ChatRoomDTO> findChatRoomsByUserId(int userId);
    ChatRoomDTO findChatRoomById(int chatRoomId);
    int insertChatRoom(ChatRoomDTO dto);

    List<ChatMessageDTO> findMessagesByRoomId(int chatRoomId);
    int insertChatMessage(ChatMessageDTO dto);

    List<Integer> findParticipantsByRoomId(int chatRoomId);
    void insertChatParticipant(ChatParticipantDTO dto);

    List<CommunityPostDTO> findPostsByCategory(String category);
    List<TrendDTO> findLatestTrends();
    List<UserDTO> findRecommendedUsers(int userId);
    
    List<CommunityDTO> findAllCommunities();  
    int insertCommunity(CommunityDTO dto);
    
    List<NotificationDTO> findNotificationsByUserId(long userId, int offset, int limit);
    int countNotificationsUnread(long userId);
    int markNotificationAsRead(long notificationId);
    int markAllNotificationsAsRead(long userId);
    int insertNotification(NotificationDTO dto);
	
    
    UserDTO findUserById(int userId);
    UserDTO findUserByHandle(String handle);
    int updateUserProfile(UserDTO user);
    int updateUserPassword(@Param("userId") int userId, @Param("password") String password);
    int countFollowers(int userId);
    int countFollowing(int userId);
    List<CommunityPostDTO> findPostsByAuthor(@Param("userId") int userId,
                                             @Param("offset") int offset,
                                             @Param("limit") int limit);
}
