package com.app.entity;

import java.util.Date;

public class TravelCourse {
    private Long courseId;
    private String title;
    private String description;
    private Long regionId;
    private Long authorId;
    private Date regDate;

    public TravelCourse() {}

    public TravelCourse(Long courseId, String title, String description, Long regionId, Long authorId, Date regDate) {
        this.courseId = courseId;
        this.title = title;
        this.description = description;
        this.regionId = regionId;
        this.authorId = authorId;
        this.regDate = regDate;
    }

    // Getter/Setter (IDE 단축키로 자동 생성)
    public Long getCourseId() { return courseId; }
    public void setCourseId(Long courseId) { this.courseId = courseId; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Long getRegionId() { return regionId; }
    public void setRegionId(Long regionId) { this.regionId = regionId; }
    public Long getAuthorId() { return authorId; }
    public void setAuthorId(Long authorId) { this.authorId = authorId; }
    public Date getRegDate() { return regDate; }
    public void setRegDate(Date regDate) { this.regDate = regDate; }
}