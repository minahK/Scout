package com.app.dto.community;

import lombok.Data;

@Data
public class MentionDTO {
    int mentionId;
    int postId;
    int commentId;
    int mentionedUserId;
    String mentionedAt;
    String content;
    
    String nickname;
    String handle;
}