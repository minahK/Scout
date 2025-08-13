<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>커뮤니티</title>
<style>
:root {
	--color-light: #ff9752;
	--color-base: #ee853f;
	--color-dark: #eb5e00;
	--border: #ddd;
	--bg: #f5f8fa;
}

* {
	box-sizing: border-box
}

body {
	font-family: Arial, sans-serif;
	background: var(--bg);
	margin: 0
}

.layout {
	display: grid;
	grid-template-columns: 260px 1fr 300px;
	min-height: 100vh;
}

.main {
	padding: 0;
	background: #fff;
}

.rightbar {
	background: #f7fafc;
	border-left: 1px solid #e6ecf0;
	padding: 20px;
}

.sidebar {
	background: #fff;
	border-right: 1px solid var(--border);
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	padding: 16px 12px;
	position: sticky;
	top: 0;
	height: 100vh;
}

.sidebar-logo {
	text-align: center;
	margin-bottom: 15px
}

.sidebar-logo img {
	width: 90%
}

.sidebar ul {
	list-style: none;
	margin: 16px 0 0;
	padding: 0
}

.sidebar ul li {
	margin-bottom: 8px
}

.sidebar a {
	display: block;
	padding: 10px 14px;
	border-radius: 999px;
	text-decoration: none;
	color: #222;
	font-weight: bold;
}

.sidebar a:hover {
	background: #f3f3f3
}

.sidebar a.active {
	background: #dfeee6;
}

.sidebar-bottom {
	border-top: 1px solid var(--border);
	padding-top: 12px
}

.sidebar-profile {
	display: flex;
	align-items: center;
	gap: 10px
}

.avatar-initial {
	width: 38px;
	height: 38px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: 700;
	background: #eee;
	color: #444;
	border: 1px solid var(--border);
}

.community-header {
	position: sticky;
	top: 0;
	z-index: 50;
	background: #fff;
	border-bottom: 1px solid #ddd;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 12px 20px;
}

.community-header h2 {
	margin: 0;
	font-size: 20px;
}

.icon-btn {
	background: none;
	border: none;
	cursor: pointer;
	padding: 4px;
}

.icon-btn img {
	width: 28px;
	height: 28px;
}

.filters {
	display: flex;
	gap: 10px;
	padding: 12px 20px;
	border-bottom: 1px solid #eee;
	background: #fff;
}

.chip {
	padding: 8px 14px;
	border-radius: 999px;
	background: #fff;
	border: 1px solid var(--border);
	font-size: 14px;
	text-decoration: none;
	color: #222;
}

.chip.active, .chip:hover {
	background: var(--color-light);
	border-color: var(--color-light);
	color: #fff;
}

.community-box {
	background: #fff;
	padding: 16px;
	border-bottom: 1px solid #eee;
}

.community-box h3 {
	margin: 0 0 4px 0;
}

.community-box p {
	margin: 0 0 6px 0;
	color: #555;
}

.widget {
	background: #fff;
	border: 1px solid #e6ecf0;
	border-radius: 12px;
	padding: 14px 16px;
	margin-bottom: 16px;
}

.widget h4 {
	margin: 0 0 10px 0;
	font-size: 16px;
	font-weight: 700;
	color: #222;
}

.widget ul {
	list-style: none;
	padding: 0px;
}

.trend-item {
	margin: 8px 0;
}

.trend-item a {
	color: #111;
	text-decoration: none;
	font-weight: 700;
}

.trend-more {
	display: inline-block;
	margin-top: 8px;
	font-size: 14px;
	color: var(--color-dark);
	text-decoration: underline;
}

.follow-list {
	display: flex;
	flex-direction: column;
	gap: 12px;
}

.follow-item {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.follow-left {
	display: flex;
	align-items: center;
	gap: 10px;
	min-width: 0;
}

.follow-name {
	font-weight: 700;
	color: #222;
	line-height: 1.2;
}

.follow-handle {
	font-size: 12px;
	color: #657786;
}

.follow-btn {
	border: none;
	border-radius: 20px;
	padding: 6px 12px;
	cursor: pointer;
	font-weight: 700;
	color: #fff;
	background: var(--color-base);
}

.follow-btn:hover {
	background: var(--color-dark);
}

.modal-backdrop {
	display: none;
	position: fixed;
	inset: 0;
	background: rgba(0, 0, 0, .4);
	align-items: center;
	justify-content: center;
	z-index: 1000;
}

.modal {
	width: 400px;
	max-width: 90%;
	background: #fff;
	border-radius: 12px;
	border: 1px solid #e6ecf0;
	padding: 16px;
}

.modal h3 {
	margin: 0 0 10px 0;
}

.modal input, .modal textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 6px;
}

