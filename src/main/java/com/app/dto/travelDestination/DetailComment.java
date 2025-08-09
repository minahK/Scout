package com.app.dto.travelDestination;

import lombok.Data;

@Data
public class DetailComment {
	int id;
	int travelId;
	String userId;
	String name;
	String content;
}
