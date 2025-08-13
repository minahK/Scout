package com.app.dao.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.community.CommunityDAO;
import com.app.dto.community.ChatMessageDTO;
import com.app.dto.community.ChatRoomDTO;
import com.app.dto.community.CommentDTO;
import com.app.dto.community.CommunityDTO;
import com.app.dto.community.CommunityPostDTO;
import com.app.dto.community.MentionDTO;
import com.app.dto.community.NotificationDTO;
import com.app.dto.community.TrendDTO;
import com.app.dto.community.UserDTO;
import com.app.dto.user.User;

@Repository
public class CommunityDAOImpl implements CommunityDAO {

    private static final String NS = "CommunityPost_mapper.";

    @Autowired
    SqlSessionTemplate sql;

    // ===== Posts =====
    @Override
    public List<CommunityPostDTO> findAllPosts() {
        return sql.selectList(NS + "findAllPosts");
    }

    @Override
    public int insertPost(CommunityPostDTO dto) {
        return sql.insert(NS + "insertPost", dto);
    }

    @Override
    public List<CommunityPostDTO> findPostsByKeyword(String keyword) {
        return sql.selectList(NS + "findPostsByKeyword", keyword);
    }

    @Override
    public List<CommunityPostDTO> findPostsByCategory(String category) {
        return sql.selectList(NS + "findPostsByCategory", category);
    }

    @Override
    public List<CommunityPostDTO> findPostsByAuthor(int userId, int offset, int limit) {
        Map<String, Object> p = new HashMap<>();
        p.put("userId", userId);
        p.put("offset", offset);
        p.put("limit", limit);
        return sql.selectList(NS + "findPostsByAuthor", p);
    }

    // ===== Comments & Mentions =====
    @Override
    public int insertComment(CommentDTO commentDTO) {
        return sql.insert(NS + "insertComment", commentDTO);
    }

    @Override
    public int getLastCommentId() {
        Integer id = sql.selectOne(NS + "getLastCommentId");
        return id == null ? 0 : id;
    }

    @Override
    public int insertMention(MentionDTO mentionDTO) {
        return sql.insert(NS + "insertMention", mentionDTO);
    }

    @Override
    public List<MentionDTO> findMentionsByPostId(int postId) {
        return sql.selectList(NS + "findMentionsByPostId", postId);
    }

    // ===== Trends & Recommend =====
    @Override
    public List<TrendDTO> findLatestTrends() {
        return sql.selectList(NS + "findLatestTrends");
    }

    @Override
    public List<UserDTO> findRecommendedUsers(int userId) {
        return sql.selectList(NS + "findRecommendedUsers", userId);
    }

    // ===== Chat =====
    @Override
    public List<ChatRoomDTO> findChatRoomsByUserId(int userId) {
        return sql.selectList(NS + "findChatRoomsByUserId", userId);
    }

    @Override
    public List<ChatMessageDTO> findMessagesByRoomId(int roomId) {
        return sql.selectList(NS + "findMessagesByRoomId", roomId);
    }

    @Override
    public int insertChatMessage(ChatMessageDTO dto) {
        return sql.insert(NS + "insertChatMessage", dto);
    }

    // ===== Communities =====
    @Override
    public List<CommunityDTO> findAllCommunities() {
        return sql.selectList(NS + "findAllCommunities");
    }

    @Override
    public int insertCommunity(CommunityDTO dto) {
        return sql.insert(NS + "insertCommunity", dto);
    }

    // ===== Notifications =====
    @Override
    public List<NotificationDTO> findNotificationsByUserId(int userId, int offset, int limit) {
        Map<String, Object> p = new HashMap<>();
        p.put("userId", userId);
        p.put("offset", offset);
        p.put("limit", limit);
        return sql.selectList(NS + "findNotificationsByUserId", p);
    }

    @Override
    public int countUnread(int userId) {
        Integer n = sql.selectOne(NS + "countUnread", userId);
        return n == null ? 0 : n;
    }

    @Override
    public int markAsRead(int notificationId) {
        return sql.update(NS + "markAsRead", notificationId);
    }

    @Override
    public int markAllAsRead(int userId) {
        return sql.update(NS + "markAllAsRead", userId);
    }

    @Override
    public int insertNotification(NotificationDTO dto) {
        // mapper id는 'insert' (네임스페이스로 구분되니 충돌 없음)
        return sql.insert(NS + "insert", dto);
    }

    // ===== Users/Profile =====
    @Override
    public UserDTO findUserById(int userId) {
        return sql.selectOne(NS + "findUserById", userId);
    }

    @Override
    public UserDTO findUserByHandle(String handle) {
        return sql.selectOne(NS + "findUserByHandle", handle);
    }

    @Override
    public int updateAccountCore(UserDTO dto) {
        return sql.update(NS + "updateAccountCore", dto);
    }

    @Override
    public int updateUserProfile(int userId, String nickname) {
        Map<String, Object> p = new HashMap<>();
        p.put("userId", userId);
        p.put("nickname", nickname);
        return sql.update(NS + "updateUserProfile", p);
    }

    @Override
    public int updateUserPassword(int userId, String password) {
        Map<String, Object> p = new HashMap<>();
        p.put("userId", userId);
        p.put("password", password);
        return sql.update(NS + "updateUserPassword", p);
    }

    // ===== Follow counts =====
    @Override
    public int countFollowers(int userId) {
        Integer n = sql.selectOne(NS + "countFollowers", userId);
        return n == null ? 0 : n;
    }

    @Override
    public int countFollowing(int userId) {
        Integer n = sql.selectOne(NS + "countFollowing", userId);
        return n == null ? 0 : n;
    }
    
    @Override
    public int selectUserPkByLoginId(String id) {
        Integer pk = sql.selectOne(NS + "selectUserPkByLoginId", id);
        return pk == null ? 0 : pk;
    }
    
    @Override
    public User selectUserById(Integer userId) {
        return sql.selectOne(NS + "selectUserById", userId);
    }

    @Override
    public void updateUserAccount(User user) {
    	sql.update(NS + "updateUserAccount", user);
    }
}
