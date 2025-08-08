<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>여행코스 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/travelCourseDetail.css" />

<style>

</style>
</head>
<body>
<div class="container">

 <div class="top-nav">
    <div class="logo">
        <a href="/"> 
            <img src="https://i.imgur.com/xpGazxz.png" alt="Logo" />
        </a>
    </div>
    
    <div class="menu">
        <div class="menu-item">
            <a href="/" class="active">홈</a>
        </div>
        <div class="menu-item">
            <a href="theme.jsp">테마</a>
        </div>
        <div class="menu-item">
            <a href="theme.jsp">추천코스</a>
        </div>
        <div class="menu-item">
            <a href="javascript:void(0)">여행정보</a>
            <div class="dropdown">
                <div class="dropdown-list">
                    <a href="/travelDestination?sort=recent">여행지</a> 
                    <a href="#">여행기사</a> 
                    <a href="#">여행행사</a>
                </div>
            </div>
        </div>
    </div>
    
    <div class="icons">
        <i class="fa fa-search"></i> 
        <i class="fas fa-comments"></i>
        <i class="fa fa-user"></i> 
        <i class="fa fa-globe"></i>
    </div>
</div>

    <c:if test="${not empty course}">
        <h1>${course.title}</h1>
        <div class="meta">
            지역: <span style="color:#e1790b;">${course.region}</span>
            <span style="margin-left:14px;">등록일: <fmt:formatDate value="${course.createdAt}" pattern="yyyy.MM.dd" /></span>
            <span style="margin-left:14px; color:#d49d28;">조회수: ${course.viewCount}</span>
        </div>
        <c:if test="${not empty course.imageUrl}">
            <img class="img-main" src="${course.imageUrl}" alt="${course.title}" />
        </c:if>
        <div class="summary">${course.summary}</div>
        <c:if test="${not empty course.tags}">
            <div class="tags">
                <c:forEach var="tag" items="${fn:split(course.tags,',')}">
                    <span class="tag">#${fn:trim(tag)}</span>
                </c:forEach>
            </div>
        </c:if>
        
        <div class="course-details">
            <div class="course-details-title">포함된 여행지/코스</div>
            <ul class="detail-list">
                <c:forEach var="detail" items="${course.detailList}">
                    <li class="detail-item">
                        <div class="detail-seq">${detail.seqNo}.</div>
                        <div>
                            <span class="detail-spot">${detail.destName}</span>
                            <c:if test="${not empty detail.memo}">
                                <div class="detail-memo">${detail.memo}</div>
                            </c:if>
                        </div>
                    </li>
                </c:forEach>
                <c:if test="${empty course.detailList}">
                    <li style="color:#bbb; padding:20px 0;">코스에 등록된 여행지가 없습니다.</li>
                </c:if>
            </ul>
        </div>
    </c:if>
    <c:if test="${empty course}">
        <div style="padding:64px 0; color:#a6a6a6; text-align:center;">조회할 코스 정보가 없습니다.</div>
    </c:if>

    <div class="footer">© 2025 여행코스 안내</div>
</div>
</body>
</html>
