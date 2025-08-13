<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>제주 축제</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/festivalList.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
	<%@ include file="../travelDestination/tdHeader.jsp"%>

    <div class="festival-container">
        <!-- 제목 + 설명 -->
        <div class="travel-list-header">
            <h1>제주 축제</h1>
            <p>지금 제주에서 진행 중인 다양한 축제를 만나보세요</p>
        </div>

        <!-- 건수 + 정렬 탭 -->
        <div class="travel-header-bar">
            <div class="travel-count">
                총 <span class="count">${fn:length(festivalList)}</span>건
            </div>

            <div class="travel-sort">
            	<a href="${pageContext.request.contextPath}/festival/list?sort=startdate"
            	   class="sort-tab ${sort == 'startdate' ? 'active': '' }">가까운 일정순</a>
                <a href="${pageContext.request.contextPath}/festival/list?sort=latest"
                   class="sort-tab ${sort == 'latest' ? 'active' : ''}">최신순</a>
                <a href="${pageContext.request.contextPath}/festival/list?sort=popular"
                   class="sort-tab ${sort == 'popular' ? 'active' : ''}">인기순</a>
            </div>
            
		<form method="get" action="${pageContext.request.contextPath}/festival/list" class="filter-form">
			<input type="hidden" name="sort" value="${sort}" />
			<label>
				<input type="checkbox" name="status" value="ongoing"
					onchange="this.form.submit()"
					${status == 'ongoing' ? 'checked' : '' }/> 진행중
			</label>
		</form>
            
        </div>

        <!-- 축제 카드 리스트 -->
        <div class="festival-list">
            <c:forEach var="festival" items="${festivalList}">
                <a href="${pageContext.request.contextPath}/festival/detail?id=${festival.id}" class="festival-card">
                    <img src="${pageContext.request.contextPath}/resources/image/${festival.imageName}" alt="${festival.title}">
                    <div class="festival-card-content">
                        <h2 class="festival-card-title">${festival.title}</h2>
                        <div class="festival-card-meta">
                            <span><i class="fa-solid fa-location-dot"></i> ${festival.location}</span>
                            <span><i class="fa-solid fa-eye"></i> ${festival.viewCount}</span>
                        </div>
                        <p class="festival-card-desc">
    						${festival.shortDescription}
						</p>
                        <div class="festival-card-footer">
                            <fmt:formatDate value="${festival.startDate}" pattern="yyyy.MM.dd"/>
                            ~
                            <fmt:formatDate value="${festival.endDate}" pattern="yyyy.MM.dd"/>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
    <%@ include file="../main/footer.jsp"%>
</body>
</html>