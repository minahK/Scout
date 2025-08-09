package com.app.service.community.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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
import com.app.service.community.CommunityService;

@Service
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    CommunityDAO communityDAO;

    /** 전체 게시글 조회 */
    @Override
    public List<CommunityPostDTO> getAllPosts() {
        return communityDAO.findAllPosts();
    }

    /** 게시글 작성 */
    @Override
    public int createPost(CommunityPostDTO postDTO) {
        return communityDAO.insertPost(postDTO);
    }

    /** 게시글 검색 */
    @Override
    public List<CommunityPostDTO> searchPostsByKeyword(String keyword) {
        return communityDAO.findPostsByKeyword(keyword);
    }

    /** 카테고리별 게시글 조회 */
    @Override
    public List<CommunityPostDTO> getPostsByCategory(String category) {
        return communityDAO.findPostsByCategory(category);
    }

    /** 댓글 작성 + 멘션 등록 */
    @Override
    public void writeCommentWithMentions(CommentDTO commentDTO, List<MentionDTO> mentionList) {
        communityDAO.insertComment(commentDTO);
        int commentId = communityDAO.getLastCommentId();

        if (mentionList != null && !mentionList.isEmpty()) {
            for (MentionDTO mention : mentionList) {
                mention.setCommentId(commentId);
                communityDAO.insertMention(mention);
            }
        }
    }

    /** 게시물의 멘션 리스트 조회 */
    @Override
    public List<MentionDTO> findMentionsByPostId(int postId) {
        return communityDAO.findMentionsByPostId(postId);
    }

    /** 트렌드 목록 */
    @Override
    public List<TrendDTO> findLatestTrends() {
        return communityDAO.findLatestTrends();
    }

    /** 유저 추천 목록 */
    @Override
    public List<UserDTO> findRecommendedUsers(int userId) {
        return communityDAO.findRecommendedUsers(userId);
    }

    /** 채팅방 목록 */
    @Override
    public List<ChatRoomDTO> findChatRoomsByUserId(int userId) {
        return communityDAO.findChatRoomsByUserId(userId);
    }

    /** 채팅 메시지 조회 */
    @Override
    public List<ChatMessageDTO> findMessagesByRoomId(int roomId) {
        return communityDAO.findMessagesByRoomId(roomId);
    }

    /** 채팅 메시지 삽입 */
    @Override
    public int insertChatMessage(ChatMessageDTO dto) {
        return communityDAO.insertChatMessage(dto);
    }

    /** 멘션 유저 아이디 추출 (추후 확장용) */
    private List<Integer> extractMentionedUserIds(String content) {
        List<Integer> ids = new ArrayList<>();
        Pattern pattern = Pattern.compile("@(\\d+)");
        Matcher matcher = pattern.matcher(content);
        while (matcher.find()) {
            ids.add(Integer.parseInt(matcher.group(1)));
        }
        return ids;
    }
    
    @Override
    public List<CommunityDTO> getAllCommunities() {
        return communityDAO.findAllCommunities();
    }

    @Override
    public int createCommunity(CommunityDTO dto) {
        return communityDAO.insertCommunity(dto);
    }
    
    String safe(String s) { return (s == null) ? "" : s.toLowerCase(); }
    
    @Override
    public List<NotificationDTO> listNotifications(int userId, int page, int size, HttpServletRequest req) {
        if (page < 1) page = 1;
        if (size <= 0) size = 20;

        int offset = (page - 1) * size;
        List<NotificationDTO> list = communityDAO.findNotificationsByUserId(userId, offset, size);

        String ctx = req.getContextPath();
        for (NotificationDTO n : list) {
            String nick = (n.getActorNickname() != null) ? n.getActorNickname() : "누군가";
            switch (safe(n.getType())) {
                case "mention":
                    n.setMessage(nick + "님이 회원님을 멘션했습니다.");
                    n.setLinkUrl(ctx + "/community/post/detail?postId=" + n.getPostId());
                    break;
                case "like":
                    n.setMessage(nick + "님이 회원님의 글을 좋아합니다.");
                    n.setLinkUrl(ctx + "/community/post/detail?postId=" + n.getPostId());
                    break;
                case "retweet":
                    n.setMessage(nick + "님이 회원님의 글을 리트윗했습니다.");
                    n.setLinkUrl(ctx + "/community/post/detail?postId=" + n.getPostId());
                    break;
                case "follow":
                    n.setMessage(nick + "님이 회원님을 팔로우하기 시작했습니다.");
                    n.setLinkUrl(ctx + "/community/profile?userId=" + n.getActorUserId());
                    break;
                default:
                    n.setMessage("새 알림이 도착했습니다.");
                    n.setLinkUrl(ctx + "/community");
            }
        }
        return list;
    }

    @Override
    public int countNotificationsUnread(int userId) {
        return communityDAO.countNotificationsUnread(userId);
    }

    @Override
    @Transactional
    public void markNotificationAsRead(int notificationId) {
        communityDAO.markNotificationAsRead(notificationId);
    }

    @Override
    @Transactional
    public void markAllNotificationsAsRead(int userId) {
        communityDAO.markAllNotificationsAsRead(userId);
    }

    @Override
    @Transactional
    public void createNotification(int toUserId, String type, int refId) {
        NotificationDTO dto = new NotificationDTO();
        dto.setUserId(toUserId);     
        dto.setType(type);
        dto.setReferenceId(refId); 
        dto.setIsRead("N");
        communityDAO.insertNotification(dto);
    }
    
    
    @Override
    public UserDTO getProfile(int userId) { return communityDAO.findUserById(userId); }

    @Override
    public UserDTO getProfileByHandle(String handle) { return communityDAO.findUserByHandle(handle); }

    @Override
    public int getFollowerCount(int userId) { return communityDAO.countFollowers(userId); }

    @Override
    public int getFollowingCount(int userId) { return communityDAO.countFollowing(userId); }

    @Override
    public List<CommunityPostDTO> getUserPosts(int userId, int page, int size) {
        int offset = Math.max(0, (page-1)*size);
        return communityDAO.findPostsByAuthor(userId, offset, size);
    }

    @Override
    public void updateProfileBasic(int userId, String nickname,
                                   MultipartFile profileImageFile,
                                   HttpServletRequest req) throws IOException {

        UserDTO user = communityDAO.findUserById(userId);
        if (user == null) throw new IllegalArgumentException("사용자를 찾을 수 없습니다.");

        user.setNickname(nickname);

        if (profileImageFile != null && !profileImageFile.isEmpty()) {
            String uploadDir = req.getServletContext().getRealPath("/image/community");
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            String original = profileImageFile.getOriginalFilename();
            String safeName = System.currentTimeMillis() + "_" + (original == null ? "profile.jpg" : original);
            File dest = new File(dir, safeName);
            profileImageFile.transferTo(dest);

            user.setProfileImage(safeName);
        }

        communityDAO.updateUserProfile(user);
    }
}
