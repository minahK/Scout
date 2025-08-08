<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>여행 기사 목록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/travel.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
	<%@ include file="../travelDestination/tdHeader.jsp"%>
	
    <div class="container">
        <div class="travel-list-header">
            <h1>여행 기사</h1>
            <p>여행지에 대한 최신 기사와 소식을 만나보세요</p>
        </div>
	
	<div class="travel-header-bar">
		<div class="travel-count">
			총 <span class="count">${totalCount}</span>건
		</div>
	
		<div class="travel-sort">
    		<a href="${pageContext.request.contextPath}/travel/list?sort=latest"
       		class="sort-tab ${sort == 'latest' ? 'active' : ''}">최신순</a>
       		
   			 <a href="${pageContext.request.contextPath}/travel/list?sort=popular"
       		class="sort-tab ${sort == 'popular' ? 'active' : ''}">인기순</a>
		</div>
	</div>
	
        <div class="travel-list">
            <c:forEach var="article" items="${travelList}">
                <a href="${pageContext.request.contextPath}/travel/${article.id}" class="travel-card">
                    <img src="${pageContext.request.contextPath}/resources/image/${article.imageName}" alt="${article.title}">
                    <div class="travel-card-content">
                        <h2 class="travel-card-title">${article.title}</h2>
                        <div class="travel-card-meta">
                            <span><i class="fa-solid fa-location-dot"></i> ${article.location}</span>
                            <span><i class="fa-solid fa-eye"></i> ${article.viewCount}</span>
                        </div>
                        <p class="travel-card-desc">
                            ${fn:length(article.content) > 100 ? fn:substring(article.content, 0, 100) + '...' : article.content}
                        </p>
                        <div class="travel-card-footer">
                            <c:if test="${not empty article.regDate}">
                                <fmt:formatDate value="${article.regDate}" pattern="yyyy.MM.dd"/>
                            </c:if>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
    
    <%@ include file="../main/footer.jsp"%>
</body>
</html>