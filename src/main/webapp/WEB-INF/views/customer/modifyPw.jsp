<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사용자 비밀번호 변경 페이지</h1>
	
	<form action="/customer/modifyPw" method="post">
		변경할 비밀번호 : <input type="password" name="pw"> <br>
		<button type="submit">변경하기</button>
		<button type="button" onClick="location.href='/customer/mypage'">마이페이지로~</button>
	</form>
</body>
</html>