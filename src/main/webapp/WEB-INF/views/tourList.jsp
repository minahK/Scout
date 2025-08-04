<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>관광정보 요청 리스트</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; }
        .greeting { color: #eb5e00; font-size: 1.2em; margin: 28px 0 18px; }
        .list { margin-bottom: 18px; }
        .write-btn {
            background: #ee853f; color: #fff; border: none;
            padding: 8px 20px; border-radius: 7px; font-size: 1em; cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="greeting">${username}</div>
    <button class="write-btn" onclick="location.href='/tourist/write'">등록하기</button>
    <div class="list">
        <table border="1" cellpadding="8">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>첨부</th>
            </tr>
            <c:forEach var="req" items="${list}">
                <tr>
                    <td>${req.requestId}</td>
                    <td>
                        <a href="#">${req.title}</a>
                    </td>
                    <td>${req.createdAt}</td>
                    <td>
                        <c:if test="${not empty req.filePath}">
                            <a href="${req.filePath}" target="_blank">파일</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>