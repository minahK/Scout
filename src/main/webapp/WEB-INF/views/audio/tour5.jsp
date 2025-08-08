<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테디베어 박물관</title>
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
                        <span class="header-title">테디베어 박물관</span>
                    </div>
                    <div class="header-right">
                        <a href="#">☰</a>
                    </div>
                </div>
                
                <div class="main-image-card" style="background-image: url('/resources/image/bear.jpg');">
                    <div class="audio-controls">
                        <button class="play-button">재생</button>

                    </div>
                </div>
                
                <div class="content-header">
                    <h3 class="content-title">테디베어 박물관</h3>
                </div>
                
                <div class="content-body">
                    <p>유리 원뿔이 여행자를 맞이하는 이곳은 테디베어박물관입니다. 2001년에 설립되었는데요, 건립 당시엔 ‘곰인형’ 한 가지로 박물관을 만든다는 것이 상당히 획기적이었습니다. 테디베어박물관은 한류 드라마 올인, 궁 등에 소개되면서 국내외 전역으로 알려졌습니다. 이를 계기로 국내뿐만 아니라 하이난, 청두 등 해외점까지 건립되었습니다.</p>
                    <p>건물은 도로에서 보았을 때 정원과 원뿔 모양 입구만 보입니다. 지상의 구조물을 가급적 최소화하였고, 원뿔 아트리움의 입구는 내부에서 바깥이 최대한 많이 보입니다. 보통의 박물관은 전시물에 집중하도록 핀조명을 쓰는 등 다른 부분을 최소화 하지만, 이 박물관은 유리를 통해 바다를 보며 전시물을 관람합니다.</p>
                    <p>박물관은 역사관, 예술관, 기획전시관, 엘비스 공연, 약 3,000여 평의 야외 조각 공원 등으로 구성되어 있는데요, 실내 전시를 보면서 자연스럽게 외부로 나가 테디가든을 둘러볼 수 있도록 동선이 편안합니다.
</p>
                    <p>전시물은 세계 각국에서 공을 들여 수집한 앤틱 테디베어와 국내외 유명 아티스트의 작품입니다. 이들은 하나하나가 스토리를 가지고 있기 때문에 단지 곰인형을 보는 것이 아니라 이를 통해 세계를 여행하고, 역사와 여러 인물들을 만나게 됩니다.</p>
                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>