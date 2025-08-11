<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>여행 코스</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap')
	;

body {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	background-color: #f4f4f4;
	color: #222;
}

/* Main Container */
.container {
	display: flex;
	max-width: 1200px;
	margin: 20px auto;
	padding: 0 20px;
	gap: 20px;
}

.left-panel {
	flex: 3;
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
}

.header-container {
	background: #fff;
	padding: 0;
	margin-bottom: 20px;
	border-bottom: 1px solid #eee;
}

.page-title {
	font-weight: 700;
	font-size: 24px;
	color: #232323;
	margin-bottom: 10px;
	letter-spacing: -1px;
}

.header-bottom {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 10px 0;
	font-size: 14px;
}

.total-count {
	color: #666;
	font-size: 14px;
}

.total-number {
	color: #ff9752;
	font-size: 16px;
	font-weight: 700;
}

.sort-options {
	display: none;
}

/* Travel Item */
.travel-list {
	list-style: none;
	padding: 0;
	margin: 0;
}

.travel-item {
	display: flex;
	gap: 20px;
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #eee;
	align-items: flex-start;
}

.travel-item:last-child {
	border-bottom: none;
}

.travel-item a {
	display: block;
	flex-shrink: 0;
}

.travel-item img {
	width: 200px;
	height: 120px;
	object-fit: cover;
	border-radius: 8px;
}

.travel-info {
	flex: 1;
	display: flex;
	flex-direction: column;
}

.travel-title {
	font-weight: 700;
	font-size: 18px;
	margin-bottom: 4px;
}

.travel-title a {
	color: #222;
	text-decoration: none;
}

.travel-location {
	font-size: 13px;
	color: #666;
	margin-bottom: 4px;
}

.hashtags {
	margin-top: auto;
}

.hashtags span {
	display: inline-block;
	background: #f0f0f0;
	color: #666;
	padding: 4px 8px;
	border-radius: 4px;
	font-size: 12px;
	margin-right: 5px;
	margin-bottom: 5px;
}

/* Right Panel */
.right-panel {
	flex: 1;
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
	height: fit-content;
}

.filter-section {
	margin-bottom: 25px;
}

.filter-section h4 {
	font-size: 16px;
	font-weight: 700;
	color: #333;
	margin-bottom: 10px;
	padding-bottom: 5px;
	border-bottom: 1px solid #eee;
}

.tags {
	display: flex;
	flex-wrap: wrap;
	gap: 15px 8px;
}

.tags a {
	text-decoration: none;
	color: inherit;
}

.tags span {
	cursor: pointer;
	padding: 6px 12px;
	border-radius: 20px;
	background: #f0f0f0;
	color: #666;
	font-size: 13px;
	transition: background-color 0.2s, color 0.2s;
}

.tags span.active {
	background: #ee853f;
	color: white;
	font-weight: 500;
}

.promo-banner {
	margin-top: 20px;
}

