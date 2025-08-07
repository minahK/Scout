package com.app.dto;

public class UserDTO {
	private Long id; // USER 테이블 컬럼명에 맞게
	private String name; // 필요시 추가

	// getter/setter
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
