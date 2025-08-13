package com.app.dto.community;

import java.util.List;

import lombok.Data;

@Data
public class CommunityPostDTO {
    int postId;
    String authorId;
    String content;
    String imageUrl;
    String createdAt;
    String updatedAt;
    int likesCount;
    int repostsCount;
    Integer replyToPostId;
    String category;

    // 매퍼의 별칭과 일치하도록 수정
    String authorName;
    List<CommentDTO> comments;
    List<MentionDTO> mentions;
}