.modal .actions {
	text-align: right;
}

.btn {
	padding: 8px 14px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
}

.btn.cancel {
	background: #eee;
}

.btn.primary {
	background: var(--color-dark);
	color: #fff;
}

.btn.primary:hover {
	background: var(--color-base);
}
</style>
</head>
<body>
	<div class="layout">
		<div class="sidebar">
			<div>
				<div class="sidebar-logo">
					<a href="${ctx}/"><img src="https://i.imgur.com/xpGazxz.png" alt="Logo" /></a>
				</div>
				<ul>
					<li><a href="${pageContext.request.contextPath}/community/main">🏠 홈</a></li>
					<li><a href="${pageContext.request.contextPath}/community/search">🔍 검색</a></li>
					<li><a href="${pageContext.request.contextPath}/community/notifications">🔔 알림</a></li>
					<li><a href="${pageContext.request.contextPath}/community/messages">✉️ 채팅</a></li>
					<li><a class="active" href="${pageContext.request.contextPath}/community/communities">👥 커뮤니티</a></li>
					<li><a href="${pageContext.request.contextPath}/community/profile">🧑‍ 프로필</a></li>
					<li><a href="${pageContext.request.contextPath}/community/settings/account">⚙️ 설정</a></li>
				</ul>
			</div>
		</div>

		<main class="main">
			<div class="community-header">
				<h2>커뮤니티</h2>
				<button id="createCommunityBtn" class="icon-btn" title="새 커뮤니티 만들기">➕</button>
			</div>

			<div class="filters">
				<a class="chip active" href="#">전체</a> <a class="chip"
					href="">문화</a> <a class="chip" href="">운동</a>
				<a class="chip" href="">여행</a>
			</div>

			<c:forEach var="community" items="${communityList}">
				<div class="community-box">
					<h3>${community.name}</h3>
					<p>${community.description}</p>
					<small>생성일: ${community.createdAt}</small>
				</div>
			</c:forEach>
		</main>

		<aside class="rightbar">
			<section class="widget">
				<h4>실시간 트렌드</h4>
				<ul>
					<c:forEach var="trend" items="${trendList}">
						<li><strong>${trend.hashtag}</strong><br></li>
					</c:forEach>
				</ul>
				<a href="${pageContext.request.contextPath}/community/search"
					style="color: #ee853f; font-size: 14px;">더 보기</a>
			</section>

			<section class="widget">
				<h4>팔로우 추천</h4>
				<div class="follow-list">
					<c:forEach var="u" items="${recommendedUsers}" end="1">
						<div class="follow-item">
							<div class="follow-left">
								<div class="avatar-initial" title="${u.name}">
									${fn:substring(u.name,0,1)}</div>
								<div>
									<div class="follow-name">${u.name}</div>
									<div class="follow-handle">@${u.id}</div>
								</div>
							</div>
								<input type="hidden" name="targetUserId" value="${u.id}" />
								<button type="submit" class="follow-btn">팔로우</button>
						</div>
					</c:forEach>
				</div>
			</section>
		</aside>
	</div>

	<div id="communityModal" class="modal-backdrop">
		<div class="modal">
			<h3>새 커뮤니티 만들기</h3>
			<form method="post"
				action="${pageContext.request.contextPath}/community/communities/create">
				<input type="text" name="name" placeholder="커뮤니티 이름" required />
				<textarea name="description" placeholder="커뮤니티 소개" rows="3" required></textarea>
				<div class="actions">
					<button type="button" class="btn cancel" id="closeModal">취소</button>
					<button type="submit" class="btn primary">생성하기</button>
				</div>
			</form>
		</div>
	</div>

	<script>
	const isLogin = ${not empty loginUser};
	const base = '${pageContext.request.contextPath}';

	const modal = document.getElementById('communityModal');
	const btn = document.getElementById('createCommunityBtn');
	const closeModalBtn = document.getElementById('closeModal');

	btn.onclick = () => {
	    if (!isLogin) {
	        alert('로그인이 필요합니다.');
	        location.href = base + '/Scout/signin';
	        return;
	    }
	    modal.style.display = 'flex';
	};
	closeModalBtn.onclick = () => modal.style.display = 'none';
	window.onclick = e => { if (e.target === modal) modal.style.display = 'none'; };
	</script>
</body>
</html>