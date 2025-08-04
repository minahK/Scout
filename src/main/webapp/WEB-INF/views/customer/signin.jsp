<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<!-- Font Awesome 아이콘 사용 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
}

.container {
	width: 400px;
	margin: 100px auto;
	padding: 30px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

h1, h2 {
	text-align: center;
	color: #333;
	margin-bottom: 10px;
}

.logo {
	display: block;
	margin: 0 auto;
}

.description {
	text-align: center;
	color: #777;
	margin-top: 10px;
	font-size: 14px;
}

form {
	display: flex;
	flex-direction: column;
}

label {
	margin-top: 15px;
	font-weight: bold;
	color: #555;
}

.input-group {
	position: relative;
	width: 100%;
	box-sizing: border-box;
}

.input-group input {
	width: 100%;
	padding: 10px 40px 10px 35px; /* 왼쪽 아이콘 + 오른쪽 아이콘 공간 확보 */
	box-sizing: border-box;
}

.input-group i {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	color: #aaa;
	pointer-events: none;
}

.input-group .fa-lock {
	left: 10px;
}

.input-group .password-toggle {
	right: 10px;
	cursor: pointer;
	pointer-events: auto;
}

.password-toggle {
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
	color: #aaa;
}

.input-icon {
	position: absolute;
	top: 50%;
	left: 10px;
	transform: translateY(-50%);
	color: #aaa;
	pointer-events: none;
}

button {
	margin-top: 20px;
	padding: 10px;
	background-color: #ff9752;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
}

button:hover {
	background-color: #eb5e00;
}

.options {
	margin-top: 15px;
	text-align: center;
	font-size: 14px;
}

.options a {
	color: #ff9752;
	text-decoration: none;
	margin: 0 10px;
}

.options a:hover {
	text-decoration: underline;
}

.error-message {
	color: red;
	text-align: center;
	margin-top: 10px;
	font-size: 14px;
}

/* 반응형 디자인 */
@media ( max-width : 500px) {
	.container {
		width: 90%;
		margin: 50px auto;
		padding: 20px;
	}
}
</style>
</head>
<body>

	<div class="container">
		<img src="/images/ScoutLogo.png" alt="TRACE 로고" width="150"
			height="100" class="logo">
		<p class="description">TRACE에 오신 것을 환영합니다.</p>

		<h1>사용자 접속</h1>
		<h2>로그인</h2>

		<!-- 에러 메시지 표시 -->
		<c:if test="${not empty error}">
			<p class="error-message">${error}</p>
		</c:if>

		<form action="/customer/signin" method="post">
			<label for="id">아이디</label>
			<div class="input-group ">
				<i class="fas fa-user input-icon"></i> <input type="text" name="id"
					id="id" required>
			</div>

			<label for="pw">비밀번호</label>
			<div class="input-group">
				<i class="fas fa-lock input-icon"></i> <input type="password"
					name="pw" id="pw" required> <i
					class="fas fa-eye password-toggle" onclick="togglePassword()"></i>
			</div>

			<button type="submit">로그인</button>
		</form>

		<div class="options">
			<a href="/customer/signup">회원가입</a> <a href="/customer/forgot">비밀번호
				찾기</a>
		</div>
	</div>

	<script>
		function togglePassword() {
			const pwField = document.getElementById("pw");
			const toggleIcon = document.querySelector(".password-toggle");
			if (pwField.type === "password") {
				pwField.type = "text";
				toggleIcon.classList.add("fa-eye");
				toggleIcon.classList.remove("fa-eye-slash");
			} else {
				pwField.type = "password";
				toggleIcon.classList.add("fa-eye-slash");
				toggleIcon.classList.remove("fa-eye");
			}
		}
	</script>

</body>
</html>
