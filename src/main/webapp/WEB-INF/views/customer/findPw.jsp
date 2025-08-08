<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
	text-align: center;
}

h1 {
	color: #333;
	margin-bottom: 20px;
}

label {
	display: block;
	margin-top: 20px;
	font-weight: bold;
	color: #555;
}

input[type="email"] {
	width: 100%;
	padding: 10px;
	margin-top: 10px;
	box-sizing: border-box;
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

.message {
	margin-top: 15px;
	font-size: 14px;
	color: green;
}

.error {
	color: red;
}
</style>
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="container">
		<h1>비밀번호 찾기</h1>

		<form action="<c:url value='/Scout/sendResetLink'/>" method="post">
			<label for="email">가입한 이메일 주소</label> <input type="email"
				name="email" id="email" required />
			<button type="submit">재설정 링크 보내기</button>
		</form>

		<c:if test="${not empty message}">
			<p class="message">${message}</p>
		</c:if>
		<c:if test="${not empty error}">
			<p class="error">${error}</p>
		</c:if>
	</div>
</body>
</html>
