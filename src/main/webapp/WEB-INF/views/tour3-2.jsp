<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동문시장의 맛있는 이야기</title>
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
        background-image: url('/image/orym_detail.jpg');
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

    .content-header .content-tags {
        color: var(--gray-text);
        font-size: 0.9em;
        margin: 5px 0 0;
    }

    .content-body {
        margin-top: 20px;
        line-height: 1.6;
    }

    .content-body p {
        margin-bottom: 15px;
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
                        <span class="header-title">동문시장의 맛있는 이야기</span>
                    </div>
                    <div class="header-right">
                        <a href="#">☰</a>
                    </div>
                </div>
                
                <div class="main-image-card" style="background-image: url('/image/dong5.jpg');">
                    <div class="audio-controls">
                        <button class="map-button">재생</button>
                    </div>
                </div>
                
                <div class="content-header">
                    <h3 class="content-title">동문시장의 맛있는 이야기</h3>
                </div>
                
                <div class="content-body">
                    <p>제주 향토음식 야무지게 먹기</p>
                    <p>동문시장에서는 제주도의 특산물들을 한꺼번에 만날 수 있는데 특히, 사시사철 시장의 기운을 밝게 만드는 귤과 한라봉이 대표적인 과일입니다. 제주도는 날씨가 따뜻한 편이어서 열대과일의 재배가 가능한데요, 귤에서 품종을 개량한 천혜향이나 황금향, 동남아나 중국에서 볼 수 있는 애플망고, 용과도 재배가 가능해서 시장에서 쉽게 볼 수 있습니다.</p>
                    <p>제주도는 섬이기 때문에 해산물도 유명한데요. 싱싱한 갈치와 옥돔 등 다양한 해산물 구입이 가능합니다. 회 센터에서는 즉석으로 회를 떠주기도 하고 남은 고기로 탕을 끓여주기 때문에 해산물을 좋아한다면 반드시 들러보세요!</p>
                   
                    
               		
                </div>
            </div>
        </div>
    </div>
</body>
</html>