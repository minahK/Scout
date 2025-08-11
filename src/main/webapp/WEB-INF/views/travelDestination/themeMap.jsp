<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>제주 여행지 지도</title>

<!-- Leaflet (키 불필요) -->
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

<style>
body {
	margin: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

.themeMap-container {
	display: flex;
	height: 600px;
	padding: 0 150px; /* ← 좌우 150px */
	box-sizing: border-box; /* padding 포함해 너비 계산 */
}

#map {
	flex: 7;
	border-radius:16px;
  	overflow:hidden;         /* 타일/컨트롤이 모서리 밖으로 안 새게 */
  	box-shadow:0 8px 24px rgba(0,0,0,.12); /* 선택 */
} /* 왼쪽 절반: 지도 */
.list {
	flex: 3;
	background: #f8f8f8;
	overflow-y: auto;
	padding: 20px;
	box-sizing: border-box;
} /* 오른쪽 절반: 리스트 */
.list h2 {
	margin-top: 0;
}

.place {
	background: #fff;
	border-radius: 10px;
	padding: 14px;
	margin-bottom: 12px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, .08);
	cursor: pointer;
}

.place:hover {
	background: #e9f4ff;
}

.place-title {
	font-weight: 800;
	font-size: 16px;
}

.place-desc {
	font-size: 13px;
	color: #555;
	margin-top: 4px;
}
</style>
</head>
<body>

	<div class="themeMap-container">
		<!-- 왼쪽: 지도 -->
		<h2></h2>
		<div id="map"></div>

		<!-- 오른쪽: 여행지 리스트 -->
		<div class="list">
			<h2>여행 지도<h2>
			<div id="placeList"></div>
		</div>
	</div>

	<script>
// ===== 1) 데이터: 서버가 내려준 travelList(최대 4개 사용), 없으면 예시 =====
var places = [];
<c:if test="${not empty travelList}">
  <c:forEach var="p" items="${travelList}" varStatus="st" begin="0" end="3">
    places.push({
      title: "${fn:escapeXml(p.name)}",
      lat:   ${p.latitude},
      lng:   ${p.longitude},
      desc:  "${fn:escapeXml(p.descride)}"
    });
  </c:forEach>
</c:if>
<c:if test="${empty travelList}">
  places = [
    { title: "성산일출봉",  lat: 33.4588, lng: 126.9422, desc: "제주를 대표하는 일출 명소" },
    { title: "한라산",      lat: 33.3617, lng: 126.5292, desc: "대한민국 최고봉 한라산" },
    { title: "협재해수욕장", lat: 33.3942, lng: 126.2398, desc: "맑고 에메랄드빛 바다" },
    { title: "섭지코지",    lat: 33.4321, lng: 126.9295, desc: "드라마 촬영지로 유명한 해안" },
    { title: "만장굴",       lat: 33.5314, lng: 126.7708, desc: "제주에서 가장 큰 용암동굴" },
    { title: "비자림",       lat: 33.4909, lng: 126.8099, desc: "천년 비자나무 숲길" },
    { title: "용두암",       lat: 33.5141, lng: 126.5119, desc: "바다를 향한 용의 형상 바위" },
    { title: "천지연폭포",   lat: 33.2463, lng: 126.5597, desc: "야간 조명이 아름다운 폭포" },
    { title: "산굼부리",     lat: 33.4305, lng: 126.6885, desc: "분화구와 억새평원 풍경" },
    { title: "대포 주상절리", lat: 33.2449, lng: 126.4125, desc: "용암이 만든 육각 기둥 절벽" },
    { title: "제주 동문시장",    lat: 33.5129, lng: 126.5283, desc: "먹거리와 볼거리 가득한 제주의 대표 전통시장" },
    { title: "이호테우해변",     lat: 33.5106, lng: 126.4528, desc: "말등대와 노을이 아름다운 도심 근교 해변" },
    { title: "김녕해수욕장",     lat: 33.5573, lng: 126.7451, desc: "에메랄드빛 바다와 하얀 모래가 매력적인 해변" },
    { title: "월정리해변",       lat: 33.5563, lng: 126.8009, desc: "카페거리와 서핑으로 유명한 포토 스팟" },
    { title: "표선 해비치 해변", lat: 33.3251, lng: 126.8425, desc: "완만한 수심과 잔잔한 파도의 가족 여행지" },
    { title: "수월봉",           lat: 33.2942, lng: 126.1628, desc: "차귀도와 어우러진 서쪽 바다 전망 명소" },
    { title: "송악산",           lat: 33.2041, lng: 126.2907, desc: "해안 산책로와 말 방목지로 유명한 절경" },
    { title: "우도 서빈백사",    lat: 33.5063, lng: 126.9550, desc: "산호 모래가 빚은 눈부신 하얀 해변" },
    { title: "에코랜드",         lat: 33.4489, lng: 126.6703, desc: "기차 타고 도는 숲 테마파크" },
    { title: "카멜리아힐",       lat: 33.2896, lng: 126.3703, desc: "수국·동백으로 사계절 꽃이 가득한 정원" }
  ];
</c:if>

// ===== 2) 지도 초기화 (제주 중심) — OpenStreetMap 타일 사용, API 키 없음 =====
var map = L.map('map', {
  center: [33.3846, 126.5347],
  zoom: 10,
  zoomControl: true
});
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  maxZoom: 19,
  attribution: '&copy; OpenStreetMap'
}).addTo(map);

// ===== 3) 마커 + 팝업 =====
var markers = [];
var popups  = [];

places.forEach(function(p){
  var marker = L.marker([p.lat, p.lng]).addTo(map);
  var popupHtml =
    "<div style='font-weight:700; margin-bottom:4px;'>" + escapeHtml(p.title) + "</div>" +
    "<div style='font-size:13px; color:#555; max-width:220px;'>" + escapeHtml(p.desc) + "</div>";
  marker.bindPopup(popupHtml);
  markers.push(marker);
  popups.push(popupHtml);
});

// ===== 4) 오른쪽 리스트 렌더 + 클릭 시 지도 이동/팝업 오픈 =====
var listEl = document.getElementById("placeList");
places.forEach(function(p, i){
  var el = document.createElement("div");
  el.className = "place";
  el.innerHTML =
    "<div class='place-title'>" + escapeHtml(p.title) + "</div>" +
    "<div class='place-desc'>"  + escapeHtml(p.desc)  + "</div>";
  el.onclick = function(){
    map.flyTo([p.lat, p.lng], Math.max(map.getZoom(), 13), { duration: 0.5 });
    markers[i].openPopup();
  };
  listEl.appendChild(el);
});

// 간단한 XSS 방지용
function escapeHtml(str){
  if(!str) return "";
  return String(str)
    .replace(/&/g,"&amp;")
    .replace(/</g,"&lt;")
    .replace(/>/g,"&gt;")
    .replace(/"/g,"&quot;");
}
</script>
</body>
</html>