<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>댓글 입력창</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
.comment-wrap {
	max-width: 1080px;
	margin: 38px auto 0 auto;
	font-family: 'Noto Sans KR', sans-serif;
}

.comment-title {
	font-size: 21px;
	font-weight: 800;
	margin-bottom: 18px;
}

.comment-count {
	font-size: 17px;
	color: #666;
	font-weight: 400;
}

.comment-box {
	background: #fafbfc;
	border: 1px solid #e7e8ea;
	border-radius: 8px;
	padding: 25px 18px 20px 18px;
}

.comment-textarea {
	width: 100%;
	resize: none;
	border-radius: 7px;
	border: 1px solid #e7e8ea;
	font-size: 15px;
	color: #444;
	padding: 16px 15px;
	background: #fff;
	outline: none;
	box-sizing: border-box;
	margin-bottom: 0;
}

.comment-btn-row {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	margin-top: 11px;
}

.photo-btn {
	display: flex;
	align-items: center;
	gap: 4px;
	border: 1px solid #ccc;
	background: #fff;
	color: #444;
	border-radius: 6px;
	font-size: 15px;
	padding: 7px 15px;
	margin-right: 9px;
	cursor: pointer;
	transition: background .2s, color .2s;
}

.photo-btn:disabled {
	background: #f7f7f7;
	color: #ccc;
	cursor: not-allowed;
}

.register-btn {
	background: #222;
	color: #fff;
	border: none;
	border-radius: 6px;
	font-size: 15px;
	padding: 7px 24px;
	font-weight: 600;
	cursor: pointer;
	transition: background .2s;
}

.register-btn:disabled {
	background: #ededed;
	color: #bbb;
	cursor: not-allowed;
}

.comment-guide {
	margin-top: 12px;
	font-size: 13px;
	color: #999;
	display: flex;
	align-items: center;
	gap: 7px;
}

.comment-guide i {
	font-size: 15px;
}
</style>
</head>
<body>
	<div class="comment-wrap">
		<div class="comment-title">
			댓글 <span class="comment-count">(${commentCount}건)</span>
		</div>
		<div class="comment-box">
			<form method="post" action="보낼경로">
				<c:choose>
					<c:when test="${not empty sessionScope.loginUser}">
						<textarea name="content" rows="3" class="comment-textarea"
							placeholder="댓글을 입력하세요." required></textarea>
					</c:when>
					<c:otherwise>
						<textarea rows="3" class="comment-textarea"
							placeholder="로그인 후 댓글을 등록할 수 있습니다." disabled></textarea>
					</c:otherwise>
				</c:choose>
				<div class="comment-btn-row">
					<button type="submit" class="register-btn">
						등록</button>
				</div>
				<div class="comment-guide">
					<i class="fa-regular fa-circle-question"></i> <span>유의사항</span>
				</div>
			</form>
		</div>
	</div>
</body>
</html>