<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>메인 슬라이드 UI</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap" rel="stylesheet">
<style>
body {
    margin: 0;
    font-family: 'Noto Sans KR', sans-serif;
    background: #fff;
}

.visual-bg {
    width: 100vw;
    min-height: 440px;
    background: #ff9752;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: background-color 0.8s ease; 
}

.visual-section {
    max-width: 1260px;
    width: 100%;
    margin: 0 auto;
    min-height: 440px;
    display: flex;
    align-items: stretch;
    justify-content: space-between;
    position: relative;
    background: transparent;
    overflow: hidden;
}

/* 왼쪽 텍스트 */
.visual-left {
    flex: 1.1;
    padding: 60px 0 40px 96px;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: flex-start;
    min-width: 410px;
}
.text-wrapper {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    transition: opacity 0.8s ease;
    opacity: 1;
}
.text-wrapper.fade-out { opacity: 0; }

.badge {
    background: #191919;
    color: #fff;
    border-radius: 15px;
    display: inline-block;
    font-size: 17px;
    font-weight: 700;
    padding: 8px 22px 8px 14px;
    margin-bottom: 28px;
    margin-top: 8px;
    letter-spacing: .01em;
}

.visual-title {
    font-size: 36px;
    font-weight: 900;
    color: #222;
    margin: 0 0 18px 0;
    line-height: 1.32;
    letter-spacing: -1.4px;
}

