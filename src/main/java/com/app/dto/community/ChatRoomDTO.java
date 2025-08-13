package com.app.dto.community;

import lombok.Data;

@Data
public class ChatRoomDTO {
    int chatRoomId;
    int creatorId;
    String roomName;
    String createdAt;
}
