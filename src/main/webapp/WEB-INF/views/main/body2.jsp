<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>여행지 추천 탭</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap"
	rel="stylesheet">
<style>
body {
	margin: 0;
	font-family: 'Noto Sans KR', sans-serif;
	background: #fff;
}

.kokkok-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	max-width: 1100px;
	margin: 55px auto 0 auto;
	width: 95vw;
}

.kokkok-header-left {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
}

.kokkok-title {
	color: #eb5e00;
	font-size: 32px;
	font-weight: 900;
	letter-spacing: -1.5px;
	margin-bottom: 7px;
	display: flex;
	align-items: center;
}

.kokkok-sub {
	color: #ee853f;
	font-size: 17px;
	font-weight: 500;
}

.kokkok-tabs-wrap {
	width: 100vw;
	display: flex;
	justify-content: center;
	margin: 35px 0 0 0;
}

.kokkok-tabs-bg {
	width: 880px;
	background: #ee853f;
	border-radius: 14px 14px 12px 12px;
	box-shadow: 0 6px 26px 0 rgba(90, 100, 130, 0.07);
	padding-top: 5px;
	position: relative;
	min-height: 53px;
}

.kokkok-tabs {
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative;
	z-index: 1;
}

.kokkok-tab-btn {
	flex: 1 1 0;
	min-width: 0;
	border: none;
	background: transparent;
	color: #e9ecfd;
	font-size: 21px;
	font-weight: 700;
	padding: 17px 0 13px 0;
	text-align: center;
	cursor: pointer;
	position: relative;
	transition: color 0.15s;
	outline: none;
	border-radius: 12px 12px 0 0;
}

.kokkok-tab-btn:not(:last-child) {
	border-right: 1.5px solid #ee853f;
}

.kokkok-tab-btn.active {
	color: #fff;
	font-weight: 900;
	background: #ee853f;
}

.kokkok-tab-btn.active .tab-triangle {
	display: block;
}

.tab-triangle {
	display: none;
	position: absolute;
	left: 50%;
	bottom: -13px;
	transform: translateX(-50%);
	width: 23px;
	height: 14px;
	pointer-events: none;
}

.tab-triangle svg {
	width: 100%;
	height: 100%;
	display: block;
}

.kokkok-desc {
	max-width: 880px;
	margin: 16px auto 0 auto;
	text-align: center;
	font-size: 17px;
	color: #ee853f;
	letter-spacing: -0.1px;
	font-weight: 500;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 7px;
}

.kokkok-desc .dot-icon {
	font-size: 21px;
	color: #bbb;
	margin-right: 4px;
}

.kokkok-tab-contents {
	max-width: 880px;
	margin: 36px auto 0 auto;
	min-height: 120px;
	font-size: 20px;
}

.tab-content {
	display: none;
	animation: fadeIn .5s;
}

.tab-content.active {
	display: block;
}

@
keyframes fadeIn {
	from {opacity: 0;
}

to {
	opacity: 1;
}

}

/* 카드 스타일 추가 */
.card-list {
	display: flex;
	gap: 24px;
	flex-wrap: wrap;
	margin: 15px 0 0 0;
	justify-content: center;
}

.card {
	width: 232px;
	background: #fff;
	border-radius: 14px;
	box-shadow: 0 2px 16px rgba(80, 110, 160, 0.11);
	display: flex;
	flex-direction: column;
	overflow: hidden;
	transition: box-shadow 0.14s;
	margin-bottom: 14px;
}

.card:hover {
	box-shadow: 0 8px 32px rgba(30, 50, 90, 0.14);
}

.card-img-wrap {
	width: 100%;
	height: 132px;
	background: #eaf1fd;
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
}

.card-img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.card-body {
	padding: 15px 15px 14px 15px;
	display: flex;
	flex-direction: column;
}

.card-title {
	font-size: 16px;
	font-weight: 800;
	color: #48B2B7;
	margin-bottom: 5px;
}

.card-desc {
	font-size: 13.5px;
	color: #454545;
	font-weight: 400;
	line-height: 1.4;
}
/* 반응형 */
@media ( max-width : 950px) {
	.kokkok-tabs-bg, .kokkok-desc, .kokkok-tab-contents {
		width: 98vw;
		min-width: 210px;
	}
	.kokkok-header {
		max-width: 99vw;
	}
	.card-list {
		flex-wrap: wrap;
		justify-content: center;
	}
	.card {
		width: 42vw;
		min-width: 170px;
	}
}

