package com.app.dto.community;

import lombok.Data;

@Data
public class CommunityDTO {
    int communityId;
    String name;
    String description;
    String createdAt;
}
