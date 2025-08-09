<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>알림</title>
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
	box-sizing: border-box
}

html, body {
	height: 100%;
	margin: 0;
	font-family: Arial, sans-serif;
	background: var(--color-bg)
}

.layout {
	display: grid;
	grid-template-columns: 260px 1fr 300px;
	min-height: 100vh;
	margin: 0 auto;
	background: var(--color-white)
}

.main {
	padding: 0;
	background: var(--color-white);
	border-right: 1px solid var(--color-border)
}

.rightbar {
	background: #f7fafc;
	border-left: 1px solid #e6ecf0;
	padding: 20px
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
	height: 100vh
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
	color: var(--color-font);
	font-weight: bold
}

.sidebar a:hover {
	background: #f3f3f3
}

.sidebar a.active {
	background: #dfeee6
}

.sidebar-bottom {
	border-top: 1px solid var(--color-border);
	padding-top: 12px
}

.sidebar-profile {
	display: flex;
	align-items: center;
	gap: 10px
}

.sidebar-profile img {
	width: 38px;
	height: 38px;
	border-radius: 50%;
	object-fit: cover;
	border: 1px solid var(--color-border)
}

.community-header {
	position: sticky;
	top: 0;
	z-index: 50;
	background: var(--color-white);
	border-bottom: 1px solid var(--color-border);
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 12px 20px
}

.community-header h2 {
	margin: 0;
	font-size: 20px
}

.notification-item {
	display: flex;
	align-items: flex-start;
	gap: 10px;
	padding: 16px;
	border-bottom: 1px solid var(--color-border);
	background: var(--color-white);
	cursor: pointer
}

.notification-item:hover {
	background: #f7f9fa
}

.notification-item img.profile {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	object-fit: cover
}

.notification-content {
	flex: 1;
	font-size: 14px
}

.notification-content p {
	margin: 0;
	line-height: 1.4;
	color: var(--color-font)
}

.notification-content small {
	display: block;
	margin-top: 4px;
	color: var(--color-font-gray);
	font-size: 12px
}

.widget {
	background: var(--color-white);
	border: 1px solid #e6ecf0;
	border-radius: 12px;
	padding: 14px 16px;
	margin-bottom: 16px
}

.widget h4 {
	margin: 0 0 10px 0;
	font-size: 16px;
	font-weight: 700;
	color: var(--color-font)
}

.widget ul {
	list-style: none;
	padding: 0
}

.follow-list {
	display: flex;
	flex-direction: column;
	gap: 12px
}

.follow-item {
	display: flex;
	align-items: center;
	justify-content: space-between
}

.follow-left {
	display: flex;
	align-items: center;
	gap: 10px;
	min-width: 0
}

.follow-left img {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	object-fit: cover;
	border: 1px solid #e6ecf0;
	background: var(--color-white)
}

.follow-name {
	font-weight: 700;
	color: var(--color-font);
	line-height: 1.2
}

.follow-handle {
	font-size: 12px;
	color: #657786
}

.follow-btn {
	border: none;
	border-radius: 20px;
	padding: 6px 12px;
	cursor: pointer;
	font-weight: 700;
	color: var(--color-white);
	background: var(--color-dark);
	white-space: nowrap
}

.follow-btn:hover {
	background: var(--color-base)
}

@media screen and (max-width:1024px) {
	.layout {
		grid-template-columns: 1fr
	}
	.sidebar, .rightbar {
		display: none
	}
}
</style>
</head>
<body>
	<div class="layout">
		<div class="sidebar">
			<div>
				<div class="sidebar-logo">
					<a href="${pageContext.request.contextPath}/community/main"> <img
						src="https://i.imgur.com/xpGazxz.png" alt="Logo" />
					</a>
				</div>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/community/main">🏠 홈</a></li>
					<li><a
						href="${pageContext.request.contextPath}/community/search">🔍
							검색</a></li>
					<li><a class="active"
						href="${pageContext.request.contextPath}/community/notifications">🔔
							알림</a></li>
					<li><a
						href="${pageContext.request.contextPath}/community/messages">✉️
							채팅</a></li>
					<li><a
						href="${pageContext.request.contextPath}/community/communities">👥
							커뮤니티</a></li>
					<li><a
						href="${pageContext.request.contextPath}/community/profile">🧑‍
							프로필</a></li>
					<li><a href="#">⚙️ 설정</a></li>
				</ul>
			</div>
			<div class="sidebar-bottom">
				<div class="sidebar-profile">
					<img
						src="${pageContext.request.contextPath}/image/community/default-profile.png" />
					<div>
						<strong>비회원</strong><br> <span
							style="font-size: 12px; color: gray;">@_undo_</span>
					</div>
				</div>
			</div>
		</div>

		<main class="main">
			<div class="community-header">
				<h2>알림</h2>
			</div>

			<c:forEach var="notification" items="${notifications}">
				<div class="notification-item"
					data-id="${notification.notificationId}">
					<img class="profile" src="${pageContext.request.contextPath}/image/community/default-profile.png" alt="프로필" />

					<div class="notification-content">
						<p>
							${notification.message}
							<c:if test="${not empty notification.linkUrl}">
                            &nbsp;<a href="${notification.linkUrl}"
									style="color: var(--color-dark); text-decoration: none;">바로가기</a>
							</c:if>
						</p>
						<small> <c:set var="createdRaw"
								value="${notification.createdAt}" />
							<c:catch var="parseErr">
								<fmt:parseDate value="${createdRaw}" pattern="yyyy-MM-dd HH:mm:ss" var="createdParsed" />
							</c:catch> <c:choose>
								<c:when test="${empty parseErr and not empty createdParsed}">
									<fmt:formatDate value="${createdParsed}" pattern="yyyy-MM-dd HH:mm" />
								</c:when>
								<c:otherwise>
									<c:catch var="fmtErr">
										<fmt:formatDate value="${createdRaw}"
											pattern="yyyy-MM-dd HH:mm" />
									</c:catch>
									<c:if test="${not empty fmtErr}">
										<c:out value="${createdRaw}" />
									</c:if>
								</c:otherwise>
							</c:choose>
						</small>
					</div>
				</div>
			</c:forEach>

			<c:if test="${empty notifications}">
				<div
					style="padding: 20px; text-align: center; color: var(--color-font-gray);">
					새로운 알림이 없습니다.</div>
			</c:if>
		</main>

		<aside class="rightbar">
			<section class="widget">
				<h4>팔로우 추천</h4>
				<div class="follow-list">
					<c:forEach var="user" items="${recommendedUsers}">
						<div class="follow-item">
							<div class="follow-left">
								<img
									src="${pageContext.request.contextPath}/image/community/${empty user.profileImage ? 'default-profile.png' : user.profileImage}"
									alt="profile" />
								<div>
									<div class="follow-name">${user.nickname}</div>
									<div class="follow-handle">@${user.handle}</div>
								</div>
							</div>
							<form method="post"
								action="${pageContext.request.contextPath}/community/follow">
								<input type="hidden" name="targetUserId" value="${user.userId}" />
								<button type="submit" class="follow-btn">팔로우</button>
							</form>
						</div>
					</c:forEach>
				</div>
			</section>
		</aside>
	</div>
</body>
</html>
