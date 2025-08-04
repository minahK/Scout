package com.app.entity;

import java.util.Date;

public class TravelPlace {
	private Long placeId;
	private String title;
	private String content;
	private String fileName;
	private Double latitude;
	private Double longitude;
	private Date regDate;

	public TravelPlace() {
	}

	public TravelPlace(Long placeId, String title, String content, String fileName, Double latitude, Double longitude,
			Date regDate) {
		this.placeId = placeId;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
		this.latitude = latitude;
		this.longitude = longitude;
		this.regDate = regDate;
	}
	// Getter/Setter 자동 생성(생략)

	public void setPlaceId(long timeMillis) {
		
	}

	public void setRegDate(Date date) {
		
	}
}