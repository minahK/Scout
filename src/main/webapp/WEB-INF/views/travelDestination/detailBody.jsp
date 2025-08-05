<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>${travel.name}상세페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
html {
	scroll-behavior: smooth;
}

.detail-top-wrap {
	max-width: 900px;
	margin: 0 auto;
	padding-top: 36px;
	text-align: center;
}

.travel-title {
	font-size: 2.3rem;
	font-weight: 900;
	letter-spacing: -1.3px;
	margin: 7px 0 7px 0;
}

.travel-region {
	color: #767676;
	font-size: 1.08rem;
	margin-bottom: 19px;
}

.travel-sumup {
	font-size: 1.25rem;
	font-weight: 600;
	color: #232323;
	display: inline-block;
	background: linear-gradient(transparent 60%, #ffe1e1 60%);
	padding: 3px 0 1px 0;
	margin-bottom: 16px;
	letter-spacing: -0.3px;
}

.icon-row-wrap {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 32px 0 10px 0;
}

.icon-row {
	display: flex;
	gap: 23px;
	align-items: center;
}

.icon-item {
	display: flex;
	align-items: center;
	font-size: 1.17rem;
	color: #222;
	gap: 7px;
	font-weight: 400;
}

.icon-item .fa-heart, .icon-item .fa-eye, .icon-item .fa-bookmark,
	.icon-item .fa-print, .icon-item .fa-location-dot, .icon-item .fa-share-nodes
	{
	font-size: 19px;
	color: #333;
}

.tab-menu {
	display: flex;
	justify-content: center;
	border-bottom: 1.5px solid #ededed;
	margin: 0 0 0 0;
	font-size: 1.09rem;
}

.tab-menu .tab {
	flex: 1 1 0;
	text-align: center;
	padding: 13px 0 12px 0;
	cursor: pointer;
	font-weight: 500;
	color: #454545;
	border-right: 1px solid #eee;
	background: transparent;
	transition: font-weight 0.15s, border-bottom 0.2s;
}

.tab-menu .tab:last-child {
	border-right: none;
}

.tab-menu .tab.active {
	font-weight: 900;
	color: #222;
	border-bottom: 2.5px solid #222;
	background: transparent;
}

.section-title-row {
	display: flex;
	align-items: center;
	justify-content: space-between;
	max-width: 97%;
	margin: 0 auto;
	margin-top: 24px;
}

.section-title {
	font-size: 1.3rem;
	font-weight: 700;
	color: #2d2d2d;
	letter-spacing: -0.3px;
}

.section-underline {
	border: none;
	border-bottom: 2.3px solid #34363c;
	margin: 0 0 10px 0;
	width: 100%;
}

.detail-img {
	width: 100%;
	max-width: 100%;
	height: auto;
	border-radius: 6px;
	margin: 18px 0 28px 0;
	display: block;
}

#photo-section, #detail-section, #comment-section, #recommend-section {
	scroll-margin-top: 90px;
}
/* 지도+정보 표 스타일 */
.map-wrap {
	width: 100%;
	max-width: 1080px;
	margin: 0 auto 22px auto;
	border-radius: 13px;
	overflow: hidden;
	box-shadow: 0 2px 24px #0001;
	background: #fff;
	position: relative;
}

.map-btn {
	position: absolute;
	top: 16px;
	right: 16px;
	padding: 7px 16px;
	border-radius: 7px;
	background: #fff;
	font-size: 15px;
	color: #444;
	border: 1px solid #eee;
	box-shadow: 0 2px 6px #0001;
	cursor: pointer;
	z-index: 2;
	transition: background 0.12s;
}

.map-btn:hover {
	background: #f3f8ff;
}

.info-table {
	width: 100%;
	max-width: 1080px;
	margin: 0 auto 24px auto;
	font-size: 16px;
	border-spacing: 0 6px;
	color: #222;
}

.info-table td {
	padding: 6px 7px 6px 0;
	vertical-align: top;
	line-height: 1.55;
}

.info-table td:first-child {
	color: #555;
	font-weight: 400;
	width: 110px;
}

.info-table .col-title {
	font-weight: 600;
	color: #4b6cc0;
	width: 92px;
}

