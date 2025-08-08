<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추사관</title>
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

    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-bottom: 20px;
        border-bottom: 1px solid #ddd;
    }

    .header-left, .header-right {
        display: flex;
        align-items: center;
        gap: 15px;
    }
    
    .header-left a {
        font-size: 1.5em;
        text-decoration: none;
        color: var(--text-color);
    }
    
    .header-title {
        font-size: 1.2em;
        font-weight: bold;
    }
    
    .header-right a {
        font-size: 1.2em;
        text-decoration: none;
        color: var(--text-color);
        margin-left: 20px;
    }

    .main-image-card {
        width: 100%;
        height: 300px;
        background-image: url('/image/dong3.jpg');
        background-size: cover;
        background-position: center;
        border-radius: 10px;
        margin-bottom: 30px;
        position: relative;
    }

    .audio-controls {
        position: absolute;
        top: 20px;
        right: 20px;
        display: flex;
        gap: 10px;
    }

    .audio-controls button {
        padding: 8px 15px;
        border-radius: 20px;
        border: 1px solid #ccc;
        background-color: var(--white);
        cursor: pointer;
    }

    .content-header {
        margin-top: 20px;
        border-bottom: 1px solid #eee;
        padding-bottom: 10px;
    }

    .content-header .content-title {
        font-size: 1.5em;
        font-weight: bold;
        margin: 0;
    }

    .story-section {
        margin-top: 20px;
    }

    .story-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .story-header .story-count {
        font-size: 1.2em;
        font-weight: bold;
    }

    .story-header .story-buttons button {
        padding: 5px 15px;
        border-radius: 20px;
        border: 1px solid #ccc;
        background-color: var(--white);
        cursor: pointer;
        margin-left: 10px;
    }

    .story-list {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    .story-item {
        display: flex;
        align-items: center;
        gap: 15px;
        padding: 15px;
        border-radius: 10px;
        border: 1px solid #eee;
        transition: background-color 0.2s;
    }

    .story-item:hover {
        background-color: #f9f9f9;
    }

    .story-thumbnail {
        width: 80px;
        height: 80px;
        border-radius: 8px;
        object-fit: cover;
    }

    .story-info {
        flex-grow: 1;
    }

    .story-info .story-title {
        font-weight: bold;
        margin: 0;
    }

    .story-info .story-description {
        font-size: 0.9em;
        color: var(--gray-text);
        margin: 5px 0;
    }

    .story-info .story-playtime {
        font-size: 0.8em;
        color: var(--text-color); /* 이 부분을 수정했습니다. */
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
                <div class="header">
                    <div class="header-left">
                        <a href="javascript:history.back();"><span>&lt;</span></a>
                        <span class="header-title">추사관</span>
                    </div>
                    <div class="header-right">
                        <a href="#">☰</a>
                    </div>
                </div>
                
                <div class="main-image-card" style="background-image: url('/image/choo2.jpg');">
                </div>
                
                <div class="story-section">
                    <div class="story-header">
                        <div class="story-count">이야기 (2)</div>
                        <div class="story-buttons">
                            <button>전체듣기</button>
                            
                        </div>
                    </div>
                    
                    <div class="story-list">
                       
                        <a href="/audioMain/tour6-1" style="text-decoration: none; color: inherit;">
                            <div class="story-item">
                                <img src="/image/choooo.jpg" class="story-thumbnail">
                                <div class="story-info">
                                    <div class="story-title">제주추사관</div>
                                    <div class="story-description">
                                       추사의 예술혼을 만나다, 제주추사관
                                    </div>
                                    <div class="story-playtime">재생시간 03:17</div>
                                </div>
                            </div>
                        </a>

                       <a href="/audioMain/tour6-2" style="text-decoration: none; color: inherit;">
                        <div class="story-item">
                            <img src="/image/chooo.jpg"  class="story-thumbnail">
                            <div class="story-info">
                                <div class="story-title">추사관</div>
                                <div class="story-description">
                                    추사관을 보고 계십니다. 어떤 느낌이 드세요?
                                </div>
                                <div class="story-playtime">재생시간 01:50</div>
                            </div>
                        </div>
                       </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>