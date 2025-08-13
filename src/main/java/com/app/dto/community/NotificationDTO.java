package com.app.dto.community;

import lombok.Data;

@Data
public class NotificationDTO {
	 	int notificationId;
	    int userId;
	    String type;    
	    int referenceId;  
	    String isRead;     
	    String createdAt;

	    int actorUserId;
	    String actorNickname;   
	    int postId;          
	    String message;  
	    String linkUrl;  
}
