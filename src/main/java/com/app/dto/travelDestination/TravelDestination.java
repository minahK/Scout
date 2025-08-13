package com.app.dto.travelDestination;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TravelDestination {
	
	private int id;
	private String name;
	private String sumup;
	private String descride;
	private int regionId;
	private double latitude;
	private double longitude;
	private String type;
	private String image;
	private Date createDate;
	private int viewCount;
}
