<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>채팅</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
:root {
	--color-light: #ff9752;
	--color-base: #ee853f;
	--color-dark: #eb5e00;
	--color-border: #ddd;
	--color-bg: #f5f8fa;
	--color-font: #222;
	--color-font-gray: #555;
	--color-white: #fff;
}

* {
	box-sizing: border-box;
}

html, body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: var(--color-bg);
	height: 100%;
}

.layout {
	display: grid;
	grid-template-columns: 260px 300px 1fr;
	min-height: 100vh;
	margin: 0 auto;
	background: var(--color-white);
}

.sidebar {
	background: var(--color-white);
	border-right: 1px solid var(--color-border);
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	padding: 16px 12px;
	position: sticky;
	top: 0;
	height: 100vh;
}

.inbox {
	border-right: 1px solid var(--color-border);
	background: var(--color-white);
}

.inbox-header {
	padding: 12px 20px;
	border-bottom: 1px solid var(--color-border);
	position: sticky;
	top: 0;
	background-color: var(--color-white);
}

.inbox-header h3 {
	margin: 0;
	font-size: 20px;
}

.inbox-search {
	padding: 12px 20px;
	background-color: var(--color-white);
	border-bottom: 1px solid var(--color-border);
}

.inbox-search input {
	width: 100%;
	padding: 10px;
	border-radius: 9999px;
	border: 1px solid var(--color-border);
	background-color: var(--color-bg);
	outline: none;
}

.inbox-list {
	list-style: none;
	padding: 0;
	margin: 0;
	overflow-y: auto;
	height: calc(100vh - 120px);
}

.inbox-list li {
	padding: 15px 20px;
	border-bottom: 1px solid var(--color-border);
	cursor: pointer;
}

.inbox-list li.selected {
	background-color: #e8f5fe;
}

.chat {
	display: flex;
	flex-direction: column;
	background-color: var(--color-white);
}

.chat-header {
	background-color: var(--color-white);
	padding: 12px 20px;
	border-bottom: 1px solid var(--color-border);
	font-weight: bold;
	font-size: 16px;
	position: sticky;
	top: 0;
	z-index: 10;
}

.message-list {
	flex: 1;
	padding: 20px;
	overflow-y: auto;
	background-color: var(--color-bg);
}

.message {
	max-width: 60%;
	padding: 12px;
	margin-bottom: 10px;
	border-radius: 18px;
	position: relative;
	clear: both;
	line-height: 1.4;
}

.message.sent {
	background-color: var(--color-dark);
	color: var(--color-white);
	margin-left: auto;
}

.message.received {
	background-color: var(--color-white);
	color: var(--color-font);
	border: 1px solid var(--color-border);
}

.message .meta {
	font-size: 11px;
	color: #888;
	margin-top: 5px;
	text-align: right;
}

.message.sent .meta {
	color: #fff;
}

.input-area {
	padding: 15px 20px;
	border-top: 1px solid var(--color-border);
	background-color: var(--color-white);
	display: flex;
	align-items: center;
}

.input-area form {
	display: flex;
	gap: 10px;
	width: 100%;
}

.input-area input[type="text"] {
	flex: 1;
	padding: 12px 20px;
	border-radius: 9999px;
	border: 1px solid var(--color-border);
	background-color: var(--color-bg);
	outline: none;
	font-size: 14px;
}

/* ===== 사이드바 ===== */
.sidebar-logo {
	text-align: center;
	margin-bottom: 15px;
}

.sidebar-logo img {
	width: 90%;
}

.sidebar ul {
	list-style: none;
	margin: 16px 0 0;
	padding: 0;
}

.sidebar ul li {
	margin-bottom: 8px;
}

.sidebar a {
	display: block;
	padding: 10px 14px;
	border-radius: 999px;
	text-decoration: none;
	color: var(--color-font);
	font-weight: 700;
}

.sidebar a:hover {
	background: #f3f3f3;
}

