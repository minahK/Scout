<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	color: #224291;
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
				<div class="card">
					<div class="card-img-wrap">
						<img class="card-img"
							src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80"
							alt="성산일출봉">
					</div>
					<div class="card-body">
						<div class="card-title">성산일출봉</div>
						<div class="card-desc">제주의 상징, 바다 위 분화구와 아름다운 일출</div>
					</div>
				</div>
				<div class="card">
					<div class="card-img-wrap">
						<img class="card-img"
							src="https://images.unsplash.com/photo-1444065381814-865dc9da92c0?auto=format&fit=crop&w=400&q=80"
							alt="한라산">
					</div>
					<div class="card-body">
						<div class="card-title">한라산</div>
						<div class="card-desc">대한민국 최고봉, 사계절 색다른 매력의 산</div>
					</div>
				</div>
				<div class="card">
					<div class="card-img-wrap">
						<img class="card-img"
							src="https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=400&q=80"
							alt="협재해수욕장">
					</div>
					<div class="card-body">
						<div class="card-title">협재해수욕장</div>
						<div class="card-desc">에메랄드빛 바다와 하얀 백사장, 제주 바다의 대명사</div>
					</div>
				</div>
				<div class="card">
					<div class="card-img-wrap">
						<img class="card-img"
							src="https://images.unsplash.com/photo-1502082553048-f009c37129b9?auto=format&fit=crop&w=400&q=80"
							alt="만장굴">
					</div>
					<div class="card-body">
						<div class="card-title">만장굴</div>
						<div class="card-desc">세계에서 가장 긴 용암동굴, 신비로운 지하 세계</div>
					</div>
				</div>
				<div class="card">
					<div class="card-img-wrap">
						<img class="card-img"
							src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=400&q=80"
							alt="새별오름">
					</div>
					<div class="card-body">
						<div class="card-title">새별오름</div>
						<div class="card-desc">억새와 초원이 펼쳐진 제주의 오름, 트레킹 명소</div>
					</div>
				</div>
				<div class="card">
					<div class="card-img-wrap">
						<img class="card-img"
							src="https://images.unsplash.com/photo-1501594907352-04cda38ebc29?auto=format&fit=crop&w=400&q=80"
							alt="우도">
					</div>
					<div class="card-body">
						<div class="card-title">우도</div>
						<div class="card-desc">땅콩아이스크림, 해수욕장, 일주도로가 유명한 소섬</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 맛집 -->
		<div class="tab-content" id="tab-content-1">
			<div class="kokkok-desc">
				<span class="dot-icon">⋯</span> <span>여행의 즐거움은 입안에서! 필수 맛집 탐방</span>
			</div>
			<div class="card-list">
				<div class="card">
					<div class="card-img-wrap">
						<img class="card-img"
							src="https://images.unsplash.com/photo-1519864342066-d4a1806a146d?auto=format&fit=crop&w=400&q=80"
							alt="네거리식당">
					</div>
					<div class="card-body">
						<div class="card-title">네거리식당</div>
						<div class="card-desc">제주 흑돼지 근고기구이, 줄 서서 먹는 제주 대표 고기집</div>
					</div>
				</div>
				<div class="card">
					<div class="card-img-wrap">
						<img class="card-img"
							src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80"
							alt="삼대국수회관">
					</div>
					<div class="card-body">
						<div class="card-title">삼대국수회관</div>
						<div class="card-desc">고기국수의 원조, 진한 육수와 부드러운 면발의 명가</div>
					</div>
				</div>
				<div class="card">
					<div class="card-img-wrap">
						<img class="card-img"
							src="https://images.unsplash.com/photo-1464306076886-debca5e8a6b0?auto=format&fit=crop&w=400&q=80"
							alt="동문시장 오메기떡">
					</div>
					<div class="card-body">
						<div class="card-title">동문시장 오메기떡</div>
						<div class="card-desc">제주 전통 오메기떡, 선물로도 인기 많은 떡집</div>
					</div>
				</div>
				<div class="card">
					<div class="card-img-wrap">
						<img class="card-img"
							src="https://images.unsplash.com/photo-1467003909585-2f8a72700288?auto=format&fit=crop&w=400&q=80"
							alt="우진해장국">
					</div>
					<div class="card-body">
						<div class="card-title">우진해장국</div>
						<div class="card-desc">고사리해장국의 명가, 제주도 해장국 맛집 1위</div>
					</div>
				</div>
				<div class="card">
					<div class="card-img-wrap">
						<img class="card-img"
							src="https://images.unsplash.com/photo-1432139555190-58524dae6a55?auto=format&fit=crop&w=400&q=80"
							alt="돈사돈">
					</div>
					<div class="card-body">
						<div class="card-title">돈사돈</div>
						<div class="card-desc">참숯에 구운 제주 흑돼지, 고기맛의 끝판왕</div>
					</div>
				</div>
				<div class="card">
					<div class="card-img-wrap">
						<img class="card-img"
							src="https://images.unsplash.com/photo-1470337458703-46ad1756a187?auto=format&fit=crop&w=400&q=80"
							alt="미풍해장국">
					</div>
					<div class="card-body">
						<div class="card-title">미풍해장국</div>
						<div class="card-desc">해물해장국, 현지인과 관광객 모두 사랑하는 해장 맛집</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 감성 -->
		<div class="tab-content" id="tab-content-2">
			<div class="kokkok-desc">
				<span class="dot-icon">⋯</span> <span>조용히 머물고 싶은 감성 충전 공간</span>
			</div>
			<div class="card-list">
				<div class="card">
					<div class="card-img-wrap">
						<img class="card-img"
							src="https://images.unsplash.com/photo-1502082553048-f009c37129b9?auto=format&fit=crop&w=400&q=80"
							alt="황리단길">
					</div>
					<div class="card-body">
						<div class="card-title">경주 황리단길 감성카페</div>
						<div class="card-desc">고즈넉한 한옥골목에서 만나는 트렌디한 감성카페!</div>
					</div>
				</div>
				<div class="card">
					<div class="card-img-wrap">
						<img class="card-img"
							src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80"
							alt="춘천 소양강">
					</div>
					<div class="card-body">
						<div class="card-title">춘천 소양강 스카이워크</div>
						<div class="card-desc">투명 유리 위에서 즐기는 스릴과 낭만!</div>
					</div>
				</div>
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