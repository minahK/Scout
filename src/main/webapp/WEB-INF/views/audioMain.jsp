<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오디오 해설</title>
<style>
    :root {
        --light-orange: #ff9752;
        --base-orange: #ee853f;
        --dark-orange: #eb5e00;
        --white: #ffffff;
        --text-color: #333333;
        --gray-text: #666;
    }

    body {
        margin: 0;
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
        background-color: var(--white);
        display: flex;
        height: 100vh;
        color: var(--text-color);
    }

    .main-container {
        display: flex;
        width: 100%;
        background-image: url('/image/mj.jpg');
        background-repeat: no-repeat;
        background-size: cover;
    }

    .left-panel {
        width: 35%;
        background-size: cover;
        background-position: center;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: flex-start;
        padding: 5px;
        box-sizing: border-box;
    }

    .logo-area {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        text-align: left;
        width: 100%;
        color: var(--white);
    }

    .logo-mark {
        width: 200px;
        height: auto;
        object-fit: contain;
    }

    .logo-text {
        font-size: 2.5em;
        font-weight: bold;
        margin-top: 10px;
        color: var(--dark-orange);
    }

    .right-background {
        flex-grow: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 50px;
        box-sizing: border-box;
    }

    .right-panel {
        width: 100%;
        max-width: 700px;
        height: 100%;
        background-color: var(--white);
        border: 10px solid var(--white);
        border-radius: 15px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        padding: 30px;
        box-sizing: border-box;
        overflow-y: auto;
    }

    .header-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-bottom: 5px;
        border-bottom: 1px solid #ddd;
        position: relative;
    }

    .header-logo {
        display: flex;
        align-items: center;
        font-size: 1.5em;
        font-weight: bold;
    }

    .header-logo img {
        width: 40px;
        height: 40px;
        margin-right: 10px;
    }

    .header-menu {
        font-size: 1.2em;
        font-weight: bold;
    }

    .header-menu a {
        text-decoration: none;
        color: var(--text-color);
        margin-left: 20px;
    }

    .language-module {
        position: absolute;
        top: 60px;
        right: 0;
        background-color: var(--white);
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        padding: 10px;
        z-index: 1000;
        width: 150px;
        display: flex;
        flex-direction: column;
        gap: 5px;
    }

    .language-module a {
        display: block;
        padding: 8px;
        text-align: center;
        color: var(--text-color);
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.2s;
        font-weight: normal;
        margin-left: 0;
    }

    .language-module a:hover {
        background-color: #f0f0f0;
    }
    
    .language-module.hidden {
        display: none;
    }

    .title-section {
        display: flex;
        align-items: center;
        margin: 10px 0;
    }

    .title-section img {
        width: 60px;
        height: 60px;
        margin-right: 20px;
    }

    .title-section h2 {
        margin: 0;
        font-size: 1.8em;
        font-weight: bold;
        line-height: 1.4;
    }

    .search-bar {
        display: flex;
        gap: 10px;
        margin-bottom: 30px;
    }

    .search-bar input {
        flex-grow: 1;
        padding: 12px;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 1em;
    }

    .search-bar button {
        padding: 12px 25px;
        border: none;
        background-color: var(--base-orange);
        color: var(--white);
        border-radius: 8px;
        font-size: 1em;
        cursor: pointer;
    }

    .main-image-card {
        width: 100%;
        height: 300px;
        border-radius: 10px;
        margin-bottom: 30px;
        position: relative;
        overflow: hidden;
    }
    
    .slides {
        display: none;
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
    }

    .slides img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border-radius: 10px;
    }

    .info-overlay {
        position: absolute;
        bottom: 20px;
        left: 20px;
        color: var(--white);
        text-shadow: 0 0 5px rgba(0,0,0,0.7);
        z-index: 5;
    }

    .menu-bar {
        display: flex;
        justify-content: space-between;
        gap: 10px;
        margin-bottom: 30px;
    }

    .menu-bar a {
        flex-grow: 1;
        text-align: center;
        padding: 12px;
        text-decoration: none;
        color: var(--gray-text);
        border-bottom: 2px solid transparent;
        transition: all 0.3s ease;
        font-weight: bold;
        cursor: pointer;
    }

    .menu-bar a.active {
        color: var(--base-orange);
        border-bottom-color: var(--base-orange);
    }

    .image-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
    }

    .image-grid.hidden {
        display: none;
    }

    .image-card {
        text-align: center;
    }

    .image-card .card-content {
        display: block;
        text-decoration: none;
        color: black;
    }

    .image-card img {
        width: 100%;
        height: 180px;
        object-fit: cover;
        border-radius: 10px;
    }

    .card-title {
        font-size: 1em;
        font-weight: bold;
        margin-top: 10px;
        width: 100%;
    }

    .card-info {
        font-size: 0.9em;
        color: var(--gray-text);
        margin-top: 5px;
    }

    @media (max-width: 1200px) {
        .main-container {
            flex-direction: column;
        }

        .left-panel, .right-background {
            width: 100%;
            height: auto;
        }

        .right-background {
            padding: 30px;
        }

        .right-panel {
            width: 100%;
            border: none;
            box-shadow: none;
            padding: 0;
        }
    }
