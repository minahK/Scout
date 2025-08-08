<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							class="header-title">추사관</span>
					</div>
					<div class="header-right">
						<a href="#">☰</a>
					</div>
				</div>

				<div class="main-image-card"
					style="background-image: url('/image/chooo.jpg');">
					<div class="audio-controls">
						<button class="map-button">재생</button>
					</div>
				</div>

				<div class="content-header">
					<h3 class="content-title">추사관</h3>
				</div>

				<div class="content-body">
					<p>추사관을 보고 계십니다. 어떤 느낌이 드세요? 단순한 삼각형 모양의 지붕에 동그란 창문 하나가 너무
						밋밋한가요? 심플하고 현대적인가요? 이것은 건축가 승효상이 김정희 선생의 세한도(歲寒圖)를 바탕으로 완성하였는데요,
						2010년 완공 당시에는 투박한 외관 때문에 마을 주민들이 ‘감자창고’라 불렀다고도 합니다. 그런데 시간이 갈수록
						오히려 세련된 느낌이 드는 것은 생각할 거리를 남기는 단순함과 여백 때문이지 않을까 싶습니다.</p>
					<p>역시 설계가 훌륭합니다. 이 건물의 모티브가 된 것은 추사 김정희 선생의 대표작인 세한도(歲寒圖)입니다.
						세한도(歲寒圖)는 추사 선생이 책을 보내준 이상적에게 그려준 것으로 이상적은 이를 중국으로 가지고 갔고, 그림에 대한
						찬사의 글이 덧붙여져서 돌아올 정도로 당대에 인정받은 역작입니다.</p>
					<p>추사관은 전시실이 지하 1,2층에 있고, 추념의 공간인 추사홀이 지상과 지하를 이어주도록 되어 있습니다.
						이곳에는 임옥상이 조각한 추사 선생의 흉상을 모시고 나머지 공간은 비워 두었습니다.</p>
					<p>바깥으로 나오면 추사 김선생 적려유허비(秋史 金先生 謫廬遺墟碑) 가 있는데요, 이것은 추사관을 짓기 전부터
						이 자리를 지키고 있던 것입니다. 뒷편에는 추사 선생이 지내셨던 강도순의 집이 있습니다. 4.3사건 때 화재로 소실된
						옛 집을 증손자의 도움을 얻어 복원했다고 합니다.</p>


				</div>
			</div>
		</div>
	</div>
</body>
</html>