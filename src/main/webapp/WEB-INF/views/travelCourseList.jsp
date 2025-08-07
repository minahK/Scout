<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>여행코스</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/colors.css" />

<style>
body {
	background: #0000;
	font-family: 'Noto Sans KR', sans-serif;
}

.top-nav {
	display: flex;
	background: #fdd1b4;
	padding: 16px;
	border-radius: 10px;
	margin-bottom: 18px;
}

.top-nav a {
	color: #fff;
	margin-right: 18px;
	font-weight: bold;
	text-decoration: none;
}

.container {
	max-width: 680px;
	margin: 32px auto;
}

.filters {
	display: flex;
	align-items: flex-start;
	gap: 24px;
}

.left-area {
	flex: 2;
}

.filter-bar {
	background: #eee;
	border-radius: 8px;
	padding: 7px 16px;
	margin-bottom: 16px;
	color: #222;
	font-size: 0.95rem;
}

.filter-bar span {
	margin-right: 22px;
	color: #666;
}

.course-list {
	display: flex;
	flex-direction: column;
	gap: 18px;
}

.course-item {
	background: #ff9752;
	color: #231910;
	padding: 19px 22px;
	border-radius: 13px;
	font-size: 1.07rem;
	font-weight: 600;
	box-shadow: 0 2px 8px 0 rgba(251, 153, 90, 0.11);
	transition: background .2s;
}

.course-item:hover {
	background: #ee853f;
}

.right-area {
	flex: 1;
	min-width: 160px;
	background: #fdd1b4;
	border-radius: 22px;
	height: 210px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #445b19;
	font-weight: 700;
	font-size: 1.1rem;
}

.footer {
	margin-top: 44px;
	background: #eaf8d7;
	border-radius: 10px;
	text-align: center;
	padding: 15px;
	color: #000;
	font-size: 1.01rem;
}

.hashtag {
	color: #616161;
	font-size: 1.04rem;
	margin-bottom: 7px;
}

@media ( max-width : 820px) {
	.container {
		max-width: 97vw;
	}
	.filters {
		flex-direction: column;
	}
	.right-area {
		width: 100%;
		height: 120px;
		margin-top: 20px;
	}
}

.tag-link {
	color: #616161;
	font-size: 1.06rem;
	margin-right: 9px;
	cursor: pointer;
	text-decoration: none;
	transition: color .17s;
}

.tag-link:hover {
	color: #ee853f;
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<!-- 상단 네비게이션 -->
		<div class="top-nav">
			<a href="#">로고</a> <a href="#">홈</a> <a href="#">테마</a> <a href="#"
				style="color: #fdd1b4;">여행코스</a> <a href="#">여행정보</a> <a href="#">검색</a>
			<a href="#">로그인</a>
		</div>
		<div class="hashtag" style="margin-bottom: 10px;">
			<!-- 태그 입력 폼 -->
			<form action="${pageContext.request.contextPath}/travelCourse/addTag"
				method="post" style="display: inline;">
				<input type="text" name="newTag" maxlength="15"
					placeholder="새 태그 입력"
					style="border-radius: 7px; border: 1px solid #ffd5a0; padding: 4px 10px;">
				<button type="submit"
					style="background: #ff9752; border: none; color: #fff; border-radius: 7px; padding: 4px 12px; font-weight: 600;">
					추가</button>
			</form>
			<br>
			<!-- 태그 리스트 -->
			<c:choose>
				<c:when test="${empty tagList}">
					<span style="color: #bbb;">태그가 없습니다.</span>
				</c:when>
				<c:otherwise>
					<c:forEach var="tag" items="${tagList}">
						<a
							href="${pageContext.request.contextPath}/travelCourse/tag/${tag.tagName}"
							class="tag-link"> #${tag.tagName} </a>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="filters">
			<div class="left-area">
				<div class="filter-bar">
					<b>건수</b> <span>최신순</span> | <span>거리순</span> | <span>인기순</span>
				</div>
				<div class="course-list">
					<c:choose>
						<c:when test="${empty list}">
							<div style="text-align: center; color: #b66d24;">여행코스가
								없습니다.</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="course" items="${list}">
								<a
									href="${pageContext.request.contextPath}/travelCourse/detail/${course.courseId}"
									style="text-decoration: none;">
									<div class="course-item">${course.title}</div>
								</a>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="right-area">검색 필터링</div>
		</div>
		<div class="footer">푸터(안내사항)</div>
	</div>
</body>
</html>