<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${course.title} - 여행코스 상세</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/travelCourseDetail.css"> 
    <style>
      
    </style>
</head>
<body>
    <!-- 네비게이션 -->
    <div class="navbar">
        <div class="navbar-left">
            <span class="logo">여행코스 안내</span>
        </div>
        <div class="navbar-center">
            <nav class="menu">
                <a href="#">홈</a>
                <a href="#">테마</a>
                <a href="#">여행코스</a>
                <a href="#">여행정보</a>
            </nav>
        </div>
        <div class="navbar-right">
            <input type="text" class="search-input" placeholder="검색">
            <button class="btn">로그인</button>
            <button class="btn">로그아웃</button>
        </div>
    </div>

    <!-- 본문 -->
    <div class="main-info">
        <h2>${course.title}</h2>
        <div class="meta-info">
            좋아요: ${course.likes} &nbsp;|&nbsp; 조회수: ${course.views}
            &nbsp;&nbsp;|&nbsp;&nbsp;<span style="color:#bbb;">인쇄 | 북마크 | 공유</span>
        </div>
        <div class="simple-info">
            ${course.simpleInfo}
        </div>
        <div class="detail-description">
            ${course.detailDescription}
        </div>
        <div class="course-map">
            코스 지도 뷰
        </div>
        <div class="course-step">
            코스 단계
        </div>
        <div class="course-detail-step">
            코스 상세 설명
        </div>
    </div>
    <div class="footer">
        © 2025 여행코스 안내 | 추가 정보/이용약관
    </div>
</body>
</html>