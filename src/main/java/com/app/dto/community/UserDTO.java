package com.app.dto.community;

import lombok.Data;

@Data
public class UserDTO {
	int userId;
    String username;     // ← 추가
    String handle;
    String email;
    String password;
    String nickname;
}