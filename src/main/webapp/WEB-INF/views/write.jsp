<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>관광정보 요청 등록</title>
</head>
<body>
    <h2>관광정보 요청 등록</h2>
    <form:form modelAttribute="touristRequest" method="post" enctype="multipart/form-data">
        <div>
            <label for="title">제목</label>
            <form:input path="title" id="title"/>
        </div>
        <div>
            <label for="content">내용</label>
            <form:textarea path="content" id="content"/>
        </div>
        <div>
            <label for="uploadFile">파일첨부</label>
            <input type="file" name="uploadFile" id="uploadFile"/>
        </div>
        <button type="submit">등록</button>
    </form:form>
</body>
</html>