<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>계정 설정</title>
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

.sidebar-menu li {
	margin-bottom: 8px
}

.sidebar-menu a {
	display: block;
	padding: 10px 14px;
	border-radius: 999px;
	color: var(--color-font);
	font-weight: bold
}

.sidebar-menu a:hover {
	background: #f3f3f3
}

.sidebar-menu a.active {
	background: #dfeee6
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
	padding: 10px 16px;
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

.btn-outline {
	background: #fff;
	border: 1px solid var(--color-border);
	color: var(--color-font)
}

.card {
	max-width: 780px;
	margin: 20px auto;
	background: #fff;
	border: 1px solid var(--color-border);
	border-radius: 16px;
	padding: 20px
}

h2 {
	margin: 0 0 16px 0
}

.section-title {
	margin: 24px 0 12px 0;
	font-size: 18px
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

.muted {
	color: #6b7280;
	font-size: 13px
}

.preview {
	display: flex;
	align-items: center;
	gap: 12px
}

.preview img {
	width: 64px;
	height: 64px;
	border-radius: 50%;
	object-fit: cover;
	border: 1px solid var(--color-border)
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
					<li><a href="${ctx}/community/profile">🧑‍ 프로필</a></li>
					<li><a class="active" href="${ctx}/community/settings/account">⚙️
							설정</a></li>
				</ul>
			</div>
		</aside>

		<main class="main">
			<div class="card">
				<h2>계정 설정</h2>

				<c:if test="${not empty msg}">
					<div class="alert alert-ok">${msg}</div>
				</c:if>
				<c:if test="${not empty error}">
					<div class="alert alert-err">${error}</div>
				</c:if>

				<div class="section-title">프로필 정보</div>
				<form method="post" action="${ctx}/community/settings/account"
					enctype="multipart/form-data">
					<div class="row">
						<label>프로필 이미지</label>
						<div class="preview">
							<div class="avatar-initial" style="width:64px;height:64px;">
								${fn:substring(user.name,0,1)}
							</div>
						</div>
					</div>

					<div class="row">
						<label for="nickname">닉네임</label>
						<input id="nickname" name="name" class="input" maxlength="50"
							value="<c:out value='${user.name}' default=''/>">
					</div>

					<div class="row">
						<label for="handle">핸들</label>
						<input id="handle" name="id" class="input" maxlength="30"
							value="<c:out value='${user.id}' default=''/>">
						<div class="muted" style="grid-column: 2/3">@ 없이 입력 (예:
							myid)</div>
					</div>

					<div class="row">
						<label for="email">이메일</label>
						<input id="email" type="email" name="email" class="input" maxlength="120"
							value="<c:out value='${user.email}' default=''/>">
					</div>

					<div style="display: flex; gap: 8px; justify-content: flex-end; margin-top: 10px;">
						<a href="${ctx}/community/profile" class="btn btn-ghost">취소</a>
						<button type="button" class="btn btn-primary">저장</button>
					</div>
				</form>

				<div class="section-title">비밀번호 변경</div>
				<form method="post" action="${ctx}/community/settings/account/password">
					<div class="row">
						<label for="currentPassword">현재 비밀번호</label>
						<input id="currentPassword" name="currentPassword" type="password" class="input" required>
					</div>
					<div class="row">
						<label for="newPassword">새 비밀번호</label>
						<input id="newPassword" name="newPassword" type="password" class="input" minlength="6" required>
					</div>
					<div class="row">
						<label for="newPasswordConfirm">새 비밀번호 확인</label>
						<input id="newPasswordConfirm" name="newPasswordConfirm" type="password" class="input" minlength="6" required>
					</div>
					<div style="text-align: right">
						<button type="button" class="btn btn-primary">비밀번호 변경</button>
					</div>
				</form>
			</div>
		</main>

		<aside class="rightbar"></aside>
	</div>
</body>
</html>