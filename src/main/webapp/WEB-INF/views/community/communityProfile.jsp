<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

.sidebar-profile img {
	width: 38px;
	height: 38px;
	border-radius: 50%;
	object-fit: cover;
	border: 1px solid var(--color-border)
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

.avatar {
	position: absolute;
	top: -60px;
	left: 20px;
	width: 120px;
	height: 120px;
	border-radius: 50%;
	border: 4px solid var(--color-white);
	object-fit: cover;
	background: var(--color-white)
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

.bio .meta {
	display: flex;
	gap: 12px;
	color: #657786;
	font-size: 13px;
	margin-top: 6px
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

.tabbar{
  position: sticky; top: 0; z-index:10;
  background: var(--color-white);
  border-bottom:1px solid var(--color-border);
  display:flex; justify-content:space-between; 
  gap:0; padding:0 20px; font-weight:700;
}

.tabbar a{
  flex:1 1 0;         
  text-align:center;  
  padding:12px 0;
  border-bottom:3px solid transparent;
  color:var(--color-font);
  text-decoration:none;
  position:relative;
}
.tabbar a.active{ color:var(--color-dark); }
.tabbar a.active::after{
  content:""; position:absolute; left:0; right:0; bottom:-1px;
  height:3px; background:var(--color-dark); border-radius:3px 3px 0 0;
}
/* 피드 */
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

.post .avatar-sm {
	width: 42px;
	height: 42px;
	border-radius: 50%;
	object-fit: cover
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
</style>
</head>
<body>
	<div class="layout">
		<aside class="sidebar">
			<div>
				<div class="sidebar-logo">
					<a href="/community/main"><img
						src="https://i.imgur.com/xpGazxz.png" alt="Logo" /></a>
				</div>
				<ul>
					<li><a href="${ctx}/community/main">🏠 홈</a></li>
					<li><a href="${ctx}/community/search">🔍 검색</a></li>
					<li><a href="${ctx}/community/notifications">🔔 알림</a></li>
					<li><a href="${ctx}/community/messages">✉️ 쪽지</a></li>
					<li><a href="${ctx}/community/communities">👥 커뮤니티</a></li>
					<li><a class="active" href="/community/profile">🧑‍ 프로필</a></li>
					<li><a href="#">⚙️ 설정</a></li>
				</ul>
			</div>
			<div class="sidebar-bottom">
				<div class="sidebar-profile">
					<img
						src="/image/community/${empty user.profileImage ? 'default-profile.png' : user.profileImage}"
						alt="">
					<div>
						<strong><c:out value="${user.nickname}" /></strong><br> <span
							style="font-size: 12px; color: gray;"><c:out
								value="${user.handle}" /></span>
					</div>
				</div>
			</div>
		</aside>


		<main class="main">
			<div class="cover"></div>
			<div class="profile-head">
				<img class="avatar"
					src="/image/community/${empty user.profileImage ? 'default-profile.png' : user.profileImage}"
					alt="avatar">
				<div class="head-actions">
					<c:choose>
						<c:when test="${isOwner}">
							<a href="${ctx}/community/profile/edit" class="btn btn-ghost">프로필 수정</a>
							<a href="${ctx}/community/post/new" class="btn btn-primary">게시하기</a>
						</c:when>
						<c:otherwise>
							<form method="get" action="/community/profile/edit"
									style="text-align: right; margin-bottom: 12px;">
									<button type="submit" class="btn btn-primary">프로필 편집</button>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div class="bio">
				<h2>
					<c:out value="${user.nickname}" />
				</h2>
				<div class="handle">
					<c:out value="${user.handle}" />
				</div>
				<div class="meta">
					<span>🗓 가입일: <c:set var="joinRaw" value="${user.joinDate}" />
						<c:catch var="joinFmtErr">
							<fmt:formatDate value="${joinRaw}" pattern="yyyy년 M월"
								var="joinFmt" />
						</c:catch> <c:choose>
							<c:when test="${empty joinFmtErr and not empty joinFmt}">${joinFmt}</c:when>
							<c:otherwise>
								<c:catch var="joinParseErr">
									<fmt:parseDate value="${joinRaw}" pattern="yyyy-MM-dd HH:mm:ss"
										var="joinParsed" />
								</c:catch>
								<c:choose>
									<c:when test="${empty joinParseErr and not empty joinParsed}">
										<fmt:formatDate value="${joinParsed}" pattern="yyyy년 M월" />
									</c:when>
									<c:otherwise>
										<c:out value="${joinRaw}" />
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</span>
				</div>
				<div class="counts">
					<a href="/community/profile/following?userId=${user.userId}">
						<strong>${followingCount}</strong> 팔로잉
					</a> <a href="/community/profile/followers?userId=${user.userId}">
						<strong>${followerCount}</strong> 팔로워
					</a>
				</div>
			</div>

			<nav class="tabbar">
				<a class="active"
					href="/community/profile?userId=${user.userId}">게시물</a> <a
					href="/community/profile/replies?userId=${user.userId}">답글</a>
				<a href="/community/profile/media?userId=${user.userId}">미디어</a>
				<a href="/community/profile/likes?userId=${user.userId}">마음에 들어요</a>
			</nav>

			<!-- 피드 -->
			<section class="feed">
				<!-- 고정 게시물(있다면) -->
				<c:if test="${not empty pinnedPost}">
					<div class="post">
						<img class="avatar-sm"
							src="/image/community/${empty user.profileImage ? 'default-profile.png' : user.profileImage}"
							alt="">
						<div class="body">
							<div class="pinned">📌 메인에 고정</div>
							<div class="meta">
								<strong><c:out value="${user.nickname}" /></strong> ·
								<c:out value="${user.handle}" />
							</div>
							<div class="content">
								<c:out value="${pinnedPost.content}" />
							</div>
							<c:if test="${not empty pinnedPost.imageURL}">
								<div class="photo">
									<img src="/upload/${pinnedPost.imageURL}" alt="">
								</div>
							</c:if>
							<div class="actions">
								<span>💬</span><span>🔁 ${pinnedPost.repostsCount}</span><span>❤
									${pinnedPost.likesCount}</span>
							</div>
						</div>
					</div>
				</c:if>

				<!-- 일반 게시물 -->
				<c:forEach var="post" items="${posts}">
					<div class="post">
						<img class="avatar-sm"
							src="/image/community/${empty user.profileImage ? 'default-profile.png' : user.profileImage}"
							alt="">
						<div class="body">
							<div class="meta">
								<strong><c:out value="${user.nickname}" /></strong> ·
								<c:out value="${user.handle}" />
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
							<c:if test="${not empty post.imageURL}">
								<div class="photo">
									<img src="/upload/${post.imageURL}" alt="">
								</div>
							</c:if>
							<div class="actions">
								<span>💬</span><span>🔁 ${post.repostsCount}</span><span>❤ ${post.likesCount}</span>
							</div>
						</div>
					</div>
				</c:forEach>

				<c:if test="${empty posts}">
					<div style="padding: 20px; color: #657786; text-align: center;">아직 게시물이 없습니다.</div>
				</c:if>
			</section>
		</main>

		<!-- 오른쪽 위젯 -->
		<aside class="rightbar">
			<section class="widget"
				style="background: var(--color-white); border: 1px solid #e6ecf0; border-radius: 12px; padding: 14px 16px; margin-bottom: 16px;">
				<h4 style="margin: 0 0 10px 0; font-size: 16px; font-weight: 700; color: var(--color-font);">팔로우 추천</h4>
				<div class="follow-list"
					style="display: flex; flex-direction: column; gap: 12px;">
					<c:forEach var="u" items="${recommendedUsers}">
						<div
							style="display: flex; align-items: center; justify-content: space-between;">
							<div
								style="display: flex; align-items: center; gap: 10px; min-width: 0;">
								<img
									src="/image/community/${empty u.profileImage ? 'default-profile.png' : u.profileImage}"
									style="width: 36px; height: 36px; border-radius: 50%; object-fit: cover; border: 1px solid #e6ecf0; background: var(--color-white);" />
								<div>
									<div
										style="font-weight: 700; color: var(--color-font); line-height: 1.2;">
										<c:out value="${u.nickname}" />
									</div>
									<div style="font-size: 12px; color: #657786;">
										<c:out value="${u.handle}" />
									</div>
								</div>
							</div>
							<form method="post" action="/community/follow">
								<input type="hidden" name="targetUserId" value="${u.userId}" />
								<button type="submit" class="btn btn-primary">팔로우</button>
							</form>
						</div>
					</c:forEach>
				</div>
			</section>
		</aside>
	</div>
</body>
</html>
