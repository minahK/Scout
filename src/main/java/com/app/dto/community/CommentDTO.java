package com.app.dto.community;

import lombok.Data;

@Data
public class CommentDTO {
    int commentId;
    int postId;
    int userId;
    String content;
    String createdAt;

}
