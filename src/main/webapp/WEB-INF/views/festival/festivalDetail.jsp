<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${festival.title}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/festivalDetail.css">
</head>
<body>

<div class="container">
    <!-- 제목 + 위치 + 기간 -->
    <div class="festival-header">
        <h1 class="festival-title">${festival.title}</h1>
        <div class="festival-meta">
            <span><i class="fa-solid fa-location-dot"></i> ${festival.location}</span>
            <span><i class="fa-solid fa-calendar-days"></i>
                <fmt:formatDate value="${festival.startDate}" pattern="yyyy년 MM월 dd일" />
                ~
                <fmt:formatDate value="${festival.endDate}" pattern="yyyy년 MM월 dd일" />
            </span>
        </div>
    </div>

    <!-- 대표 이미지 -->
    <div class="festival-image">
        <img src="${pageContext.request.contextPath}/resources/image/${festival.imageName}" alt="${festival.title}">
    </div>

    <!-- 본문 내용 -->
    <div class="festival-content">
        ${festival.content}
    </div>

    <!-- 추가 정보 박스 -->
    <div class="festival-info">
        <p><strong>장소:</strong> ${festival.location}</p>
        <p><strong>기간:</strong>
            <fmt:formatDate value="${festival.startDate}" pattern="yyyy년 MM월 dd일" />
            ~
            <fmt:formatDate value="${festival.endDate}" pattern="yyyy년 MM월 dd일" />
        </p>
        <p><strong>조회수:</strong> ${festival.viewCount}</p>
    </div>

    <!-- 뒤로가기 -->
    <div class="back-btn-wrapper">
        <a href="${pageContext.request.contextPath}/festival/list" class="back-btn">← 목록으로 돌아가기</a>
    </div>
</div>

</body>
</html>