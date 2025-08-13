package com.app.dto.community;

import lombok.Data;

@Data
public class NotificationDTO {
	int notificationId;
    String userId; // int에서 String으로 변경
    String type;    
    int referenceId;  
    String isRead;     
    String createdAt;

    String actorUserId; // int에서 String으로 변경
    String actorNickname;   
    int postId;          
    String message;  
    String linkUrl;  
}