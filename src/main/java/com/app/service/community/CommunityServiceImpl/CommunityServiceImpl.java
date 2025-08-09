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
import com.app.dto.community.UserDTO;
import com.app.dto.user.User;
import com.app.service.community.CommunityService;

@Service
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    private CommunityDAO dao;

    // ===== 프로필/유저 =====
    @Override
    public UserDTO getProfile(int userId) {
        return dao.findUserById(userId);
    }

    @Override
    public UserDTO getProfileByHandle(String handle) {
        return dao.findUserByHandle(handle);
    }

    @Override
    public void updateProfileBasic(int userId, String nickname, MultipartFile file, HttpServletRequest req) {
        User u = new User();
        dao.updateUserProfile(userId, nickname);
    }

    // ===== 게시글/검색 =====
    @Override
    public List<CommunityPostDTO> searchPostsByKeyword(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) return Collections.emptyList();
        return dao.findPostsByKeyword(keyword.trim());
    }

    @Override
    public List<CommunityPostDTO> getUserPosts(int userId, int page, int size) {
        if (page < 1) page = 1;
        if (size < 1) size = 20;
        int offset = (page - 1) * size;
        return dao.findPostsByAuthor(userId, offset, size);
    }

    // ===== 트렌드/추천 =====
    @Override
    public List<TrendDTO> findLatestTrends() {
        return dao.findLatestTrends();
    }

    @Override
    public List<UserDTO> findRecommendedUsers(int userId) {
        return dao.findRecommendedUsers(userId);
    }

    // ===== 채팅 =====
    @Override
    public List<ChatRoomDTO> findChatRoomsByUserId(int userId) {
        return dao.findChatRoomsByUserId(userId);
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
    public int getFollowerCount(int userId) {
        return dao.countFollowers(userId);
    }

    @Override
    public int getFollowingCount(int userId) {
        return dao.countFollowing(userId);
    }

    // ===== 알림 =====
    @Override
    public List<NotificationDTO> listNotifications(int userId, int page, int size, HttpServletRequest req) {
        if (page < 1) page = 1;
        if (size < 1) size = 20;
        int offset = (page - 1) * size;

        // 쿼리스트링으로 전체 읽음 처리: /community/notifications?mark=allRead
        String mark = (req != null) ? req.getParameter("mark") : null;
        if ("allRead".equalsIgnoreCase(mark)) {
            dao.markAllAsRead(userId);
        }

        return dao.findNotificationsByUserId(userId, offset, size);
    }

    @Override
    public int countNotificationsUnread(int userId) {
        return dao.countUnread(userId);
    }
    
    private User toUser(UserDTO dto) {
        if (dto == null) return null;

        User u = new User();

        // id: handle 값
        if (dto.getHandle() != null && !dto.getHandle().isBlank()) {
            u.setId(dto.getHandle());
        }

        // name: nickname 값
        u.setName(dto.getNickname());

        // email
        u.setEmail(dto.getEmail());

        return u;
    }
    
    @Override
    public User getProfileAsUser(Integer userId) {
        UserDTO dto = getProfile(userId);
        return toUser(dto);
    }

    @Override
    public User getProfileByHandleAsUser(String handle) {
        UserDTO dto = getProfileByHandle(handle);
        return toUser(dto);
    }

    @Override
    public List<User> findRecommendedUsersAsUser(Integer userId) {
        List<UserDTO> list = findRecommendedUsers(userId);
        return list == null ? List.of() : list.stream().map(this::toUser).collect(Collectors.toList());
    }
    
    @Override
    public int getFollowerCountByHandle(String handle) {
        UserDTO dto = getProfileByHandle(handle);
        return (dto == null) ? 0 : getFollowerCount(dto.getUserId());
    }
    @Override
    public int getFollowingCountByHandle(String handle) {
        UserDTO dto = getProfileByHandle(handle);
        return (dto == null) ? 0 : getFollowingCount(dto.getUserId());
    }
    @Override
    public List<CommunityPostDTO> getUserPostsByHandle(String handle, int page, int size) {
        UserDTO dto = getProfileByHandle(handle);
        return (dto == null) ? java.util.Collections.emptyList()
                             : getUserPosts(dto.getUserId(), page, size);
    }
    
    @Override
    public User getUserById(Integer userId) {
        return dao.selectUserById(userId);
    }

    @Override
    public void updateUserAccount(User user) {
        dao.updateUserAccount(user);
    }
}
