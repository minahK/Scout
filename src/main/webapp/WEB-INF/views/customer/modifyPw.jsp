<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<style>
body {
	font-family: sans-serif;
	background-color: #FFFFFF;
	margin: 0;
	padding: 0;
}

form {
	max-width: 360px;
	margin: 80px auto;
	background-color: #fff;
	padding: 30px 25px;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
	color: #eb5e00; /* 진한색 */
}

input[type="password"] {
	width: 100%;
	padding: 10px 12px;
	font-size: 15px;
	border: 2px solid #f7d49c; /* 연한색 */
	border-radius: 6px;
	box-sizing: border-box;
	transition: border-color 0.3s ease;
}

input[type="password"]:focus {
	border-color: #ee853f; /* 기본색 */
	outline: none;
	box-shadow: 0 0 4px rgba(238, 133, 63, 0.5);
}

button {
	width: 100%;
	margin-top: 20px;
	padding: 12px;
	background-color: #ff9752; /* 옅은색 */
	color: white;
	border: none;
	border-radius: 6px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.25s ease;
}

button:hover {
	background-color: #eb5e00; /* 진한색 */
}

.msg-error {
	color: red;
	margin-bottom: 15px;
	font-size: 14px;
}

.msg-success {
	color: green;
	margin-bottom: 15px;
	font-size: 14px;
}

@media ( max-width : 480px) {
	form {
		margin: 40px 15px;
		padding: 20px;
	}
}
</style>
</head>
<body>

	<form action="/Scout/resetPw" method="post">
		<c:if test="${not empty error}">
			<div class="msg-error">${error}</div>
		</c:if>
		<c:if test="${not empty message}">
			<div class="msg-success">${message}</div>
		</c:if>

		<!-- 이메일 히든 필드로 전달 -->
		<input type="hidden" name="email" value="${email}"> <label
			for="password">새 비밀번호</label> <input type="password" id="password"
			name="password" required>

		<button type="submit">변경</button>
	</form>

</body>
</html>
