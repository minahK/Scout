package com.app.dto.community;

import java.util.List;

import lombok.Data;

@Data
public class CommunityPostDTO {
    int postId;
    int authorId;
    String content;
    String imageUrl;
    String createdAt;
    String updatedAt;
    int likesCount;
    int repostsCount;
    Integer replyToPostId;

    String authorNickname;
    String profileImage;
    String handle;

    List<CommentDTO> comments;
    List<MentionDTO> mentions;
}
