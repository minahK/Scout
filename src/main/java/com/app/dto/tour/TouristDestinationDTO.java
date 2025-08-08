package com.app.dto.tour;

import java.util.Date;

public class TouristDestinationDTO {
	 private Long id;
	    private String name;
	    private String sumup;
	    private String descride;
	    private Integer regionid;
	    private Double latitude;
	    private Double longitude;
	    private String type;
	    private String image;
	    private Date createDate;
	    private Integer viewCount;

	    // Getter/Setter
	    public Long getId() { return id; }
	    public void setId(Long id) { this.id = id; }
	    public String getName() { return name; }
	    public void setName(String name) { this.name = name; }
	    public String getSumup() { return sumup; }
	    public void setSumup(String sumup) { this.sumup = sumup; }
	    public String getDescride() { return descride; }
	    public void setDescride(String descride) { this.descride = descride; }
	    public Integer getRegionid() { return regionid; }
	    public void setRegionid(Integer regionid) { this.regionid = regionid; }
	    public Double getLatitude() { return latitude; }
	    public void setLatitude(Double latitude) { this.latitude = latitude; }
	    public Double getLongitude() { return longitude; }
	    public void setLongitude(Double longitude) { this.longitude = longitude; }
	    public String getType() { return type; }
	    public void setType(String type) { this.type = type; }
	    public String getImage() { return image; }
	    public void setImage(String image) { this.image = image; }
	    public Date getCreateDate() { return createDate; }
	    public void setCreateDate(Date createDate) { this.createDate = createDate; }
	    public Integer getViewCount() { return viewCount; }
	    public void setViewCount(Integer viewCount) { this.viewCount = viewCount; }
	}