.more {
    color: #222;
    text-decoration: underline;
    font-size: 17px;
    margin-top: 13px;
    font-weight: 800;
    cursor: pointer;
    display: inline-block;
    text-decoration: none;
    transition: color 0.13s;
}
.more:hover { color: #eb5e00; }

/* 컨트롤러 */
.visual-controls {
    width: 100%;
    padding-top: 46px;
    display: flex;
    align-items: center;
    justify-content: flex-start;
    gap: 18px;
}

/* 진행 바 */
.bar {
    display: inline-block;
    width: 140px;
    height: 2px;
    background: #bde1ef;
    margin-right: 24px;
    position: relative;
    overflow: hidden;
    border-radius: 2px;
}
.bar-fill {
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 0%;
    background: #000000;
    transition: width linear;
}

.slide-page {
    font-size: 18px;
    font-weight: 700;
    color: #23272b;
    display: flex;
    align-items: baseline;
    gap: 2px;
    margin-right: 16px;
}
.slide-current { font-size: 19px; font-weight: 900; }
.slide-total, .slash { font-size: 16px; font-weight: 400; }

.ctrl-btn {
    background: none;
    border: none;
    color: #222;
    font-size: 22px;
    font-weight: 700;
    margin: 0 6px;
    padding: 3px 9px;
    border-radius: 7px;
    cursor: pointer;
    transition: background 0.14s;
    line-height: 1;
}
.ctrl-btn:active, .ctrl-btn:focus { background: #eaf7fd; }

/* 이미지 페이드 */
.visual-right {
    flex: 1.3;
    display: flex;
    align-items: center;
    justify-content: flex-end;
    min-width: 480px;
    padding: 44px 52px 0 0;
    position: relative;
}
.visual-right img {
    width: 510px;
    height: 320px;
    border-radius: 26px;
    object-fit: cover;
    box-shadow: 0 8px 40px 0 rgba(80, 90, 110, 0.10);
    background: #eee;
    z-index: 2;
    max-width: 100%;
    transition: opacity 0.8s ease;
    opacity: 1;
}
.visual-right img.fade-out { opacity: 0; }

@media (max-width:1150px) {
    .visual-section { flex-direction: column; }
    .visual-left, .visual-right { padding: 0; align-items: center; text-align: center; }
    .visual-right img { width: 90vw; height: auto; }
    .bar { width: 70px; margin-right: 10px; }
}
</style>
</head>
<body>
<div class="visual-bg">
    <div class="visual-section">
        <div class="visual-left">
            <div class="text-wrapper" id="text-wrapper">
                <div class="badge" id="slide-badge">걸출한 일출 포인트</div>
                <div class="visual-title" id="slide-title">제주의 심장을 품은 산,<br>성산일출봉</div>
                <a class="more" href="#" id="slide-link">자세히 보기</a>
            </div>

            <!-- 컨트롤러 -->
            <div class="visual-controls">
                <div class="bar"><div class="bar-fill" id="bar-fill"></div></div>
                <div class="slide-page">
                    <span class="slide-current" id="slide-current">01</span>
                    <span class="slash">/</span>
                    <span class="slide-total" id="slide-total">03</span>
                </div>
                <button class="ctrl-btn prev" onclick="prevSlide()">&lt;</button>
                <button class="ctrl-btn pause" id="pauseBtn" onclick="toggleAutoSlide()">&#10073;&#10073;</button>
                <button class="ctrl-btn next" onclick="nextSlide()">&gt;</button>
            </div>
        </div>

        <div class="visual-right">
            <img id="slide-image" src="/resources/image/Seongsan.jpg" alt="슬라이드 이미지">
        </div>
    </div>
</div>

<script>
const slides = [
	  {
	    img: '/resources/image/Seongsan.jpg',
	    badge: '걸출한 일출 포인트',
	    title: '제주의 심장을 품은 산,<br>성산일출봉',
	    link: '/travelDestination/1',
	    bg: '#f7d49c'  // 배경색
	  },
	  {
	    img: '/resources/image/Olle.jpg',
	    badge: '서귀포 최대 전통시장',
	    title: '제주 감성 듬뿍, 따뜻한 시장골목<br>서귀포매일올레시장',
	    link: '/travelDestination/5',
	    bg: '#a4b9f1'
	  },
	  {
	    img: '/resources/image/Olleroad.jpg',
	    badge: '힐링 트레킹 코스',
	    title: '제주의 푸른 길을 따라<br>올레길 걷기 여행',
	    link: '#',
	    bg: '#9ccba0'
	  }
	];

let currentIndex = 0;
let slideDuration = 5000; // 5초
let autoSlideInterval = setInterval(nextSlide, slideDuration);
let isPaused = false;

const imgEl = document.getElementById('slide-image');
const textWrapper = document.getElementById('text-wrapper');
const barFill = document.getElementById('bar-fill');
const bgEl = document.querySelector('.visual-bg');
const headerEl = document.querySelector('.top-nav'); // 헤더 선택

// 진행바 업데이트 (부드럽게 이동)
function updateBar() {
  const progress = ((currentIndex + 1) / slides.length) * 100;
  barFill.style.transition = 'width 0.6s ease'; // 0.6초 부드럽게 이동
  barFill.style.width = progress + '%';
}

function showSlide(index) {
	  const slide = slides[index];

	  imgEl.classList.add('fade-out');
	  textWrapper.classList.add('fade-out');

	  setTimeout(() => {
	    imgEl.src = slide.img;
	    document.getElementById('slide-badge').innerText = slide.badge;
	    document.getElementById('slide-title').innerHTML = slide.title;
	    document.getElementById('slide-link').href = slide.link;
	    document.getElementById('slide-current').innerText = (index + 1).toString().padStart(2, '0');
	    document.getElementById('slide-total').innerText = slides.length.toString().padStart(2, '0');

	    // 🔹 배경색 부드럽게 전환
	    bgEl.style.backgroundColor = slide.bg;
	    headerEl.style.backgroundColor = slide.bg;  // 🔹 헤더 색도 같이 변경

	    imgEl.classList.remove('fade-out');
	    textWrapper.classList.remove('fade-out');

	    updateBar();
	  }, 400);
	}

function nextSlide() {
  currentIndex = (currentIndex + 1) % slides.length;
  showSlide(currentIndex);
}
function prevSlide() {
  currentIndex = (currentIndex - 1 + slides.length) % slides.length;
  showSlide(currentIndex);
}
function toggleAutoSlide() {
  const btn = document.getElementById('pauseBtn');
  if (isPaused) {
    autoSlideInterval = setInterval(nextSlide, slideDuration);
    btn.innerHTML = '&#10073;&#10073;';
    isPaused = false;
  } else {
    clearInterval(autoSlideInterval);
    btn.innerHTML = '&#9658;';
    isPaused = true;
  }
}

showSlide(currentIndex);
</script>
</body>
</html>