.promo-banner img {
	max-width: 100%;
	border-radius: 8px;
	border: 2px solid #f7d49c;
}
</style>
</head>
<body>
	<%@ include file="RCHeader.jsp"%>

	<div class="container">
		<section class="left-panel">
			<div class="header-container">
				<div class="page-title">
					<span># <c:choose>
							<c:when test="${empty param.tag || param.tag eq '전체'}">제주</c:when>
							<c:otherwise>${param.tag}</c:otherwise>
						</c:choose>
					</span>
				</div>
				<div class="header-bottom">
					<span class="total-count"> 총 <span class="total-number" id="filtered-count">0</span>건</span>
				</div>
			</div>

			<c:set var="allTravelList" value="${
                [
                    { 'id': '1', 'name': '제주올레길', 'sumup': '제주 제주시', 'image': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/4b/83/43/olle-trail-along-the.jpg?w=700&h=400&s=1', 'hashtags': '올레길,한라산,섬여행,힐링,사진스팟' },
                    { 'id': '2', 'name': '제주 사계해안도로', 'sumup': '제주 서귀포시', 'image': 'https://allways.kg-mobility.com/wp-content/uploads/2021/06/shutterstock_1235487067.jpg', 'hashtags': '바다,해변,드라이브코스,커플여행,야경' },
                    { 'id': '3', 'name': '한라산 숲 안에서 보내는 하루밤', 'sumup': '제주 제주시', 'image': 'https://cdn.jejusori.net/news/photo/201102/95115_102616_1845.jpg', 'hashtags': '한라산,에코투어,힐링,가족여행' },
                    { 'id': '4', 'name': '제주도 세계자연유산 탐방 1코스', 'sumup': '제주 제주시', 'image': 'https://cdn.jejusori.net/news/photo/202110/334570_346433_5355.jpg', 'hashtags': '한라산,세계자연유산,에코투어,가족여행' },
                    { 'id': '5', 'name': '몸과 마음을 치유하는 에코 테라피', 'sumup': '제주 서귀포시', 'image': 'https://api.cdn.visitjeju.net/photomng/imgpath/202111/05/8b95bbda-f861-43f8-bc38-726c0c421b70.jpg', 'hashtags': '에코투어,힐링,가족여행' }
                ]
            }" />

			<c:set var="totalCount" value="${0}" />
			<ul class="travel-list">
				<c:forEach var="travel" items="${allTravelList}">
					<c:if test="${empty param.tag || param.tag eq '전체' || fn:contains(travel.hashtags, param.tag)}">
						<c:set var="totalCount" value="${totalCount + 1}" />
						<li class="travel-item">
							<a href="/RecommendedCourse/Detail<c:out value="${travel.id}"/>">
								<img src="${travel.image}" alt="${travel.name}" />
							</a>
							<div class="travel-info">
								<div class="travel-title">
									<a href="/RecommendedCourse/Detail<c:out value="${travel.id}"/>">
										${travel.name}
									</a>
								</div>
								<div class="travel-location">${travel.sumup}</div>
								<div class="hashtags">
									<c:set var="hashtags" value="${fn:split(travel.hashtags, ',')}" />
									<c:forEach var="hashtag" items="${hashtags}">
										<span>#<c:out value="${hashtag}" /></span>
									</c:forEach>
								</div>
							</div>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</section>

		<aside class="right-panel">
			<div class="filter-section">
				<h4>코스 유형</h4>
				<div class="tags">
					<a href="?tag=전체"><span id="all-tag"
						class="${(empty param.tag || param.tag eq '전체') ? 'active' : ''}">#전체</span></a>
					<a href="?tag=바다"><span
						class="${param.tag eq '바다' ? 'active' : ''}">#바다</span></a>
					<a href="?tag=해변"><span
						class="${param.tag eq '해변' ? 'active' : ''}">#해변</span></a>
					<a href="?tag=오름"><span
						class="${param.tag eq '오름' ? 'active' : ''}">#오름</span></a>
					<a href="?tag=올레길"><span
						class="${param.tag eq '올레길' ? 'active' : ''}">#올레길</span></a>
					<a href="?tag=한라산"><span
						class="${param.tag eq '한라산' ? 'active' : ''}">#한라산</span></a>
					<a href="?tag=우도"><span
						class="${param.tag eq '우도' ? 'active' : ''}">#우도</span></a>
					<a href="?tag=성산일출봉"><span
						class="${param.tag eq '성산일출봉' ? 'active' : ''}">#성산일출봉</span></a>
					<a href="?tag=섬여행"><span
						class="${param.tag eq '섬여행' ? 'active' : ''}">#섬여행</span></a>
					<a href="?tag=힐링"><span
						class="${param.tag eq '힐링' ? 'active' : ''}">#힐링</span></a>
					<a href="?tag=감성카페"><span
						class="${param.tag eq '감성카페' ? 'active' : ''}">#감성카페</span></a>
					<a href="?tag=야경"><span
						class="${param.tag eq '야경' ? 'active' : ''}">#야경</span></a>
					<a href="?tag=사진스팟"><span
						class="${param.tag eq '사진스팟' ? 'active' : ''}">#사진스팟</span></a>
					<a href="?tag=에코투어"><span
						class="${param.tag eq '에코투어' ? 'active' : ''}">#에코투어</span></a>
					<a href="?tag=수국명소"><span
						class="${param.tag eq '수국명소' ? 'active' : ''}">#수국명소</span></a>
					<a href="?tag=자전거여행"><span
						class="${param.tag eq '자전거여행' ? 'active' : ''}">#자전거여행</span></a>
					<a href="?tag=전통시장"><span
						class="${param.tag eq '전통시장' ? 'active' : ''}">#전통시장</span></a>
					<a href="?tag=먹거리"><span
						class="${param.tag eq '먹거리' ? 'active' : ''}">#먹거리</span></a>
					<a href="?tag=돌담길"><span
						class="${param.tag eq '돌담길' ? 'active' : ''}">#돌담길</span></a>
					<a href="?tag=해녀문화"><span
						class="${param.tag eq '해녀문화' ? 'active' : ''}">#해녀문화</span></a>
					<a href="?tag=가족여행"><span
						class="${param.tag eq '가족여행' ? 'active' : ''}">#가족여행</span></a>
					<a href="?tag=커플여행"><span
						class="${param.tag eq '커플여행' ? 'active' : ''}">#커플여행</span></a>
				</div>
			</div>
		</aside>
	</div>
	<script>
		document.getElementById('filtered-count').textContent = '${totalCount}';
	</script>
</body>
</html>