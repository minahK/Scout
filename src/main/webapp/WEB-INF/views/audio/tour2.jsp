<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>용연과 용두암</title>
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
        background-image: url('/resources/image/mj.jpg');
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
        background-image: url('/resources/image/orym_detail.jpg');
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
                        <span class="header-title">용연과 용두암</span>
                    </div>
                    <div class="header-right">
                        <a href="#">☰</a>
                    </div>
                </div>
                
                <div class="main-image-card" style="background-image: url('/resources/image/yong.jpg');">
                    <div class="audio-controls">
                        <button class="map-button">재생</button>
                    </div>
                </div>
                
                <div class="content-header">
                    <h3 class="content-title">용연과 용두암</h3>
                </div>
                
                <div class="content-body">
                    <p>용의 전설을 품다, 용연과 용두암</p>
                    <p>신비로운 용이숨어 있다는 전설을 간직한 용연, 용이 머리를 쳐들고 하늘로 솟아오르는 형상인 용두암, 용연과 용두암... 용의 전설을 간직한 제주 최고의 경승지가 아닐 수 없습니다~!</p>
                    <p>여름철 달밤, 용연에서의 뱃놀이 모습이 아름다워, 용연야범이라 불리며, 영주십이경 중 하나로 꼽혔던 용연, 용담동 해안에 위치한 하류계곡에 있는 연못으로, 지하수가 풍부하게 솟는 곳인데요. 계곡을 이루는 물줄기는 바다로 이어지고 있습니다.약 8m 높이로 드러나 있는 암벽은 가뭄이 들면, 기우제를 지냈던 곳이며, 취병담, 또는 선유담이라고 하여 시인과 선비들이 기암병풍 사이의 맑은 물에 비친달밤에배를 띄워 풍류를 즐겼었는데요. 제주목사가 교체될 때마다 잔치를 베풀었던 장소이기도 합니다. 용의 놀이터였다는 용연에서는, 요즘도 해마다 여름이 되면, 용연의 아름다움을 노래하는 용연야범 축제가 마련되고 있습니다!</p>
                    <p>맑은 날에는 목동의 노래처럼 청명하고, 비나 안개가 낀 날에는 신비롭고 몽환적인 분위기를 자아내는 물영아리오름은 늑대소년 '철수'와 조금 닮아 있습니다. 겉모습은 평범하지만, 어딘가 낯설고 특별한 기운을 지닌 '철수'. 순수하면서도 거칠고, 이질적이지만 아름다운 늑대소년의 이야기에 이보다 더 잘 어울리는 무대는 없었을 것입니다.</p>
                    <p>용두암이 있는 해안도로 주변에는 횟집과 카페들이 즐비해 있는데요. 젊은이들의 데이트 장소로 사랑받고 있습니다. 특히 밤바다를 밝히는 어선들의 불빛이 환상적인데요. 애월읍까지 이어지는 해안도로는 드라이브 코스로도 더할 나위 없습니다.</p>
               		<p>용의 전설을 간직한 아름다운 경승지 용연과 용두암, 제주를 거쳐가는 이들이라면, 꼭 한 번 가봐야 할 관광지입니다</p> 
                </div>
            </div>
        </div>
    </div>
</body>
</html>