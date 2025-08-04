package com.app.dto;

public class TravelCourseDTO {
	private int id;
	private String title;
	private String description;
	// ... 필요한 필드

	// getter, setter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "TravelCourseDTO [id=" + id + ", title=" + title + ", description=" + description + "]";
	}

	// toString(), 생성자 등 필요에 따라 추가
	
	
}