<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>날씨+여행소식</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
body {
	background: #fff8f3;
	font-family: 'Noto Sans KR', sans-serif;
}
.info-main-row {
	display: flex;
	max-width: 880px;
	margin: 44px auto 0 auto;
	align-items: flex-start;
	gap: 42px;
}
.weather-card {
	width: 350px;
	height: 210px;
	border-radius: 22px;
	box-shadow: 0 6px 38px rgba(255,120,16,0.12), 0 2px 24px rgba(60, 20, 0, 0.09);
	color: #fff;
	display: flex;
	align-items: flex-end;
	position: relative;
	overflow: hidden;
	background:
		linear-gradient(135deg, #ffe6c780 0%, #a78c5c80 100%),
		url('https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=800&q=80') center/cover no-repeat;
	transition: box-shadow .16s;
}
.weather-card::after {
	content: "";
	position: absolute;
	inset: 0;
	background:
		linear-gradient(135deg, #ffe6c7ad 0%, #a78c5c88 100%),
		linear-gradient(0deg, rgba(38,28,20,0.23) 75%, rgba(255,250,228,0.00) 100%);
	pointer-events: none;
}
.weather-content {
	position: relative;
	width: 100%;
	padding: 30px 28px 22px 28px;
	background: rgba(44,30,0,0.23);
	backdrop-filter: blur(2.5px) brightness(1.12);
	border-radius: 0 0 22px 22px;
	box-shadow: 0 6px 36px 0 rgba(255,110,0,0.10);
	z-index: 1;
}
.weather-row {
	display: flex;
	align-items: center;
	gap: 19px;
}
.weather-icon {
	font-size: 48px;
	margin-right: 3px;
	text-shadow: 0 3px 18px #b7832340;
}
.weather-info-main {
	display: flex;
	flex-direction: column;
}
.weather-temp {
	font-size: 39px;
	font-weight: 900;
	margin-bottom: 0;
	letter-spacing: -2px;
	line-height: 1.03;
	text-shadow: 0 2px 10px #62400244;
}
.weather-city {
	font-size: 19px;
	font-weight: 700;
	color: #ffeec2;
	margin-top: 2px;
	line-height: 1.07;
	text-shadow: 0 1px 10px #9e7b2e66;
}
.weather-desc {
	margin-top: 14px;
	font-size: 16px;
	color: #ffe6ba;
	opacity: 1;
	font-weight: 400;
	letter-spacing: -0.7px;
	text-shadow: 0 2px 7px #66522144;
}
/* 반응형 */
@media ( max-width : 900px) {
	.info-main-row {
		flex-direction: column;
		align-items: stretch;
		max-width: 98vw;
	}
	.weather-card {
		width: 100%;
		min-width: 0;
	}
}
.news-section {
	flex: 1;
	min-width: 320px;
	max-width: 470px;
}
.news-header-row {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 8px;
}
.news-title {
	font-size: 23px;
	font-weight: 900;
	color: #111;
	letter-spacing: -1px;
}
.news-more-btn {
	font-size: 23px;
	color: #111;
	background: none;
	border: none;
	cursor: pointer;
	font-weight: 700;
	margin-left: 12px;
	padding: 0 2px;
	transition: color 0.13s;
}
.news-more-btn:hover {
	color: #ee853f;
}
.news-list {
	margin: 0;
	padding: 0;
	list-style: none;
}
.news-item {
	padding: 0;
	margin-bottom: 2px;
	display: flex;
	align-items: flex-start;
	border-bottom: 1px solid #eee;
	font-size: 16.5px;
	min-height: 38px;
}
.news-badge {
	background: #ffae3b;
	color: #fff;
	font-size: 13px;
	border-radius: 9px;
	padding: 3.5px 11px 3.5px 11px;
	font-weight: 700;
	margin-right: 10px;
	margin-top: 7px;
	display: inline-block;
	letter-spacing: -1px;
}
.news-link {
	color: #ff7f25;
	font-weight: 700;
	margin-right: 3px;
	text-decoration: none;
	margin-top: 7px;
}
.news-link:hover { text-decoration: underline; }
.news-body {
	color: #222;
	font-weight: 500;
	margin-right: 4px;
	margin-top: 7px;
	text-decoration: none;
}

.news-body:hover {
	color: #ee853f;
	font-weight: 700;
	cursor:pointer;
}
.news-emoji, .news-icon {
	font-size: 18px;
	margin-left: 2px;
	margin-top: 7px;
}
</style>
</head>
<body>
	<div class="info-main-row">
		<!-- 왼쪽: 날씨 카드 (외부 제주풍경 이미지 배경) -->
		<div class="weather-card">
			<div class="weather-content">
				<div class="weather-row">
					<span class="material-icons weather-icon" id="w-icon">wb_sunny</span>
					<div class="weather-info-main">
						<span class="weather-temp" id="w-temp">--°C</span> 
						<span class="weather-city" id="w-city">제주도</span>
					</div>
				</div>
				<div class="weather-desc" id="w-desc">날씨 확인중...</div>
			</div>
		</div>
		<!-- 오른쪽: 여행 소식 -->
		<div class="news-section">
			<div class="news-header-row">
				<span class="news-title">📆 오늘의 행사 소식</span>
				<button class="news-more-btn" onClick="location.href='/festival/list'">+</button>
			</div>
			<ul class="news-list">
				<c:forEach var="festival" items="${festivalList}">
					<li class="news-item">🎈&nbsp;&nbsp;<a href="festival/detail?id=${festival.id}" class="news-body">${festival.title}</a></li>
				</c:forEach>
			
				<!-- <li class="news-item"><span class="news-badge">행정안전부</span> <span
					class="news-body">호우 국민행동요령 - 호우·태풍 이렇게 행동하세요</span></li>
				<li class="news-item"><a href="#" class="news-link">한국관광공사</a>
					<span class="news-body">'2025 대한민국 밤밤 페스타' 전국 개막</span> <span
					class="news-emoji">🍌</span></li>
				<li class="news-item"><a href="#" class="news-link">강원특별자치도</a>
					<span class="news-body">2025년 Tour de DMZ 고성 그란폰도 개최</span> <span
					class="news-icon">🚴‍♂️</span></li>
				<li class="news-item"><a href="#" class="news-link">해양수산부</a> <span
					class="news-body">제11회 섬 여행 영상 공모전</span> <span class="news-icon">🎥</span>
				</li> -->
			</ul>
		</div>
	</div>
<script>
fetch('https://api.openweathermap.org/data/2.5/weather?lat=33.4996&lon=126.5312&units=metric&lang=kr&appid=da625f35d4b2d9ac5cc2fbb003b22b43')
  .then(res => res.json())
  .then(data => {
    document.getElementById("w-temp").innerText = Math.round(data.main.temp) + "°C";
    document.getElementById("w-city").innerText = data.name;
    document.getElementById("w-desc").innerText = data.weather[0].description;
    // 날씨에 따라 아이콘 변경
    let main = data.weather[0].main;
    let icon = "wb_sunny";
    if(main.includes("Cloud")) icon = "cloud";
    else if(main.includes("Rain")) icon = "grain";
    else if(main.includes("Clear")) icon = "wb_sunny";
    else icon = "filter_drama";
    document.getElementById("w-icon").innerText = icon;
  })
  .catch(() => {
    document.getElementById("w-desc").innerText = "날씨 정보를 불러올 수 없습니다.";
  });
</script>
</body>
</html>