.sidebar a.active {
	background: #dfeee6;
	font-weight: bold;
}

.sidebar-bottom {
	border-top: 1px solid var(--color-border);
	padding-top: 12px;
}

.sidebar-profile {
	display: flex;
	align-items: center;
	gap: 10px;
}

/* 이니셜 아바타 (이미지 컬럼 제거 대응) */
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
	border: 1px solid var(--color-border);
}

/* 버튼 */
.btn {
	padding: 10px 20px;
	border: none;
	border-radius: 9999px;
	cursor: pointer;
	font-weight: 700;
	color: var(--color-white);
	background: var(--color-dark);
	font-size: 14px;
}

.btn:hover {
	background: var(--color-base);
}

@media screen and (max-width:1024px) {
	.layout {
		grid-template-columns: 1fr;
	}
	.sidebar, .inbox {
		display: none;
	}
	.chat {
		width: 100%;
	}
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
					<li><a
						href="${pageContext.request.contextPath}/community/main">🏠 홈</a></li>
					<li><a
						href="${pageContext.request.contextPath}/community/search">🔍
							검색</a></li>
					<li><a
						href="${pageContext.request.contextPath}/community/notifications">🔔
							알림</a></li>
					<li><a class="active"
						href="${pageContext.request.contextPath}/community/messages?roomId=${currentRoomId}">✉️
							채팅</a></li>
					<li><a
						href="${pageContext.request.contextPath}/community/communities">👥
							커뮤니티</a></li>
					<li><a
						href="${pageContext.request.contextPath}/community/profile">🧑‍
							프로필</a></li>
					<li><a
						href="${pageContext.request.contextPath}/community/settings/account">⚙️
							설정</a></li>
				</ul>
			</div>

			<div class="sidebar-bottom">
				<div class="sidebar-profile">
					<c:choose>
						<c:when
							test="${not empty loginUser and not empty loginUser.nickname}">
							<div class="avatar-initial" title="${loginUser.nickname}">
								${fn:substring(loginUser.nickname,0,1)}</div>
							<div>
								<strong>${loginUser.nickname}</strong><br> <span
									style="font-size: 12px; color: gray;">${loginUser.handle}</span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="avatar-initial" title="Guest">G</div>
							<div>
								<strong>비회원</strong><br> <span
									style="font-size: 12px; color: gray;">@guest</span>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<div class="inbox">
			<div class="inbox-header">
				<h3>쪽지</h3>
			</div>
			<div class="inbox-search">
				<input type="text" placeholder="쪽지 검색하기" />
			</div>
			<ul class="inbox-list">
				<c:forEach var="room" items="${chatRooms}">
					<li class="${room.chatRoomId == currentRoomId ? 'selected' : ''}">
						<a
						href="${pageContext.request.contextPath}/community/messages?roomId=${room.chatRoomId}"
						style="text-decoration: none; color: inherit;"> <strong>${room.roomName}</strong><br>
					</a>
					</li>
				</c:forEach>
			</ul>
		</div>

		<div class="chat">
			<div class="chat-header">
				<c:forEach var="room" items="${chatRooms}">
					<c:if test="${room.chatRoomId == currentRoomId}">
                    ${room.roomName}
                </c:if>
				</c:forEach>
			</div>

			<div class="message-list">
				<c:forEach var="msg" items="${messages}">
					<div
						class="message ${msg.senderId == loginUser.userId ? 'sent' : 'received'}">
						<div>${msg.content}</div>
						<div class="meta">${msg.sentAt}</div>
					</div>
				</c:forEach>
			</div>

			<div class="input-area">
				<form
					action="${pageContext.request.contextPath}/community/messages/send"
					method="post">
					<input type="hidden" name="roomId" value="${currentRoomId}" /> <input
						type="text" name="content" placeholder="새 쪽지 작성하기" required />
					<button type="submit" class="btn">전송</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
