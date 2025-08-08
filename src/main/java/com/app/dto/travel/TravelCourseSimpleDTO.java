package com.app.dto.travel;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


	public class TravelCourseSimpleDTO implements Serializable {
		private String courseId;             // COURSE_ID: VARCHAR2(50)
	    private String title;                // TITLE
	    private String summary;              // SUMMARY
	    private String imageUrl;             // IMAGE_URL
	    private String region;               // REGION
	    private String tags;                 // TAGS
	    private Integer viewCount;           // VIEW_COUNT
	    private Date createdAt;              // CREATED_AT

	    // 포함된 목적지 리스트
	    private List<TravelCourseDetailDTO> detailList;

	    public String getCourseId() {
	        return courseId;
	    }
	    public void setCourseId(String courseId) {
	        this.courseId = courseId;
	    }
	    public String getTitle() {
	        return title;
	    }
	    public void setTitle(String title) {
	        this.title = title;
	    }
	    public String getSummary() {
	        return summary;
	    }
	    public void setSummary(String summary) {
	        this.summary = summary;
	    }
	    public String getImageUrl() {
	        return imageUrl;
	    }
	    public void setImageUrl(String imageUrl) {
	        this.imageUrl = imageUrl;
	    }
	    public String getRegion() {
	        return region;
	    }
	    public void setRegion(String region) {
	        this.region = region;
	    }
	    public String getTags() {
	        return tags;
	    }
	    public void setTags(String tags) {
	        this.tags = tags;
	    }
	    public Integer getViewCount() {
	        return viewCount;
	    }
	    public void setViewCount(Integer viewCount) {
	        this.viewCount = viewCount;
	    }
	    public Date getCreatedAt() {
	        return createdAt;
	    }
	    public void setCreatedAt(Date createdAt) {
	        this.createdAt = createdAt;
	    }
	    public List<TravelCourseDetailDTO> getDetailList() {
	        return detailList;
	    }
	    public void setDetailList(List<TravelCourseDetailDTO> detailList) {
	        this.detailList = detailList;
	    }
	}