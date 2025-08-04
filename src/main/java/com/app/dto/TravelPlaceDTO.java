package com.app.dto;

import java.sql.Date;

public class TravelPlaceDTO {
    private int id;             // 여행지 ID
    private String name;        // 여행지명
    private String description; // 상세 설명
    private String address;     // 주소
    private double latitude;    // 위도
    private double longitude;   // 경도
    private String status;      // 상태
    private String mainImage;   // 대표 이미지 경로
    private Date modifiedAt;    // 수정일자

    // 기본 생성자
    public TravelPlaceDTO() {}

    // 모든 필드 포함 생성자
    public TravelPlaceDTO(int id, String name, String description, String address,
                          double latitude, double longitude, String status,
                          String mainImage, Date modifiedAt) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.address = address;
        this.latitude = latitude;
        this.longitude = longitude;
        this.status = status;
        this.mainImage = mainImage;
        this.modifiedAt = modifiedAt;
    }

    // Getter & Setter
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public double getLatitude() {
        return latitude;
    }
    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }
    public double getLongitude() {
        return longitude;
    }
    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getMainImage() {
        return mainImage;
    }
    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }
    public Date getModifiedAt() {
        return modifiedAt;
    }
    public void setModifiedAt(Date modifiedAt) {
        this.modifiedAt = modifiedAt;
    }

    // toString() (필요하다면 추가)
    @Override
    public String toString() {
        return "TravelPlaceDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", address='" + address + '\'' +
                ", latitude=" + latitude +
                ", longitude=" + longitude +
                ", status='" + status + '\'' +
                ", mainImage='" + mainImage + '\'' +
                ", modifiedAt=" + modifiedAt +
                '}';
    }
}
