package com.app.dao.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.community.CommunityDAO;
import com.app.dto.community.*;

@Repository
public class CommunityDAOImpl implements CommunityDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    private static final String NAMESPACE = "CommunityPost_mapper.";

    @Override
    public List<CommunityPostDTO> findAllPosts() {
        return sqlSessionTemplate.selectList(NAMESPACE + "findAllPosts");
    }

    @Override
    public int insertPost(CommunityPostDTO dto) {
        return sqlSessionTemplate.insert(NAMESPACE + "insertPost", dto);
    }

    @Override
    public List<MentionDTO> findMentionsByPostId(int postId) {
        return sqlSessionTemplate.selectList(NAMESPACE + "findMentionsByPostId", postId);
    }

    @Override
    public int insertComment(CommentDTO dto) {
        return sqlSessionTemplate.insert(NAMESPACE + "insertComment", dto);
    }

    @Override
    public int insertMention(MentionDTO dto) {
        return sqlSessionTemplate.insert(NAMESPACE + "insertMention", dto);
    }

    @Override
    public int getLastCommentId() {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getLastCommentId");
    }

    @Override
    public List<CommunityPostDTO> findPostsByKeyword(String keyword) {
        return sqlSessionTemplate.selectList(NAMESPACE + "findPostsByKeyword", keyword);
    }

    @Override
    public List<ChatRoomDTO> findChatRoomsByUserId(int userId) {
        return sqlSessionTemplate.selectList(NAMESPACE + "findChatRoomsByUserId", userId);
    }

    @Override
    public ChatRoomDTO findChatRoomById(int chatRoomId) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "findChatRoomById", chatRoomId);
    }

    @Override
    public int insertChatRoom(ChatRoomDTO dto) {
        return sqlSessionTemplate.insert(NAMESPACE + "insertChatRoom", dto);
    }

    @Override
    public List<ChatMessageDTO> findMessagesByRoomId(int chatRoomId) {
        return sqlSessionTemplate.selectList(NAMESPACE + "findMessagesByRoomId", chatRoomId);
    }

    @Override
    public int insertChatMessage(ChatMessageDTO dto) {
        return sqlSessionTemplate.insert(NAMESPACE + "insertChatMessage", dto);
    }

    @Override
    public List<Integer> findParticipantsByRoomId(int chatRoomId) {
        return sqlSessionTemplate.selectList(NAMESPACE + "findParticipantsByRoomId", chatRoomId);
    }

    @Override
    public void insertChatParticipant(ChatParticipantDTO dto) {
        sqlSessionTemplate.insert(NAMESPACE + "insertChatParticipant", dto);
    }

    @Override
    public List<CommunityPostDTO> findPostsByCategory(String category) {
        return sqlSessionTemplate.selectList(NAMESPACE + "findPostsByCategory", category);
    }
    
    @Override
    public List<TrendDTO> findLatestTrends() {
        return sqlSessionTemplate.selectList(NAMESPACE + "findLatestTrends");
    }

    @Override
    public List<UserDTO> findRecommendedUsers(int userId) {
        return sqlSessionTemplate.selectList(NAMESPACE + "findRecommendedUsers", userId);
    }
    
    @Override
    public List<CommunityDTO> findAllCommunities() {
        return sqlSessionTemplate.selectList(NAMESPACE + "findAllCommunities");
    }

    @Override
    public int insertCommunity(CommunityDTO dto) {
        return sqlSessionTemplate.insert(NAMESPACE + "insertCommunity", dto);
    }

    @Override
    public List<NotificationDTO> findNotificationsByUserId(long userId, int offset, int limit) {
        java.util.Map<String, Object> p = new java.util.HashMap<>();
        p.put("userId", userId);
        p.put("offset", offset);
        p.put("limit", limit);
        return sqlSessionTemplate.selectList(NAMESPACE + "findByUserId", p);
    }

    @Override
    public int countNotificationsUnread(long userId) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "countUnread", userId);
    }

    @Override
    public int markNotificationAsRead(long notificationId) {
        return sqlSessionTemplate.update(NAMESPACE + "markAsRead", notificationId);
    }

    @Override
    public int markAllNotificationsAsRead(long userId) {
        return sqlSessionTemplate.update(NAMESPACE + "markAllAsRead", userId);
    }

    @Override
    public int insertNotification(NotificationDTO dto) {
        return sqlSessionTemplate.insert(NAMESPACE + "insert", dto);
    }
    
    @Override public UserDTO findUserById(int userId) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "findUserById", userId);
    }
    @Override public UserDTO findUserByHandle(String handle) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "findUserByHandle", handle);
    }
    @Override public int updateUserProfile(UserDTO user) {
        return sqlSessionTemplate.update(NAMESPACE + "updateUserProfile", user);
    }
    @Override public int updateUserPassword(int userId, String password) {
        Map<String,Object> p = new HashMap<>();
        p.put("userId", userId); p.put("password", password);
        return sqlSessionTemplate.update(NAMESPACE + "updateUserPassword", p);
    }
    @Override public int countFollowers(int userId) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "countFollowers", userId);
    }
    @Override public int countFollowing(int userId) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "countFollowing", userId);
    }
    @Override public List<CommunityPostDTO> findPostsByAuthor(int userId, int offset, int limit) {
        Map<String,Object> p = new HashMap<>();
        p.put("userId", userId); p.put("offset", offset); p.put("limit", limit);
        return sqlSessionTemplate.selectList(NAMESPACE + "findPostsByAuthor", p);
    }

}
