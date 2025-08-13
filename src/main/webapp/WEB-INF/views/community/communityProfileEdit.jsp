<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>프로필 편집</title>
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
	background: var(--color-bg);
	color: var(--color-font)
}

a {
	text-decoration: none;
	color: inherit
}

.layout {
	display: grid;
	grid-template-columns: 260px 1fr 300px;
	min-height: 100vh;
	background: var(--color-white)
}

.main {
	background: #fff;
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

.sidebar-menu {
	list-style: none;
	margin: 16px 0 0;
	padding: 0
}

.sidebar-menu ul {
	list-style: none;
	margin: 16px 0 0;
	padding: 0
}

.sidebar-menu li {
	margin-bottom: 8px
}

.sidebar-menu a {
	display: block;
	padding: 10px 14px;
	border-radius: 999px;
	text-decoration: none;
	color: var(--color-font);
	font-weight: bold
}

.sidebar-menu a:hover {
	background: #f3f3f3
}

.sidebar-menu a.active {
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

.btn {
	border: none;
	border-radius: 999px;
	padding: 8px 14px;
	font-weight: 700;
	cursor: pointer
}

.btn-primary {
	background: var(--color-dark);
	color: #fff
}

.btn-primary:hover {
	background: var(--color-base)
}

.btn-ghost {
	background: transparent;
	color: var(--color-dark)
}

.btn-outline {
	background: #fff;
	border: 1px solid var(--color-border);
	color: var(--color-font)
}

.card {
	max-width: 720px;
	margin: 20px auto;
	background: #fff;
	border: 1px solid var(--color-border);
	border-radius: 12px;
	padding: 20px
}

h2 {
	margin: 0 0 16px 0
}

.row {
	display: grid;
	grid-template-columns: 180px 1fr;
	gap: 12px;
	align-items: center;
	margin-bottom: 14px
}

.input {
	width: 100%;
	padding: 10px 12px;
	border: 1px solid var(--color-border);
	border-radius: 8px
}

.alert {
	border-radius: 8px;
	padding: 10px 12px;
	margin-bottom: 12px
}

.alert-ok {
	background: #e6fff2;
	border: 1px solid #b6f0cf
}

.alert-err {
	background: #fff3f3;
	border: 1px solid #ffd3d3
}

.alert-warn {
	background: #fffbe6;
	border: 1px solid #ffe58f
}

.preview {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 12px
}

.preview-left {
	display: flex;
	align-items: center;
	gap: 12px
}

.preview img {
	width: 72px;
	height: 72px;
	border-radius: 50%;
	object-fit: cover;
	border: 1px solid var(--color-border);
	background: #fff
}

.muted {
	color: #6b7280;
	font-size: 13px
}

@media ( max-width :1024px) {
	.layout {
		grid-template-columns: 1fr
	}
	.sidebar, .rightbar {
		display: none
	}
	.row {
		grid-template-columns: 1fr
	}
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
				<ul class="sidebar-menu">
					<li><a href="${ctx}/community/main">🏠 홈</a></li>
					<li><a href="${ctx}/community/search">🔍 검색</a></li>
					<li><a href="${ctx}/community/notifications">🔔 알림</a></li>
					<li><a href="${ctx}/community/messages">✉️ 채팅</a></li>
					<li><a href="${ctx}/community/communities">👥 커뮤니티</a></li>
					<li><a class="active" href="${ctx}/community/profile/edit">🧑‍
							프로필 편집</a></li>
					<li><a href="${ctx}/community/settings/account">⚙️ 설정</a></li>
				</ul>
			</div>
		</aside>

		<main class="main">
			<form class="card" method="post"
				action="${ctx}/community/profile/edit" enctype="multipart/form-data"
				<c:if test="${preview}">onsubmit="return false" data-preview="true"</c:if>>
				<h2>프로필 편집</h2>

				<c:if test="${not empty msg}">
					<div class="alert alert-ok">${msg}</div>
				</c:if>
				<c:if test="${not empty error}">
					<div class="alert alert-err">${error}</div>
				</c:if>
				<c:if test="${preview}">
					<div class="alert alert-warn">미리보기 모드입니다. 저장하려면 로그인해 주세요.</div>
				</c:if>

				<div class="row">
					<label for="nickname">닉네임</label> <input id="nickname"
						name="name" class="input" maxlength="50"
						value="<c:out value='${user.name}' default=''/>"
						<c:if test='${preview}'>readonly</c:if> />
				</div>

				<div
					style="display: flex; gap: 8px; justify-content: flex-end; margin-top: 16px;">
					<a href="${ctx}/community/profile" class="btn btn-ghost">취소</a>
					<c:choose>
						<c:when test="${preview}">
							<a href="${ctx}/login?redirect=${ctx}/community/profile/edit"
								class="btn btn-primary">로그인하고 편집</a>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-primary">저장</button>
						</c:otherwise>
					</c:choose>
				</div>
			</form>
		</main>

		<aside class="rightbar"></aside>
	</div>
</body>
</html>