package com.app.dto.community;

import lombok.Data;

@Data
public class ChatParticipantDTO {
	int chatRoomId;
    int userId;
    String isActive;
}
