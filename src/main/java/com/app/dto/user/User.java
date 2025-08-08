package com.app.dto.user;

import lombok.Data;

@Data
public class User {

//	Long id;
	String id;
	String pw;
	String name;
	String userType;
	String email;// CUS / ADM
					 // 사용자 계정 구분
					 // Customer / Admin

}
