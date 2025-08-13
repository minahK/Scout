<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body {
	margin: 0;
	font-family: 'Noto Sans KR', sans-serif;
	padding-top: 70px;
	background-color: #fff;
}
.loginname {
	font-weight: bold;
	font-size:16px;
}
/* 상단 네비게이션 */
.top-nav {
	background: white !important;
	border-bottom: 1px solid transparent;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 18px 60px 18px 45px;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 1000;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.top-nav .logo {
	font-weight: bold;
	font-size: 23px;
	letter-spacing: 2px;
}

.top-nav .logo a {
	color: #222;
	text-decoration: none;
	display: flex;
	align-items: center;
}

.top-nav .logo img {
	height: 35px;
	width: auto;
	max-width: 160px;
	display: block;
}

/* 메뉴 */
.top-nav .menu {
	display: flex;
	gap: 38px;
	font-size: 18px;
	position: relative;
	z-index: 10;
}

.top-nav .menu .menu-item {
	position: relative;
}

.top-nav .menu a {
	text-decoration: none;
	color: #222;
	font-weight: 500;
	padding: 3px 2px;
	display: inline-block;
	transition: .15s;
	border-bottom: 2px solid transparent;
}

.top-nav .menu a:hover {
	font-weight: 700;
	border-bottom: 2px solid #222;
}

/* 아이콘 */
.top-nav .icons {
	display: flex;
	gap: 20px;
	font-size: 22px;
	color: #222;
	position: relative;
	z-index: 9999;
}

.top-nav .icons i {
	cursor: pointer;
}

/* 드롭다운 스타일 */
.dropdown {
	display: none;
	position: absolute;
	left: 50%;
	top: 100%;
	transform: translateX(-50%);
	background: #f6f6f6;
	box-shadow: 0 8px 24px rgba(0, 0, 0, .06);
	padding: 20px 40px;
	border-bottom: 1px solid #eee;
	border-radius: 0 0 18px 18px;
	min-width: 70px;
	width: max-content;
	z-index: 999;
	white-space: nowrap;
}

.menu-item:hover .dropdown {
	display: block;
}

/* 세로형 드롭다운 */
.dropdown-list {
	display: flex;
	flex-direction: column;
	gap: 11px;
}

.dropdown-list a {
	display: block;
	font-size: 16px;
	color: #444;
	text-decoration: none;
	padding: 2px 0;
	transition: .13s;
}

.dropdown-list a:hover {
	color: #eb5e00;
	font-weight: 600;
}

@media ( max-width :900px) {
	.top-nav {
		flex-direction: column;
		padding: 18px 8vw;
	}
	.dropdown {
		min-width: 120px;
	}
}
</style>

<div class="top-nav">
	<div class="logo">
		<a href="/"> <img src="https://i.imgur.com/xpGazxz.png" alt="Logo" />
		</a>
	</div>

	<div class="menu">
		<div class="menu-item">
			<a href="/" class="active">홈</a>
		</div>
		<div class="menu-item">
			<a href="/travelDestination/theme">테마</a>
		</div>
		<div class="menu-item">
			<a href="/RecommendedCourse">추천코스</a>
		</div>
		<div class="menu-item">
			<a href="javascript:void(0)">여행정보</a>
			<div class="dropdown">
				<div class="dropdown-list">
					<a href="/travelDestination">여행지</a> <a
						href="/travel/list">여행기사</a> <a href="/festival/list">여행행사</a>
				</div>
			</div>
		</div>
	</div>

	<div class="icons">
		<i class="fa fa-search"></i>
		<i class="fas fa-comments" onclick="location.href='/community/main'"></i>
		<c:choose>
			<c:when test="${not empty sessionScope.loginUser}">
				<span class="loginname">${sessionScope.loginUser.name} 님</span>
			</c:when>
			<c:otherwise>
				<i class="fa-solid fa-circle-user"
					onclick="location.href='/Scout/signin'"></i>
			</c:otherwise>
		</c:choose>
		<!-- <i class="fa-solid fa-circle-user" onclick="location.href='/Scout/signin'"></i> -->
		<i class="fa fa-globe"></i>
	</div>
</div>