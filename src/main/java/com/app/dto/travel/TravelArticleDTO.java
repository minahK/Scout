package com.app.dto.travel;

import java.util.Date;

public class TravelArticleDTO {

    private int id;                  
    private String title;            
    private String location;         
    private String shortDescription; 
    private String content;          
    private String imageName;        
    private String hours;            
    private String price;            
    private String parking;          
    private String phone;            
    private int viewCount;
    private Date regDate;
    private int likes;
    private int shares;

    
    public TravelArticleDTO() {}

   
    public TravelArticleDTO(int id, String title, String location, String shortDescription, String content,
                             String imageName, String hours, String price, String parking, String phone, int viewCount, Date regDate) {
        this.id = id;
        this.title = title;
        this.location = location;
        this.shortDescription = shortDescription;
        this.content = content;
        this.imageName = imageName;
        this.hours = hours;
        this.price = price;
        this.parking = parking;
        this.phone = phone;
        this.viewCount = viewCount;
        this.regDate = regDate;
    }

    // Getter & Setter
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

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getHours() {
        return hours;
    }

    public void setHours(String hours) {
        this.hours = hours;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getParking() {
        return parking;
    }

    public void setParking(String parking) {
        this.parking = parking;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }
    
    public Date getRegDate() { 
    	return regDate; 
    }
    public void setRegDate(Date regDate) { 
    	this.regDate = regDate; 
    }

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getShares() {
		return shares;
	}

	public void setShares(int shares) {
		this.shares = shares;
	}
    
    
}