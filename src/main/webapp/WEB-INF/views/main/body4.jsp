<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>슬라이드 카드 리스트</title>
<style>
body {
	margin: 0;
	background: #fafbfc;
	font-family: 'Noto Sans KR', sans-serif;
}
.theme-slide-wrap {
	max-width: 1200px;
	margin: 38px auto 0 auto;
	padding: 0 48px;
	box-sizing: border-box;
}
.theme-slide-title {
	font-size: 22px;
	font-weight: 900;
	margin-bottom: 24px;
	margin-top: 18px;
	color: #232323;
	letter-spacing: -0.5px;
}
.theme-slider-area {
	width: 100%;
	display: flex;
	align-items: center;
	position: relative;
	justify-content: center;
}
.theme-slider-btn {
	width: 38px;
	height: 38px;
	border-radius: 50%;
	border: 1.8px solid #aaa;
	background: #fff;
	color: #111;
	font-size: 21px;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	position: absolute;
	top: 43%;
	z-index: 2;
	transition: border 0.15s, color 0.15s, background 0.15s;
	box-shadow: 0 1.5px 12px rgba(80, 110, 160, 0.07);
}
.theme-slider-btn:disabled {
	color: #ddd;
	border: 1.5px solid #eee;
	cursor: default;
	background: #f4f4f4;
}
.theme-slider-btn.prev {
	left: 0;
}
.theme-slider-btn.next {
	right: 0;
}
.theme-slider-outer {
	width: 100%;
	overflow: hidden;
	margin: 0 44px;
	position: relative;
}
.theme-slider-list {
	display: flex;
	gap: 20px;
	flex-wrap: nowrap;       /* 한줄로! */
	justify-content: flex-start;
}
.theme-card {
	width: 234px;
	min-width: 220px;
	background: #fff;
	border-radius: 18px;
	box-shadow: 0 4px 16px rgba(60, 80, 110, 0.10);
	display: flex;
	flex-direction: column;
	margin-bottom: 9px;
	overflow: hidden;
	position: relative;
	transition: box-shadow 0.14s, transform 0.18s cubic-bezier(.33,1.19,.7,1.01);
	flex-shrink: 0;
}
.theme-card-img-wrap {
	width: 100%;
	height: 200px;
	background: #e6edf7;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	overflow: hidden;
}
.theme-card-img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 18px 18px 0 0;
}
.theme-card-title {
	font-size: 16.8px;
	font-weight: 900;
	color: #232323;
	margin: 18px 0 2px 0;
	text-align: left;
	line-height: 1.34;
	padding: 0 15px 0 15px;
	letter-spacing: -0.6px;
}
.theme-card-desc {
	font-size: 14.2px;
	color: #222;
	font-weight: 400;
	margin-bottom: 15px;
	text-align: left;
	padding: 0 15px;
	line-height: 1.42;
}
.theme-slider-controls {
	display: flex;
	align-items: center;
	justify-content: flex-end;
	gap: 8px;
	margin-top: 9px;
	padding-right: 8px;
}
.theme-slider-page {
	font-size: 16px;
	color: #1e1e1e;
	font-weight: 900;
	letter-spacing: 0.6px;
}
.theme-slider-page .total {
	color: #999;
	font-weight: 400;
	margin-left: 1.5px;
}
@media (max-width: 1200px) {
	.theme-slide-wrap {
		max-width: 99vw;
		padding: 0 12px;
	}
	.theme-slider-outer {
		margin: 0 5px;
	}
	.theme-slider-btn.prev {
		left: -12px;
	}
	.theme-slider-btn.next {
		right: -12px;
	}
}
@media (max-width: 900px) {
	.theme-card, .theme-card-img-wrap {
		width: 43vw;
		min-width: 115px;
	}
	.theme-card-img-wrap {
		height: 26vw;
		min-height: 68px;
	}
}
@media (max-width: 650px) {
	.theme-slider-btn.prev {
		left: 0;
	}
	.theme-slider-btn.next {
		right: 0;
	}
	.theme-slide-wrap {
		padding: 0 1vw;
	}
	.theme-card, .theme-card-img-wrap {
		width: 94vw;
		min-width: 90px;
	}
	.theme-card-img-wrap {
		height: 52vw;
		min-height: 52px;
	}
}
</style>
</head>
<body>
	<div class="theme-slide-wrap">
		<div class="theme-slide-title">함께 떠나는 힐링테마 여행</div>
		<div class="theme-slider-area">
			<button class="theme-slider-btn prev" id="prevBtn" disabled>&lt;</button>
			<div class="theme-slider-outer">
				<div class="theme-slider-list" id="sliderList">
					<!-- 카드 샘플, c:forEach 등으로 반복 생성 가능 -->
					<div class="theme-card">
						<div class="theme-card-img-wrap">
							<img class="theme-card-img" src="/resources/image/sample.jpg" alt="1">
						</div>
						<div class="theme-card-title">입안 가득 바다의 맛🌊</div>
						<div class="theme-card-desc">전남 미식 여행 코스 추천</div>
					</div>
					<div class="theme-card">
						<div class="theme-card-img-wrap">
							<img class="theme-card-img" src="/resources/image/sample2.jpg" alt="2">
						</div>
						<div class="theme-card-title">낭만 치사랑 한도 초과🧡</div>
						<div class="theme-card-desc">서울·경기 능소화 명소 4</div>
					</div>
					<div class="theme-card">
						<div class="theme-card-img-wrap">
							<img class="theme-card-img" src="/resources/image/sample3.jpg" alt="3">
						</div>
						<div class="theme-card-title">푸르름이 짙어지는 여름,</div>
						<div class="theme-card-desc">싱그러운 가든 체험 여행</div>
					</div>
					<div class="theme-card">
						<div class="theme-card-img-wrap">
							<img class="theme-card-img" src="/resources/image/sample.jpg" alt="4">
						</div>
						<div class="theme-card-title">놀면서 배우는 여름방학!</div>
						<div class="theme-card-desc">아이랑 가기 좋은 체험 여행지 3</div>
					</div>
					<div class="theme-card">
						<div class="theme-card-img-wrap">
							<img class="theme-card-img" src="/resources/image/sample2.jpg" alt="5">
						</div>
						<div class="theme-card-title">일출 명소부터 짜릿한 체험까지!</div>
						<div class="theme-card-desc">경주에서 보내는 특별한 하루</div>
					</div>
					<div class="theme-card">
						<div class="theme-card-img-wrap">
							<img class="theme-card-img" src="/resources/image/sample3.jpg" alt="6">
						</div>
						<div class="theme-card-title">새로운 감성 여행</div>
						<div class="theme-card-desc">아름다운 시골 풍경</div>
					</div>
					<!-- 필요한 만큼 카드 추가/반복문으로 대체 가능 -->
				</div>
			</div>
			<button class="theme-slider-btn next" id="nextBtn">&gt;</button>
		</div>
		<div class="theme-slider-controls">
			<span class="theme-slider-page" id="sliderPage">1 <span class="total"></span></span>
		</div>
	</div>
<script>
const cardPerPage = 4;
const sliderList = document.getElementById('sliderList');
const cards = Array.from(sliderList.children);
const prevBtn = document.getElementById('prevBtn');
const nextBtn = document.getElementById('nextBtn');
const pageElem = document.getElementById('sliderPage');

let currentPage = 0;
const totalPages = Math.ceil(cards.length / cardPerPage);

function updateSlider() {
    cards.forEach((card, i) => {
        const startIdx = currentPage * cardPerPage;
        card.style.display = (i >= startIdx && i < startIdx + cardPerPage) ? 'flex' : 'none';
    });
    prevBtn.disabled = currentPage === 0;
    nextBtn.disabled = currentPage >= totalPages - 1;
    pageElem.innerHTML = (currentPage + 1) + ' <span class="total">/ ' + totalPages + '</span>';
}
prevBtn.onclick = function() {
    if (currentPage > 0) {
        currentPage--;
        updateSlider();
    }
};
nextBtn.onclick = function() {
    if (currentPage < totalPages - 1) {
        currentPage++;
        updateSlider();
    }
};
updateSlider();
</script>
</body>
</html>