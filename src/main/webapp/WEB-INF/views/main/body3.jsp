<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>날씨+여행소식</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
body {
	background: #fff;
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
	height: 200px;
	background: #141414
		url('https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80')
		center/cover no-repeat;
	border-radius: 18px;
	color: #fff;
	box-shadow: 0 2px 24px rgba(20, 30, 40, 0.08);
	padding: 0;
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	overflow: hidden;
	position: relative;
}

.weather-content {
	background: rgba(15, 15, 20, 0.70);
	padding: 24px 22px 20px 22px;
	border-radius: 0 0 18px 18px;
}

.weather-row {
	display: flex;
	align-items: center;
	gap: 19px;
}

.weather-icon {
	font-size: 54px;
	line-height: 1;
	margin-right: 4px;
}

.weather-info-main {
	display: flex;
	flex-direction: column;
}

.weather-temp {
	font-size: 38px;
	font-weight: 900;
	margin-bottom: 1px;
	letter-spacing: -2px;
}

.weather-city {
	font-size: 18px;
	font-weight: 700;
}

.weather-desc {
	margin-top: 9px;
	font-size: 16px;
	color: #f8f8f8;
	opacity: 0.88;
	font-weight: 400;
}

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
	color: #4685ef;
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
	background: #313439;
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
	color: #3762d7;
	font-weight: 700;
	margin-right: 3px;
	text-decoration: none;
	margin-top: 7px;
}

.news-body {
	color: #222;
	font-weight: 500;
	margin-right: 4px;
	margin-top: 7px;
}

.news-emoji, .news-icon {
	font-size: 18px;
	margin-left: 2px;
	margin-top: 7px;
}
</style>
<!-- 날씨 아이콘: https://fonts.googleapis.com/icon?family=Material+Icons 사용 (또는 SVG, 이모지 대체) -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>
<body>
	<div class="info-main-row">
		<!-- 왼쪽: 날씨 카드 (실제 API 연결시 JS만 바꿔주면 됨) -->
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
				<span class="news-title">오늘의 여행 소식</span>
				<button class="news-more-btn">+</button>
			</div>
			<ul class="news-list">
				<li class="news-item"><span class="news-badge">행정안전부</span> <span
					class="news-body">호우 국민행동요령 - 호우·태풍 이렇게 행동하세요</span></li>
				<li class="news-item"><a href="#" class="news-link">한국관광공사</a>
					<span class="news-body">'2025 대한민국 밤밤 페스타' 전국 개막</span> <span
					class="news-emoji">🍌</span></li>
				<li class="news-item"><a href="#" class="news-link">강원특별자치도</a>
					<span class="news-body">2025년 Tour de DMZ 고성 그란폰도 개최</span> <span
					class="news-icon">🚴‍♂️</span></li>
				<li class="news-item"><a href="#" class="news-link">해양수산부</a> <span
					class="news-body">제11회 섬 여행 영상 공모전</span> <span class="news-icon">🎥</span>
				</li>
			</ul>
		</div>
	</div>
	<script>
// ===== 제주도 초단기 실황 API 요청 =====
var xhr = new XMLHttpRequest();
var url = 'https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst';
var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + '9%2FrVQNUrrD74vHUHYK%2Bau7E3Bgqd8Nko3F0%2Ft8hCl%2Fj4jB4ldy6f%2F%2FAQAYXXcG7nZGneRTyXFm7Rq02V2MAquQ%3D%3D';
queryParams += '&' + encodeURIComponent('pageNo') + '=1';
queryParams += '&' + encodeURIComponent('numOfRows') + '=100';
queryParams += '&' + encodeURIComponent('dataType') + '=XML'; 
queryParams += '&' + encodeURIComponent('base_date') + '=20250129'; // 오늘 날짜 (예: 20250129)
queryParams += '&' + encodeURIComponent('base_time') + '=0600'; // 최신 발표 시간
queryParams += '&' + encodeURIComponent('nx') + '=53';  // 제주 격자 X
queryParams += '&' + encodeURIComponent('ny') + '=38';  // 제주 격자 Y

xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
        var xmlDoc = this.responseXML;
        var items = xmlDoc.getElementsByTagName("item");
        
        let temp = null;
        let sky = null;

        for (let i = 0; i < items.length; i++) {
            const category = items[i].getElementsByTagName("category")[0].textContent;
            const value = items[i].getElementsByTagName("obsrValue")[0].textContent;
            if (category === "T1H") temp = value; // 기온
            if (category === "SKY") sky = value;  // 하늘 상태
        }

        // SKY 코드 → 아이콘/설명 변환
        let icon = "wb_sunny";
        let desc = "맑음";
        if (sky == 3) { icon = "cloud"; desc = "구름 많음"; }
        if (sky == 4) { icon = "filter_drama"; desc = "흐림"; }

        document.getElementById("w-temp").innerText = temp + "°C";
        document.getElementById("w-desc").innerText = desc;
        document.getElementById("w-icon").innerText = icon;
    }
};
xhr.send();
</script>
</body>
</html>