@media ( max-width : 780px) {
	.detail-top-wrap, .map-wrap, .info-table {
		width: 99vw;
		min-width: 0;
	}
}
</style>
</head>
<body>
	<div class="detail-top-wrap">

		<!-- 여행지명 -->
		<div class="travel-title">${travel.name}</div>
		<div class="travel-region">제주시</div>
		<div class="travel-sumup">${travel.sumup}</div>

		<!-- 아이콘/정보 row -->
		<div class="icon-row-wrap">
			<div class="icon-row">
				<div class="icon-item">
					<i class="fa-regular fa-heart"></i><span>0</span>
				</div>
				<div class="icon-item">
					<i class="fa-regular fa-eye"></i><span>949</span>
				</div>
			</div>
			<div class="icon-row">
				<div class="icon-item">
					<i class="fa-regular fa-bookmark"></i>
				</div>
				<div class="icon-item">
					<i class="fa fa-print"></i>
				</div>
				<div class="icon-item">
					<i class="fa-solid fa-location-dot"></i>
				</div>
				<div class="icon-item">
					<i class="fa-solid fa-share-nodes"></i>
				</div>
				<div class="icon-item">
					<span>0</span>
				</div>
			</div>
		</div>

		<hr>

		<!-- 탭 메뉴 -->
		<div class="tab-menu">
			<div class="tab active" data-target="photo-section">사진보기</div>
			<div class="tab" data-target="detail-section">상세정보</div>
			<div class="tab" data-target="comment-section">댓글</div>
			<div class="tab" data-target="recommend-section">추천여행</div>
		</div>

		<!-- 섹션 id 지정! -->
		<div id="photo-section"></div>
		<br> <img alt="이미지" src="${travel.image}" class="detail-img">

		<div id="detail-section"></div>
		<div class="section-title-row">
			<div class="section-title">상세정보</div>
		</div>
		<hr class="section-underline" />
		<div>${travel.descride}</div>
		<br>
		<!-- 지도 + 여행지 정보 테이블 : 여기서부터! -->
		<div class="map-wrap">
			<!-- 지도 (예시: 카카오맵 iframe. travel.mapUrl 등으로 바꿔도 OK) -->
			<iframe width="100%" height="310" frameborder="0"
				style="border: 0; border-radius: 13px; box-shadow: 0 2px 24px #0001;"
				src="https://www.google.com/maps?q=${travel.latitude},${travel.longitude}&hl=ko&z=15&output=embed"
				allowfullscreen> </iframe>
			<button class="map-btn"
				onclick="window.open('https://www.google.com/maps?q=${travel.latitude},${travel.longitude}&hl=ko&z=15&output=embed')">
				여행지도보기 <span style="font-size: 13px;">&#8599;</span>
			</button>
		</div>
		<table class="info-table">
			<tr>
				<td class="col-title">문의 및 안내</td>
				<td>064-782-5671</td>
				<td class="col-title">홈페이지</td>
				<td><a href="https://www.visitjeju.net/kr" target="_blank">https://www.visitjeju.net/kr</a></td>
			</tr>
			<tr>
				<td class="col-title">주소</td>
				<td>제주특별자치도 제주시 성산읍 성산리 1</td>
				<td class="col-title">이용시간</td>
				<td>상시 개방</td>
			</tr>
			<tr>
				<td class="col-title">휴일</td>
				<td>연중무휴</td>
				<td class="col-title">주차</td>
				<td>가능</td>
			</tr>
			<tr>
				<td class="col-title">입장료</td>
				<td>무료</td>
				<td></td>
				<td></td>
			</tr>
		</table>

		<!-- 댓글 섹션 -->
		<div id="comment-section"></div>
		<div
			style="height: 380px; margin: 30px 0; background: #f9f9f9; border-radius: 9px; display: flex; align-items: center; justify-content: center; color: #aaa; font-size: 1.13rem;">
			댓글 영역 예시</div>

		<!-- 추천여행 섹션 -->
		<div id="recommend-section"></div>
		<div
			style="height: 200px; margin: 40px 0 30px 0; background: #e7f3ff; border-radius: 9px; display: flex; align-items: center; justify-content: center; color: #4984ce; font-size: 1.1rem;">
			추천여행 영역 예시</div>
	</div>

	<script>
    // 탭 클릭 시 해당 섹션으로 스크롤
    document.querySelectorAll('.tab-menu .tab').forEach(tab => {
        tab.addEventListener('click', function() {
            // 탭 active 처리
            document.querySelectorAll('.tab-menu .tab').forEach(t => t.classList.remove('active'));
            this.classList.add('active');

            // 해당 섹션으로 이동
            const targetId = this.getAttribute('data-target');
            const section = document.getElementById(targetId);
            if(section) section.scrollIntoView({ behavior: "smooth" });
        });
    });
    </script>
</body>
</html>