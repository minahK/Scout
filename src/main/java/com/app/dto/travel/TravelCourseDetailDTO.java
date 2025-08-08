package com.app.dto.travel;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;


public class TravelCourseDetailDTO implements Serializable {
    private String courseId;     // COURSE_ID: VARCHAR2(50)
    private Integer seqNo;       // SEQ_NO
    private Long destId;         // DEST_ID (NUMBER)
    private String memo;         // MEMO

    public String getCourseId() {
        return courseId;
    }
    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }
    public Integer getSeqNo() {
        return seqNo;
    }
    public void setSeqNo(Integer seqNo) {
        this.seqNo = seqNo;
    }
    public Long getDestId() {
        return destId;
    }
    public void setDestId(Long destId) {
        this.destId = destId;
    }
    public String getMemo() {
        return memo;
    }
    public void setMemo(String memo) {
        this.memo = memo;
    }
}