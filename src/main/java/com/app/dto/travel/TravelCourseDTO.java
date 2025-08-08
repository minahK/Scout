package com.app.dto.travel;

import java.util.Date;

public class TravelCourseDTO {
    private Long courseId;       // COURSE_ID
    private String title;        // TITLE
    private String description;  // DESCRIPTION
    private Long regionId;       // REGION_ID
    private Long userId;         // USER_ID
    private Date createdAt;      // CREATED_AT

    // --- Getter / Setter ---

    public Long getCourseId() {
        return courseId;
    }
    public void setCourseId(Long courseId) {
        this.courseId = courseId;
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

    public Long getRegionId() {
        return regionId;
    }
    public void setRegionId(Long regionId) {
        this.regionId = regionId;
    }

    public Long getUserId() {
        return userId;
    }
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Date getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}