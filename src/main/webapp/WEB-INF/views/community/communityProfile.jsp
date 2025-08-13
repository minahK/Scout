<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>프로필</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
:root {
	--color-light: #ff9752;
	--color-base: #ee853f;
	--color-dark: #eb5e00;
	--color-border: #ddd;
	--color-bg: #f5f8fa;
	--color-font: #222;
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
	background: var(--color-white)
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

.main {
	background: var(--color-white);
	border-right: 1px solid var(--color-border)
}

.rightbar {
	background: #f7fafc;
	border-left: 1px solid #e6ecf0;
	padding: 20px
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

.sidebar li {
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

.avatar-initial {
	width: 38px;
	height: 38px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #eee;
	color: #444;
	border: 1px solid var(--color-border);
	font-weight: 700
}

.cover {
	width: 100%;
	height: 200px;
	background: #cfd8dc
		url('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?q=80&w=1200&auto=format&fit=crop')
		center/cover no-repeat;
	position: relative
}

.profile-head {
	padding: 16px 20px 0 20px;
	position: relative
}

.avatar-initial-lg {
	position: absolute;
	top: -60px;
	left: 20px;
	width: 120px;
	height: 120px;
	border-radius: 50%;
	border: 4px solid var(--color-white);
	background: #eee;
	color: #444;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 48px;
	font-weight: 800
}

.head-actions {
	display: flex;
	justify-content: flex-end;
	gap: 8px
}

.btn {
	border: none;
	border-radius: 999px;
	padding: 8px 14px;
	font-weight: 700;
	cursor: pointer
}

.btn-primary {
	background: var(--color-dark);
	color: var(--color-white)
}

.btn-primary:hover {
	background: var(--color-base)
}

.btn-ghost {
	background: transparent;
	color: var(--color-dark)
}

.btn-ghost:hover {
	background: #fff2e8
}

.bio {
	margin-left: 150px;
	padding-bottom: 12px;
	border-bottom: 1px solid var(--color-border)
}

.bio h2 {
	margin: 0 0 4px 0
}

.handle {
	color: #657786;
	font-size: 14px
}

.bio .counts {
	display: flex;
	gap: 16px;
	margin-top: 8px
}

.bio .counts a {
	color: var(--color-font);
	text-decoration: none
}

.bio .counts a strong {
	margin-right: 4px
}

.tabbar {
	position: sticky;
	top: 0;
	z-index: 10;
	background: var(--color-white);
	border-bottom: 1px solid var(--color-border);
	display: flex;
	gap: 0;
	padding: 0 20px;
	font-weight: 700
}

.tabbar a {
	flex: 1 1 0;
	text-align: center;
	padding: 12px 0;
	border-bottom: 3px solid transparent;
	color: var(--color-font);
	text-decoration: none;
	position: relative
}

.tabbar a.active {
	color: var(--color-dark)
}

.tabbar a.active::after {
	content: "";
	position: absolute;
	left: 0;
	right: 0;
	bottom: -1px;
	height: 3px;
	background: var(--color-dark);
	border-radius: 3px 3px 0 0
}

.feed {
	max-width: 680px;
	margin: 0 auto
}

.post {
	display: flex;
	gap: 10px;
	padding: 14px 20px;
	border-bottom: 1px solid var(--color-border)
}

.avatar-initial-sm {
	width: 42px;
	height: 42px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #eee;
	color: #444;
	border: 1px solid var(--color-border);
	font-weight: 700
}

.post .body {
	flex: 1
}

.post .meta {
	color: #657786;
	font-size: 12px;
	margin-bottom: 6px
}

.post .content {
	font-size: 14px;
	line-height: 1.5;
	color: var(--color-font);
	white-space: pre-wrap
}

.post .photo {
	margin-top: 10px;
	border: 1px solid #e6ecf0;
	border-radius: 12px;
	max-height: 420px;
	overflow: hidden
}

.post .photo img {
	width: 100%;
	display: block
}

.actions {
	display: flex;
	gap: 16px;
	margin-top: 10px;
	color: #657786;
	font-size: 13px
}

.actions span {
	cursor: pointer
}

.pinned {
	font-size: 12px;
	color: #657786;
	margin: 6px 0
}

@media ( max-width :1024px) {
	.layout {
		grid-template-columns: 1fr
	}
	.sidebar, .rightbar {
		display: none
	}
}

.widget {
	background: var(--color-white);
	border: 1px solid #e6ecf0;
	border-radius: 12px;
	padding: 14px 16px;
	margin-bottom: 16px;
}

.widget h4 {
	margin: 0 0 10px 0;
	font-size: 16px;
	font-weight: 700;
	color: var(--color-font);
}

.widget ul {
	list-style: none;
	padding: 0px;
}

.trend-item {
	margin: 8px 0;
}

.trend-item a {
	color: var(--color-font);
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
	color: var(--color-font);
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
	color: var(--color-white);
	background: var(--color-base);
}

.follow-btn:hover {
	background: var(--color-dark);
}

.btn {
	padding: 8px 14px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	text-decoration: none;
}

.btn.primary {
	background: var(--color-dark);
	color: var(--color-white);
}

.btn.primary:hover {
	background: var(--color-base);
}
</style>
</head>
<body>
	<div class="layout">
		<aside class="sidebar">
			<div>
				<div class="sidebar-logo">
					<a href="${ctx}/"><img src="https://i.imgur.com/xpGazxz.png" alt="Logo" /></a>
				</div>
				<ul>
					<li><a href="${ctx}/community/main">🏠 홈</a></li>
					<li><a href="${ctx}/community/search">🔍 검색</a></li>
					<li><a href="${ctx}/community/notifications">🔔 알림</a></li>
					<li><a href="${ctx}/community/messages">✉️ 채팅</a></li>
					<li><a href="${ctx}/community/communities">👥 커뮤니티</a></li>
					<li><a class="active" href="${ctx}/community/profile">🧑‍ 프로필</a></li>
					<li><a href="${ctx}/community/settings/account">⚙️ 설정</a></li>
				</ul>
			</div>
		</aside>

		<main class="main">
			<div class="cover"></div>
			<c:choose>
				<c:when test="${not empty user}">
					<c:set var="displayName"
						value="${not empty user.name ? user.name : (not empty user.id ? user.id : 'Guest')}" />
				</c:when>
				<c:otherwise>
					<c:set var="displayName" value="Guest" />
				</c:otherwise>
			</c:choose>

			<div class="profile-head">
				<div class="avatar-initial-lg" title="${displayName}">
					${fn:substring(displayName,0,1)}</div>

				<div class="head-actions">
				    <c:choose>
				        <c:when test="${isOwner}">
				            <a href="${ctx}/community/profile/edit" class="btn btn-ghost">프로필 수정</a>
				            <a href="" class="btn btn-primary">게시하기</a>
				        </c:when>
				        <c:otherwise>
				            <button type="button" class="btn btn-primary">팔로우</button>
				        </c:otherwise>
				    </c:choose>
				</div>
			</div>

			<div class="bio">
				<h2>
					<c:out value="${displayName}" />
				</h2>
				<div class="handle">
					<c:choose>
						<c:when test="${not empty user and not empty user.id}">
						@<c:out value="${user.id}" />
						</c:when>
						<c:otherwise>@guest</c:otherwise>
					</c:choose>
				</div>
				<div class="counts">
					<a
						href="${ctx}/community/profile/following?id=${not empty user ? user.id : ''}">
						<strong>${empty followingCount ? 0 : followingCount}</strong> 팔로잉
					</a> <a
						href="${ctx}/community/profile/followers?id=${not empty user ? user.id : ''}">
						<strong>${empty followerCount ? 0 : followerCount}</strong> 팔로워
					</a>
				</div>
			</div>

			<nav class="tabbar">
				<a class="active" href="${ctx}/community/profile?id=${not empty user ? user.id : ''}">게시물</a>
				<a href="">미디어</a>
				<a href="">마음에 들어요</a>
			</nav>

			<section class="feed">
				<c:if test="${not empty pinnedPost}">
					<div class="post">
						<div class="avatar-initial-sm" title="${displayName}">
							${fn:substring(displayName,0,1)}</div>
						<div class="body">
							<div class="pinned">📌 메인에 고정</div>
							<div class="meta">
								<strong><c:out value="${displayName}" /></strong> ·
								<c:choose>
									<c:when test="${not empty user and not empty user.id}">
									@<c:out value="${user.id}" />
									</c:when>
									<c:otherwise>@guest</c:otherwise>
								</c:choose>
							</div>
							<div class="content">
								<c:out value="${pinnedPost.content}" />
							</div>
							<c:if test="${not empty pinnedPost.imageUrl}">
								<div class="photo">
									<img src="${ctx}/upload/${pinnedPost.imageUrl}" alt="">
								</div>
							</c:if>
							<div class="actions">
								<span>💬</span><span>🔁 ${pinnedPost.repostsCount}</span><span>❤
									${pinnedPost.likesCount}</span>
							</div>
						</div>
					</div>
				</c:if>

				<c:forEach var="post" items="${posts}">
					<div class="post">
						<div class="avatar-initial-sm" title="${displayName}">
							${fn:substring(displayName,0,1)}</div>
						<div class="body">
							<div class="meta">
								<strong><c:out value="${displayName}" /></strong> ·
								<c:choose>
									<c:when test="${not empty user and not empty user.id}">
									@<c:out value="${user.id}" />
									</c:when>
									<c:otherwise>@guest</c:otherwise>
								</c:choose>
								·
								<c:set var="createdRaw" value="${post.createdAt}" />
								<c:catch var="fmtErr">
									<fmt:formatDate value="${createdRaw}"
										pattern="yyyy-MM-dd HH:mm" var="createdFmt" />
								</c:catch>
								<c:choose>
									<c:when test="${empty fmtErr and not empty createdFmt}">${createdFmt}</c:when>
									<c:otherwise>
										<c:catch var="parseErr">
											<fmt:parseDate value="${createdRaw}"
												pattern="yyyy-MM-dd HH:mm:ss" var="createdParsed" />
										</c:catch>
										<c:choose>
											<c:when test="${empty parseErr and not empty createdParsed}">
												<fmt:formatDate value="${createdParsed}"
													pattern="yyyy-MM-dd HH:mm" />
											</c:when>
											<c:otherwise>
												<c:out value="${createdRaw}" />
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="content">
								<c:out value="${post.content}" />
							</div>
							<c:if test="${not empty post.imageUrl}">
								<div class="photo">
									<img src="${ctx}/upload/${post.imageUrl}" alt="">
								</div>
							</c:if>
							<div class="actions">
								<span>💬</span><span>🔁 ${post.repostsCount}</span><span>❤
									${post.likesCount}</span>
							</div>
						</div>
					</div>
				</c:forEach>

				<c:if test="${empty posts}">
					<div style="padding: 20px; color: #657786; text-align: center;">아직 게시물이 없습니다.</div>
				</c:if>
			</section>
		</main>

		<aside class="rightbar">
			<section class="widget">
				<h4>팔로우 추천</h4>
				<div class="follow-list">
					<c:forEach var="user" items="${recommendedUsers}">
						<div class="follow-item">
							<div class="follow-left">
								<div class="avatar-initial">
									${fn:substring(user.name,0,1)}</div>
								<div>
									<div class="follow-name">${user.name}</div>
									<div class="follow-handle">@${user.id}</div>
								</div>
							</div>
							<form method="post" action="/community/follow">
								<input type="hidden" name="targetUserId" value="${user.id}" />
								<button type="button" class="follow-btn">팔로우</button>
							</form>
						</div>
					</c:forEach>
				</div>
			</section>
		</aside>
	</div>
</body>
</html>