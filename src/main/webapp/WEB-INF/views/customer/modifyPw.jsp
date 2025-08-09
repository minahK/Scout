<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<link rel="stylesheet" href="<c:url value='/css/reset-password.css'/>">

<style type="text/css">
body {
	font-family: Arial, sans-serif;
	background-color: #f5f7fa;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 400px;
	margin: 80px auto;
	padding: 30px;
	background: #ffffff;
	border-radius: 8px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	margin-bottom: 20px;
	color: #333;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	margin-bottom: 6px;
	font-weight: 600;
}

.form-group input {
	width: 100%;
	padding: 8px 10px;
	border: 1px solid #ccd0d5;
	border-radius: 4px;
	box-sizing: border-box;
}

button {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	border: none;
	color: white;
	font-size: 16px;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}

.alert {
	padding: 10px 15px;
	margin-bottom: 15px;
	border-radius: 4px;
	font-size: 14px;
}

.alert.success {
	background: #e6f4ea;
	color: #027a48;
}

.alert.error {
	background: #ffebe6;
	color: #bf2600;
}

.link {
	text-align: center;
	margin-top: 20px;
}

.link a {
	color: #007bff;
	text-decoration: none;
}

.link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<h1>비밀번호 재설정</h1>

		<!-- 플래시 메시지 -->
		<c:if test="${not empty message}">
			<div class="alert success">${message}</div>
		</c:if>
		<c:if test="${not empty error}">
			<div class="alert error">${error}</div>
		</c:if>

		<!-- 토큰 검증 실패 메시지 -->
		<c:if test="${not empty invalidToken}">
			<div class="alert error">${invalidToken}</div>
		</c:if>

		<!-- 비밀번호 재설정 폼 -->
		<c:if test="${empty invalidToken}">
			<form action="<c:url value='/customer/resetPw'/>" method="post">
				<input type="hidden" name="token" value="${param.token}" />

				<div class="form-group">
					<label for="password">새 비밀번호</label> <input type="password"
						id="password" name="password" required minlength="8">
				</div>

				<div class="form-group">
					<label for="confirmPassword">비밀번호 확인</label> <input type="password"
						id="confirmPassword" name="confirmPassword" required minlength="8">
				</div>

				<button type="submit">비밀번호 변경</button>
			</form>
		</c:if>

		<p class="link">
			<a href="<c:url value='/customer/login'/>">로그인 페이지로 돌아가기</a>
		</p>
	</div>

	<!-- (선택) 클라이언트 측 비밀번호 일치 체크 -->
	<script>
    const form = document.querySelector('form');
    form.addEventListener('submit', e => {
      const pwd = form.password.value;
      const confirm = form.confirmPassword.value;
      if (pwd !== confirm) {
        e.preventDefault();
        alert('입력하신 비밀번호가 서로 다릅니다.');
      }
    });
    </script>
</body>
</html>
