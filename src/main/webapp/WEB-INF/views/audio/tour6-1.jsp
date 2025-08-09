<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주추사관</title>
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
	font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
		'Helvetica Neue', Arial, sans-serif;
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

@media ( max-width : 1200px) {
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
				<img src="https://i.imgur.com/xpGazxz.png" alt="Logo"
					class="logo-mark">
			</div>
		</div>

		<div class="right-background">
			<div class="right-panel">
				<div class="header">
					<div class="header-left">
						<a href="javascript:history.back();"><span>&lt;</span></a> <span
							class="header-title">제주추사관</span>
					</div>
					<div class="header-right">
						<a href="#">☰</a>
					</div>
				</div>

				<div class="main-image-card"
					style="background-image: url('/resources/image/choooo.jpg');">
					<div class="audio-controls">
						<button class="map-button">재생</button>
					</div>
				</div>

				<div class="content-header">
					<h3 class="content-title">제주추사관</h3>
				</div>

				<div class="content-body">
					<p>추사의 예술혼을 만나다, 제주추사관</p>
					<p>아름다운 절경을 품은 관광도시 제주. 그러나 제주는 조선시대 가장 혹독한 유배의 땅이었습니다. 이 가혹한
						땅에서 추사체를 완성시켰던 추사 김정희. 조선시대 대표학자이자 예술가였던 그의 예술혼의 세계로 안내합니다.</p>
					<p>세도정치에 휘말려 제주로 유배를 왔던 추사 김정희. 그는 이곳에서 학문과 예술에 대한 집념과 끈기로 추사체를
						완성하고, 필생의 역작인 세한도를 남겼습니다. 유배생활동안 마을 청년과 지방 유생들에게 학문과 서예를 가르치고, 다도의
						대가인 초의선사와 평생 우정을 나누었고, 제주에 차 문화를 도입한 선구자였습니다. 추사유배지가 국가사적으로 승격되면서
						2010년 건축가 승효상의 설계로 개관한 제주추사관. 지하1층, 지상1층 규모의 추사관은 지상에 드러나는 건물을
						최소화하고 현무암과 목재를 사용해 제주의 지역성을 담아내고 있습니다</p>
					<p>전시관에서는 제주에서의 유배시절 모습을 그린 해천일립상을 시작으로 서예와 현판, 탁본, 편지글 등 많은
						작품들을 만날 수 있습니다. 추사의 걸작 세한도. 추사에게 귀한 책을 구해다 준 역관 이상적의 인품을 소나무와 잣나무의
						지조에 비유해 그린 일화가 유명합니다.</p>
					<p>추사가 대정향교에 써 준 ‘의문당’ 현판. 전남 강진 다산초당에 걸려 있는 현판 ‘보정산방’ 을 비롯해,
						추사가 제주로 유배오던 중 들렀던 해남 대둔사에 써준 예서체 현판. 유배지에 핀 수선화의 아름다움을 예찬한 시,
						그리움을 담아 부인 예안 이씨에게 쓴 편지글들. 추사가 세상을 떠나기 3일전에 쓴 마지막 작품인 봉은사 판전 현판까지
						주옥같은 작품들이 전시되어 있습니다.추모공간인 추사홀의 여백의 공간은 추사작품의 절제미를 더욱 돋보이게 합니다.</p>
					<p>힘들고 외로웠던 유배지에서의 삶. 그 속에서 추사체를 완성하고, 세한도를 비롯한 수많은 작품들을 남긴 추사
						김정희. 추운 겨울날에도 늘 푸른 소나무처럼 고귀한 절개를 지켜갔던 그의 삶과 정신은 앞으로도 영원히 이어질 것입니다.</p>

				</div>
			</div>
		</div>
	</div>
</body>
</html>