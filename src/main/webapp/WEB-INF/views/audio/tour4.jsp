<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이니스프리 제주하우스</title>
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
                        <span class="header-title">이니스프리 제주하우스</span>
                    </div>
                    <div class="header-right">
                        <a href="#">☰</a>
                    </div>
                </div>
                
                <div class="main-image-card" style="background-image: url('/resources/image/ini.jpg');">
                    <div class="audio-controls">
                        <button class="play-button">재생</button>

                    </div>
                </div>
                
                <div class="content-header">
                    <h3 class="content-title">이니스프리 제주하우스</h3>
                </div>
                
                <div class="content-body">
                    <p>이니스프리 제주하우스는 나란히 자리잡은 3개의 건물 중 가장 개방감이 느껴집니다. 티스톤을 설계한 조민석의 작품인데요, 티스톤을 진한 톤으로 완성했다면 이니스프리 제주하우스는 자연스럽고 밝은 느낌입니다. 너와 지붕을 얹되 제주의 아름다운 햇살이 투영되도록 하였고, 입구의 돌담은 누가 봐도 제주돌집의 담장이 떠오릅니다. 큰 창을 통해 내부와 바깥이 자연스럽게 이어지도록 한 것 역시 건축가의 자연친화적인 성향이 잘 나타나 있습니다.
</p>
                    <p>설계자는 이미 아름다운 서광다원과 곶자왈에 매료되었고, 이를 거스르지 않는 편안하고 조화로운 건물을 만들고자 했습니다. 그리하여 건물이 주인공이 아닌 자연이 주인공이 되도록 완성하였습니다.</p>
                    <p>건축과 설계에서 친환경 공사와 재활용을 기본 원칙으로 삼아 태양광 발전 설비를 하여 태양 에너지원을 사용한 것도 의미가 있습니다.
이곳에서는 제주 식재료로 만든 음료와 음식을 맛보고, 자연 원료의 시향을 통해 이니스프리를 간접 체험하거나 책상에 앉아 직접 비누를 만들어 볼 수도 있습니다. 별 일 없이 잔디마당을 걷기만 해도 행복한 여행이 될 것입니다.</p>
                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>