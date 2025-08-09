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
	background: #fae7c9; /* 댓글 입력창 리스트 배경색 */
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

/* ===== 댓글 리스트: 모던 카드 스타일 ===== */
:root{
  --c-bg:#f7f8fa;           /* 페이지 배경 톤 */
  --c-card:#ffffff;         /* 카드 바탕 */
  --c-border:#e8eaef;       /* 연한 보더 */
  --c-text:#111827;         /* 본문 텍스트 */
  --c-sub:#6b7280;          /* 서브 텍스트 */
  --radius:12px;
  --shadow:0 6px 20px rgba(17,24,39,.06);
}

/* 리스트 컨테이너: 입력 박스와 톤 맞춤 */
.comment-list-container{
  margin-top:14px;
  background:var(--c-card);
  border:1px solid var(--c-border);
  border-radius:var(--radius);
  padding:12px;
  background-color: #fae7c9; /* 댓글창 리스트 배경색 */
}


/* 불릿 제거 + 간격 통일 */
.comment-list{
  list-style:none;
  margin:0;
  padding:0;
  display:flex;
  flex-direction:column;
  gap:10px;                 /* 아이템 간 간격 */
}

/* 개별 댓글 카드 */
.comment-item{
  border:1px solid var(--c-border);
  border-radius:10px;
  background:var(--c-card);
  box-shadow:var(--shadow);
  padding:12px 14px;
  transition:transform .12s ease, box-shadow .12s ease, border-color .12s ease;
}
.comment-item:hover{
  transform:translateY(-1px);
  border-color:#d7dbe4;
  box-shadow:0 10px 24px rgba(17,24,39,.08);
}

/* 상단 행: 작성자 표시 */
.comment-top{
  display:flex;
  align-items:center;
  gap:10px;
  margin-bottom:6px;
}
.comment-top .name{
  display:inline-flex;
  align-items:center;
  gap:8px;
  font-weight:700;
  font-size:14px;
  color:var(--c-text);
  line-height:1;
  padding:6px 10px;
  border-radius:999px;
  background:#f3f6ff;
  border:1px solid #dbe4ff;
}
/* 작은 컬러 점(아바타 느낌) */
.comment-top .name::before{
  content:"";
  width:8px;height:8px;border-radius:50%;
  background:#eb5e00; /* 포인트 블루 */
  display:inline-block;
  box-shadow:0 0 0 3px rgba(59,130,246,.15);
}

/* 본문: 말줄바꿈/단어 줄바꿈/타이포 */
.comment-body{
  color:var(--c-text);
  font-size:15px;
  line-height:1.6;
  white-space:pre-wrap;
  word-break:break-word;
  margin-top:2px;
}

/* 리스트 위/아래 쓸데없는 점(•) 보이는 경우 방지용 리셋 */
.comment-list-container ul{ list-style:none; padding-left:0; margin:0; }
.comment-list-container li::marker{ content:""; }

/* 다크 모드 자동 대응(선택) */
@media (prefers-color-scheme: dark){
  :root{
    --c-bg:#0f1115;
    --c-card:#161a22;
    --c-border:#252b37;
    --c-text:#e6eaf2;
    --c-sub:#9aa3b2;
    --shadow:0 10px 26px rgba(0,0,0,.35);
  }
  .comment-top .name{ background:#1b2230; border-color:#2a3345; }
  .comment-top .name::before{ box-shadow:0 0 0 3px rgba(59,130,246,.20); }
}
</style>
</head>
<body>
	<div class="comment-wrap">
		<div class="comment-box">
		<div class="comment-title">
			댓글 <span class="comment-count">(${commentCount}건)</span>
		</div>
			<form method="post" action="/travelDestination/${travelId}">
			<input type="hidden" name="travelId" value="${travelId}">
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
		<div class="comment-list-container" style="max-height:420px; overflow:auto;">
			<ul class="comment-list">
	  			<c:forEach var="cmt" items="${commentList}">
	    			<li class="comment-item">
	      				<div class="comment-top"><span class="name">${cmt.name}</span></div>
	      				<div class="comment-body">${cmt.content}</div>
	    			</li>
	  			</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>