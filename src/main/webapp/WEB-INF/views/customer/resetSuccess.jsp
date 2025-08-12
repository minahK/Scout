<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경 완료</title>
    <style>
        /* 페이지 전체 스타일 */
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #ee853f, #00f2fe);
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        /* 카드 박스 */
        .container {
            background-color: #f7d49c;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            padding: 40px 50px;
            text-align: center;
            max-width: 400px;
            width: 90%;
        }

        h2 {
            color: #333;
            margin-bottom: 15px;
        }

        p {
            color: #666;
            margin-bottom: 30px;
            line-height: 1.4;
        }

        /* 버튼 스타일 */
        .btn {
            display: inline-block;
            background: #ee853f;
            color: white;
            text-decoration: none;
            padding: 12px 24px;
            border-radius: 25px;
            font-weight: bold;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background: #eb5e00;
            transform: translateY(-2px);
        }

        /* 애니메이션 */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .container {
            animation: fadeIn 0.6s ease-out;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>비밀번호 변경 완료!</h2>
        <p>비밀번호가 성공적으로 변경되었습니다.<br>이제 로그인하실 수 있습니다.</p>
        <a href="<c:url value='/scout/signin'/>" class="btn">로그인 페이지로 이동</a>
    </div>
</body>
</html>
