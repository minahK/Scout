<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>여행코스 등록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/colors.css" />
    <style>
        body { background: #fff8f1; font-family: 'Noto Sans KR', sans-serif; }
        .add-form { max-width:480px; margin:40px auto; background: #fdd1b4; border-radius:15px; padding:32px; box-shadow:0 3px 15px #ffe4cb60;}
        .add-form h2 { color:#eb5e00; }
        .add-form input, .add-form textarea, .add-form select { width:98%; margin:10px 0; padding:8px 10px; border:1px solid #ffd5a0; border-radius:7px;}
        .add-form button { background:#ee853f; color:#fff; border:none; border-radius:7px; padding:10px 28px; font-weight:600; font-size:1.1rem; cursor:pointer;}
        .add-form button:hover { background:#eb5e00; }
        label { font-weight: 600; color: #eb5e00; }
    </style>
</head>
<body>
    <div class="add-form">
        <h2>여행코스 등록</h2>
        <form action="${pageContext.request.contextPath}/travelCourse/add" method="post">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" required maxlength="100" placeholder="코스 제목">

            <label for="description">설명</label>
            <textarea id="description" name="description" rows="4" maxlength="2000" placeholder="코스 설명"></textarea>

            <label for="regionId">지역</label>
            <select id="regionId" name="regionId" required>
                <c:forEach var="region" items="${regionList}">
                    <option value="${region.regionId}">${region.regionName}</option>
                </c:forEach>
            </select>

            <label for="userId">작성자</label>
            <select id="userId" name="userId" required>
                <c:forEach var="user" items="${userList}">
                    <option value="${user.userId}">${user.username}</option>
                </c:forEach>
            </select>

            <button type="submit">코스 저장</button>
        </form>
    </div>
</body>
</html>