</style>
</head>
<body>
<div class="main-container">
    <div class="left-panel">
        <div class="logo-area">
            <img src="https://i.imgur.com/xpGazxz.png" alt="Logo" class="logo-mark">
        </div>
    </div>
    <div class="right-background">
        <div class="right-panel">
            <div class="header-bar">
                <div class="header-logo">제주도</div>
                <div class="header-menu">
                    <a href="#" id="menu-toggle">☰</a>
                    <div id="language-module" class="language-module hidden">
                        <a href="#">한국어</a>
                        <a href="#">English</a>
                        <a href="#">日本語</a>
                        <a href="#">中文</a>
                    </div>
                </div>
            </div>

            <div class="title-section">
                <img src="/image/gyool.png" alt="캐릭터">
                <h2>소리로 듣는 여행, 제주도에서 즐겨보세요!</h2>
            </div>

            <div class="search-bar">
                <input type="text">
                <button>검색</button>
            </div>

            <div class="main-image-card">
                <div class="slides">
                    <img src="/image/ilch.jpg" alt="성산일출봉">
                </div>
                <div class="slides">
                    <img src="/image/hae.jpg" alt="협재해수욕장">
                </div>
                <div class="slides">
                    <img src="/image/back.jpg" alt="한라산 백록담">
                </div>
                
                <div class="info-overlay">
                    <h3 id="overlay-title"></h3>
                    <p id="overlay-info"></p>
                </div>
            </div>

            <div class="menu-bar">
                <a id="places-tab" class="active">장소별</a>
                <a id="new-tab">새로운</a>
            </div>

            <div id="places-grid" class="image-grid">
                <div class="image-card">
                    <a href="/audioMain/tour" class="card-content">
                        <img src="/image/jejuuu.jpg" alt="물영아리오름">
                        <div class="card-title">물영아리오름</div>
                        <div class="card-info">1이야기</div>
                    </a>
                </div>
                <div class="image-card">
                    <a href="/audioMain/tour2" class="card-content">
                        <img src="/image/yong.jpg" alt="용연과 용두암">
                        <div class="card-title">용연과 용두암</div>
                        <div class="card-info">1이야기</div>
                    </a>
                </div>
                <div class="image-card">
                    <a href="/audioMain/tour3" class="card-content">
                        <img src="/image/dong3.jpg" alt="동문시장">
                        <div class="card-title">동문시장</div>
                        <div class="card-info">2이야기</div>
                    </a>
                </div>
            </div>

            <div id="new-grid" class="image-grid hidden">
                <div class="image-card">
                    <a href="/audioMain/tour4" class="card-content">
                        <img src="/image/ini.jpg" alt="이니스프리 제주하우스">
                        <div class="card-title">이니스프리 제주하우스</div>
                        <div class="card-info">1이야기</div>
                    </a>
                </div>
                <div class="image-card">
                    <a href="/audioMain/tour5" class="card-content">
                        <img src="/image/bear.jpg" alt="테디베어 박물관">
                        <div class="card-title">테디베어 박물관</div>
                        <div class="card-info">1이야기</div>
                    </a>
                </div>
                <div class="image-card">
                    <a href="/audioMain/tour6" class="card-content">
                        <img src="/image/choo2.jpg" alt="추사관">
                        <div class="card-title">추사관</div>
                        <div class="card-info">2이야기</div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        // 메뉴 토글 기능
        document.getElementById('menu-toggle').addEventListener('click', (e) => {
            e.preventDefault();
            document.getElementById('language-module').classList.toggle('hidden');
        });

        // 탭 전환 기능
        document.getElementById('places-tab').addEventListener('click', (e) => {
            e.preventDefault();
            document.getElementById('places-tab').classList.add('active');
            document.getElementById('new-tab').classList.remove('active');
            document.getElementById('places-grid').classList.remove('hidden');
            document.getElementById('new-grid').classList.add('hidden');
        });

        document.getElementById('new-tab').addEventListener('click', (e) => {
            e.preventDefault();
            document.getElementById('new-tab').classList.add('active');
            document.getElementById('places-tab').classList.remove('active');
            document.getElementById('new-grid').classList.remove('hidden');
            document.getElementById('places-grid').classList.add('hidden');
        });

        // 슬라이더 관련 JS
        let slideIndex = 0;
        let slideContents = [
            { title: '성산일출봉', info: '#제주여행 #제주동부 #일출명소' },
            { title: '협재해수욕장', info: '#제주서부 #에메랄드빛바다 #협재' },
            { title: '한라산 백록담', info: '#제주중심 #등산 #백록담' }
        ];
        const overlayTitle = document.getElementById('overlay-title');
        const overlayInfo = document.getElementById('overlay-info');
        let slides = document.getElementsByClassName("slides");
        
        function autoSlides() {
            slideIndex++;
            showSlides(slideIndex);
            setTimeout(autoSlides, 3000); // 3초마다 자동 재생
        }

        function showSlides(n) {
            if (n >= slides.length) { slideIndex = 0; }
            if (n < 0) { slideIndex = slides.length - 1; }
            
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";  
            }
            slides[slideIndex].style.display = "block";
            
            // 오버레이 텍스트 업데이트
            if (overlayTitle && overlayInfo) {
                overlayTitle.textContent = slideContents[slideIndex].title;
                overlayInfo.textContent = slideContents[slideIndex].info;
            }
        }
        
        showSlides(slideIndex);
        autoSlides();
    });
</script>
</body>
</html>