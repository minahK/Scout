<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물영아리오름</title>
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
                        <span class="header-title">물영아리오름</span>
                    </div>
                    <div class="header-right">
                        <a href="#">☰</a>
                    </div>
                </div>
                
                <div class="main-image-card" style="background-image: url('/image/jejuuu.jpg');">
                    <div class="audio-controls">
                        <button class="play-button">재생</button>

                    </div>
                </div>
                
                <div class="content-header">
                    <h3 class="content-title">물영아리오름</h3>
                </div>
                
                <div class="content-body">
                    <p>깊은 마음의 안식처, 물영아리오름</p>
                    <p>문화 여행에 오신 여러분, 환영합니다! 이번 문화여행의 주인공은 신비로운 기운을 품은 동편적인 산, 제주 물영아리오름 이야기입니다.</p>
                    <p>물영아리오름은 ‘물의 수호신’이 머문다는 전설이 있는 곳입니다. '신령스러운 산'이라는 뜻의 영아리와 분화구에 물이 고인 습지를 품고 있다는 특징이 더해져 물영아리오름이 되었죠. 넓은 초원과 울창한 숲길이 어우러진 이곳은 영화 '늑대소년'의 촬영지이면서도 신비로운 풍경을 자랑합니다.</p>
                    <p>맑은 날에는 목동의 노래처럼 청명하고, 비나 안개가 낀 날에는 신비롭고 몽환적인 분위기를 자아내는 물영아리오름은 늑대소년 '철수'와 조금 닮아 있습니다. 겉모습은 평범하지만, 어딘가 낯설고 특별한 기운을 지닌 '철수'. 순수하면서도 거칠고, 이질적이지만 아름다운 늑대소년의 이야기에 이보다 더 잘 어울리는 무대는 없었을 것입니다.</p>
                    <p>물영아리오름의 넓은 초원 위에는 '순이'와 '철수'가 동네 아이들과 함께 공을 던지고 뛰어노는 순수한 장면이 펼쳐졌습니다. 그리고 숲길을 따라 난 색달래길에서는 두 사람의 이별이, 안개처럼 조용히 스며들었습니다.</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>