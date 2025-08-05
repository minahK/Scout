<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 상단바 -->	
	<%@ include file="tdHeader.jsp"%>
	
	
	<div class="travel-title">${travel.title}</div> 
    <div class="travel-location">${travel.location}</div> 
    <div class="travel-desc">${travel.desc}</div>
    
    
	
</body>
</html>