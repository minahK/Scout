package com.app.dto;

import java.util.Date;

public class TouristRequestDTO {
	private Long requestId;
	private String title;
	private String content;
	private Long userId; // 생략 가능
	private String filePath; // 이미지 등 첨부파일 경로
	private Date createdAt;
	// getter/setter

	// 기본 생성자
	public TouristRequestDTO() {
	}

	// 모든 필드 생성자
	// 모든 필드 생성자 (All-args constructor)
	public TouristRequestDTO(Long requestId, String title, String content, Long userId, String filePath,
			Date createdAt) {
		this.requestId = requestId;
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.filePath = filePath;
		this.createdAt = createdAt;
	}

	// Getter/Setter
	public Long getRequestId() {
		return requestId;
	}

	public void setRequestId(Long requestId) {
		this.requestId = requestId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
}