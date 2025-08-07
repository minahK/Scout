<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>${course.title} - 여행코스 상세</title>
    <style>
        /* 이미지 참고해서 스타일 작성 */
    </style>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/travelCourse.css">
</head>
<body>
    <div class="header">
        <!-- 네비바/로그인/검색 등 구현 -->
    </div>
    <div class="main-info">
        <h2>${course.title}</h2>
        <div>
            <span>조회수: ${course.views}</span>
            <span>좋아요: ${course.likes}</span>
            <span>공유</span>
        </div>
        <div class="simple-info">
            ${course.simpleInfo}
        </div>
        <div class="detail-description">
            ${course.detailDescription}
        </div>
    </div>
    <div class="course-map">
        <!-- 지도 뷰(구현시 지도 API 활용 가능) -->
    </div>
    <div class="course-step">
        <!-- 단계별 정보 (예: 1코스-2코스 등) -->
        <c:forEach var="step" items="${course.steps}">
            <div>${step.name}: ${step.description}</div>
        </c:forEach>
    </div>
    <div class="footer">
        푸터(안내사항)
    </div>
</body>
</html>