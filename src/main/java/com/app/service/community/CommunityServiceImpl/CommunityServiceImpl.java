package com.app.service.community.CommunityServiceImpl;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.app.dao.community.CommunityDAO;
import com.app.dto.community.ChatMessageDTO;
import com.app.dto.community.ChatRoomDTO;
import com.app.dto.community.CommunityDTO;
import com.app.dto.community.CommunityPostDTO;
import com.app.dto.community.NotificationDTO;
import com.app.dto.community.TrendDTO;
import com.app.dto.user.User;
import com.app.service.community.CommunityService;

@Service
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    private CommunityDAO dao;

    // ===== 프로필/유저 =====
    @Override
    public User getProfile(String id) {
        return dao.findUserById(id);
    }

    @Override
    public User getProfileByHandle(String handle) {
        return dao.findUserByHandle(handle);
    }

    @Override
    public void updateProfileBasic(String id, String name, MultipartFile file, HttpServletRequest req) {
        // 파일 처리 로직은 생략하고, 이름 업데이트만 수행
        dao.updateUserProfile(id, name);
    }

    // ===== 게시글/검색 =====
    @Override
    public List<CommunityPostDTO> searchPostsByKeyword(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) return Collections.emptyList();
        return dao.findPostsByKeyword(keyword.trim());
    }

    @Override
    public List<CommunityPostDTO> getUserPosts(String id, int page, int size) {
        if (page < 1) page = 1;
        if (size < 1) size = 20;
        int offset = (page - 1) * size;
        return dao.findPostsByAuthor(id, offset, size);
    }

    // ===== 트렌드/추천 =====
    @Override
    public List<TrendDTO> findLatestTrends() {
        return dao.findLatestTrends();
    }

    @Override
    public List<User> findRecommendedUsers(String id) {
        return dao.findRecommendedUsers(id);
    }

    // ===== 채팅 =====
    @Override
    public List<ChatRoomDTO> findChatRoomsByUserId(String id) {
        return dao.findChatRoomsByUserId(id);
    }

    @Override
    public List<ChatMessageDTO> findMessagesByRoomId(int roomId) {
        return dao.findMessagesByRoomId(roomId);
    }

    @Override
    public int insertChatMessage(ChatMessageDTO dto) {
        return dao.insertChatMessage(dto);
    }

    // ===== 커뮤니티 =====
    @Override
    public List<CommunityDTO> getAllCommunities() {
        return dao.findAllCommunities();
    }

    @Override
    public int createCommunity(CommunityDTO dto) {
        return dao.insertCommunity(dto);
    }

    // ===== 팔로우 카운트 =====
    @Override
    public int getFollowerCount(String id) {
        return dao.countFollowers(id);
    }

    @Override
    public int getFollowingCount(String id) {
        return dao.countFollowing(id);
    }

    // ===== 팔로우/유저 정보 (핸들 기반) =====
    @Override
    public int getFollowerCountByHandle(String handle) {
        return getFollowerCount(handle);
    }
    
    @Override
    public int getFollowingCountByHandle(String handle) {
        return getFollowingCount(handle);
    }
    
    @Override
    public List<CommunityPostDTO> getUserPostsByHandle(String handle, int page, int size) {
        return getUserPosts(handle, page, size);
    }
    
    // ===== 알림 =====
    @Override
    public List<NotificationDTO> listNotifications(String id, int page, int size, HttpServletRequest req) {
        if (page < 1) page = 1;
        if (size < 1) size = 20;
        int offset = (page - 1) * size;

        String mark = (req != null) ? req.getParameter("mark") : null;
        if ("allRead".equalsIgnoreCase(mark)) {
            dao.markAllAsRead(id);
        }

        return dao.findNotificationsByUserId(id, offset, size);
    }

    @Override
    public int countNotificationsUnread(String id) {
        return dao.countUnread(id);
    }

    // ===== 계정 관리 =====
    @Override
    public User getUserById(String id) {
        return dao.selectUserById(id);
    }

    @Override
    public void updateUserAccount(User user) {
        dao.updateUserAccount(user);
    }
}