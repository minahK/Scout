package com.app.dto.community;

import lombok.Data;

@Data
public class ChatMessageDTO {
	int messageId;
    int chatRoomId;
    int senderId;
    String content;
    String sentAt;
}