@media ( max-width : 650px) {
	.card-list {
		gap: 14px;
	}
	.card {
		width: 93vw;
		min-width: 0;
	}
	.card-img-wrap {
		height: 31vw;
	}
}
</style>
</head>
<body>

	<!-- 헤더/타이틀 -->
	<div class="kokkok-header">
		<div class="kokkok-header-left">
			<span class="kokkok-title">여행지 추천</span> <span class="kokkok-sub">제주
				바람처럼 자유로운 여행, 추천 코스를 확인하세요~</span>
		</div>
	</div>

	<!-- 탭 바 -->
	<div class="kokkok-tabs-wrap">
		<div class="kokkok-tabs-bg">
			<div class="kokkok-tabs">
				<button class="kokkok-tab-btn active" onclick="selectTab(0)">
					핫플 <span class="tab-triangle"><svg viewBox="0 0 23 14">
							<polygon fill="#ee853f" points="0,0 11.5,14 23,0"></polygon></svg></span>
				</button>
				<button class="kokkok-tab-btn" onclick="selectTab(1)">
					맛집 <span class="tab-triangle"><svg viewBox="0 0 23 14">
							<polygon fill="#ee853f" points="0,0 11.5,14 23,0"></polygon></svg></span>
				</button>
				<button class="kokkok-tab-btn" onclick="selectTab(2)">
					감성 <span class="tab-triangle"><svg viewBox="0 0 23 14">
							<polygon fill="#ee853f" points="0,0 11.5,14 23,0"></polygon></svg></span>
				</button>
			</div>
		</div>
	</div>
	<!-- 탭별 콘텐츠 -->
	<div class="kokkok-tab-contents">
		<!-- 핫플 -->
		<div class="tab-content active" id="tab-content-0">
			<div class="kokkok-desc">
				<span class="dot-icon">⋯</span> <span>지금 떠나면 인생샷 보장! SNS
					핫플레이스 모음</span>
			</div>
			<div class="card-list">
				<c:forEach var="travel" items="${travelHPList}">
					<div class="card">
						<div class="card-img-wrap">
							<a href="/travelDestination/${travel.id}"> <img
								class="card-img" src="${travel.image}" alt="travel.name">
							</a>
						</div>
						<div class="card-body">
							<div class="card-title">${travel.name}</div>
							<div class="card-desc">${travel.sumup}</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 맛집 -->
		<div class="tab-content" id="tab-content-1">
			<div class="kokkok-desc">
				<span class="dot-icon">⋯</span> <span>여행의 즐거움은 입안에서! 필수 맛집 탐방</span>
			</div>
			<div class="card-list">
				<c:forEach var="travel" items="${travelMJList}">
					<div class="card">
						<div class="card-img-wrap">
							<a href="/travelDestination/${travel.id}"> <img
								class="card-img" src="${travel.image}" alt="travel.name">
							</a>
						</div>
						<div class="card-body">
							<div class="card-title">${travel.name}</div>
							<div class="card-desc">${travel.sumup}</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 감성 -->
		<div class="tab-content" id="tab-content-2">
			<div class="kokkok-desc">
				<span class="dot-icon">⋯</span> <span>조용히 머물고 싶은 감성 충전 공간</span>
			</div>
			<div class="card-list">
				<c:forEach var="travel" items="${travelGSList}">
					<div class="card">
						<div class="card-img-wrap">
							<a href="/travelDestination/${travel.id}"> <img
								class="card-img" src="${travel.image}" alt="travel.name">
							</a>
						</div>
						<div class="card-body">
							<div class="card-title">${travel.name}</div>
							<div class="card-desc">${travel.sumup}</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<script>
function selectTab(idx) {
  // 탭 버튼
  const btns = document.querySelectorAll('.kokkok-tab-btn');
  btns.forEach((btn, i) => {
    btn.classList.toggle('active', i === idx);
  });
  // 콘텐츠 show/hide
  const tabContents = document.querySelectorAll('.tab-content');
  tabContents.forEach((cont, i) => {
    cont.classList.toggle('active', i === idx);
  });
}
</script>
</body>
</html>