<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer class="footer-section">
	<div class="footer-top-row">
		<!-- 1번째 카드: 오디(Odii) -->
		<div class="footer-link-card purple" onClick="location.href='audioMain'">
			<span class="footer-link-emoji">🎧</span>
			<div>
				<div class="footer-link-title">스카우트 (Scout)</div>
				<div class="footer-link-desc">제주도 관광지 오디오 해설</div>
			</div>
		</div>
		<!-- 2번째 카드: 관광정보 -->
		<div class="footer-link-card blue" onClick="location.href='reportMain'">
			<span class="footer-link-emoji">💻</span>
			<div>
				<div class="footer-link-title">관광정보</div>
				<div class="footer-link-desc">수정/신규 요청</div>
			</div>
		</div>
		<!-- 3번째 카드: 관광안내 -->
		<div class="footer-link-card yellow" onClick="location.href='chatMain'">
			<span class="footer-link-emoji">☎️</span>
			<div>
				<div class="footer-link-title">
					실시간 채팅 상담<br> <span
						style="color: #159c3f; font-weight: 900; font-size: 18px;">제주도
						관광안내</span>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="footer-middle-row">
		<a href="https://www.human.or.kr/use/privacy.php">개인정보처리방침</a>
		<a href="https://www.human.or.kr/use/service.php">이용약관</a>
		<a href="https://map.naver.com/p/search/%ED%9C%B4%EB%A8%BC%EA%B5%90%EC%9C%A1%EC%84%BC%ED%84%B0%20%EC%B2%9C%EC%95%88/place/38660169?placePath=/home?entry=pll&from=map&fromNxList=true&fromPanelNum=2&timestamp=202508051216&locale=ko&svcName=map_pcv5&searchText=%ED%9C%B4%EB%A8%BC%EA%B5%90%EC%9C%A1%EC%84%BC%ED%84%B0%20%EC%B2%9C%EC%95%88&searchType=place&c=15.00,0,0,0,dh">사이트맵</a>
	</div>
	<div class="footer-bottom-row">우)26464 충청남도 천안시 동남구 대흥동 134
		10&nbsp;&nbsp;&nbsp; TEL : 041-561-1122&nbsp;&nbsp;&nbsp;대표전화 : 1566-9564 &nbsp;&nbsp;&nbsp; 사업자등록번호 667-81-02135&nbsp;&nbsp;&nbsp;
		<br>ⓒ 2022 휴먼교육센터. All Rights Reserved Designed & managed by scout team</div>
</footer>

<style>
.footer-section {
	margin-top: 40px;
	padding-bottom: 20px;
	background: #fff;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
	color: #333;
	padding-left: 150px;
	padding-right: 150px;
}

.footer-top-row {
	display: flex;
	gap: 10px;
	justify-content: center;
	align-items: flex-start;
	margin: 0 auto 10px auto;

	/* max-width: 1150px;
  padding: 0 30px; */
}

.footer-link-card {
	display: flex;
	align-items: center;
	gap: 11px;
	 /* min-width:162px;  <-- 삭제 */
  	width: fit-content;
	padding: 14px 19px 11px 14px;
	border-radius: 8px;
	font-weight: 700;
	background: #eee;
	font-size: 16px;
	box-shadow: 0 1.5px 9px rgba(110, 120, 170, 0.06);
	flex: 0 0 auto;
}

.footer-link-card .footer-link-emoji {
	font-size: 32px;
	margin-right: 4px;
}

.footer-link-title {
	font-size: 17px;
	font-weight: 900;
	color: #2a225b;
	margin-bottom: 1px;
	line-height: 1.1;
}

.footer-link-desc {
	font-size: 13.7px;
	font-weight: 500;
	color: #5c546a;
}

.footer-link-card.purple {
	background: #eee1fa;
	border: 1.5px solid #c3a3e2;
}

.footer-link-card.purple:hover {
	cursor: pointer;
}

.footer-link-card.yellow {
	background: #fff2d9;
	border: 1.5px solid #e1c98a;
}

.footer-link-card.yellow:hover {
	cursor: pointer;
}

.footer-link-card.blue {
	background: #e8f2fe;
	border: 1.5px solid #8bb2e9;
}

.footer-link-card.blue:hover {
	cursor: pointer;
}

.footer-middle-row {
	margin: 14px auto 6px auto;
	/*  max-width: 1150px;
  padding: 0 30px; */
	color: #6b6b6b;
	font-size: 14px;
	display: flex;
	flex-wrap: wrap;
	gap: 12px;
}

.footer-middle-row a {
	color: #4070b3;
	text-decoration: none;
	font-weight: 500;
	margin-right: 3px;
	transition: color 0.13s;
}

.footer-middle-row a:hover {
	color: #243388;
	text-decoration: underline;
}

.footer-bottom-row {
	margin: 0 auto;
	/* max-width: 1150px;
  padding: 0 30px; */
	color: #898989;
	font-size: 14px;
	word-break: keep-all;
	line-height: 1.7;
}

@media ( max-width : 1000px) {
	.footer-top-row {
		flex-wrap: wrap;
		gap: 10px;
	}
	.footer-link-card {
		min-width: 120px;
		font-size: 14px;
	}
}

@media ( max-width : 800px) {
	.footer-section {
		font-size: 13.5px;
	}
	.footer-top-row, .footer-middle-row, .footer-bottom-row {
		max-width: 99vw;
		padding: 0 5vw;
	}
	.footer-top-row {
		flex-direction: column;
		gap: 7px;
	}
	.footer-link-card {
		width: 100%;
		min-width: 0;
	}
}
</style>