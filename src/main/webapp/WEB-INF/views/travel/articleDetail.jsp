<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${travel.title} - 여행 상세</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/travel-detail.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
	<%@ include file="../travelDestination/tdHeader.jsp"%>
    <div class="article-container">
        <!-- 제목 영역 -->
        <div class="article-header">
            <h1 class="title">${travel.title}</h1>
            <div class="meta">
                <span class="location"><i class="fa-solid fa-location-dot"></i> ${travel.location}</span>
                <span class="views"><i class="fa-solid fa-eye"></i> ${travel.viewCount}</span>
                <c:if test="${not empty travel.regDate}">
                    <span class="date">
                        <i class="fa-regular fa-calendar"></i>
                        <fmt:formatDate value="${travel.regDate}" pattern="yyyy.MM.dd" />
                    </span>
                </c:if>
            </div>
        </div>

        <!-- 아이콘 영역 -->
        <div class="icon-bar">
            <!-- 왼쪽 아이콘 -->
            <div class="left">
                <div class="icon-group">
                    <i class="fa-regular fa-heart" id="likeBtn"></i>
                    <span id="likeCount">${travel.likes}</span>
                </div>
                <div class="icon-group">
                    <i class="fa-regular fa-eye"></i>
                    <span>${travel.viewCount}</span>
                </div>
            </div>

            <div class="spacer"></div>

            <!-- 오른쪽 아이콘 -->
            <div class="right">
                <i class="fa-regular fa-bookmark"></i>
                <i class="fa-solid fa-print"></i>
                <div class="icon-group">
                    <i class="fa-solid fa-share-nodes"></i>
                    <span>${travel.shares}</span>
                </div>
            </div>
        </div>

        <!-- 본문 내용 -->
        <div class="article-content">
            <p>${travel.content}</p>
        </div>

        <!-- 여행 정보 -->
        <div class="article-info">
            <p><strong>운영 시간:</strong> ${travel.hours}</p>
            <p><strong>입장료:</strong> ${travel.price}</p>
            <p><strong>주차:</strong> ${travel.parking}</p>
            <p><strong>전화번호:</strong> ${travel.phone}</p>
        </div>
        
	      <!-- 댓글 영역 -->
			<div class="comment-section">
			    <h3>댓글</h3>
			
			    <form action="${pageContext.request.contextPath}/travel/${travel.id}/comment" method="post">
			        <c:choose>
			            <%-- 로그인 상태 --%>
			            <c:when test="${isLoggedIn}">
			                <input type="hidden" name="author" value="${loginUserId}">
			                <p>작성자: <strong>${loginUserId}</strong></p>
			            </c:when>
			
			            <%-- 비로그인 상태 --%>
			            <c:otherwise>
			                <input type="text" name="author" placeholder="작성자" required>
			            </c:otherwise>
			        </c:choose>
			
			        <textarea name="content" placeholder="댓글을 입력하세요" required></textarea>
			        <button type="submit">등록</button>
			    </form>
			
			    <!-- 댓글 목록 -->
				<div id="commentList" class="comment-list">
				    <c:forEach var="comment" items="${comments}">
				        <div class="comment" data-id="${comment.id}">
				            <p><strong>${comment.author}</strong></p>
				            <p class="comment-content">${comment.content}</p>
				
				            <c:if test="${isLoggedIn and not empty loginUserId and loginUserId eq comment.author}">
				                <!-- 수정 버튼 -->
				                <button type="button" class="edit-btn">수정</button>
				
				                <!-- 수정 폼 -->
				                <form class="edit-form"
				                      action="${pageContext.request.contextPath}/travel/${travel.id}/comment/${comment.id}/update"
				                      method="post" style="display:none;">
				                    <textarea name="content" required>${comment.content}</textarea>
				                    <button type="submit">수정 완료</button>
				                    <button type="button" class="cancel-edit">취소</button>
				                </form>
				
				                <!-- 삭제 버튼 -->
				                <form action="${pageContext.request.contextPath}/travel/${travel.id}/comment/${comment.id}/delete"
				                      method="post" style="display:inline;">
				                    <button type="submit" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
				                </form>
				            </c:if>
				            <hr>
				        </div>
				    </c:forEach>
				</div>
			</div>

        <!-- 목록으로 돌아가기 버튼 -->
        <div class="back-btn-wrapper">
            <a href="${pageContext.request.contextPath}/travel/list" class="back-btn">
                <i class="fa-solid fa-arrow-left"></i> 목록으로 돌아가기
            </a>
        </div>
    </div>
    
    <%@ include file="../main/footer.jsp"%>
    
    <script>
        // 좋아요 버튼 기능
        document.getElementById("likeBtn").addEventListener("click", function () {
            let likeCountEl = document.getElementById("likeCount");
            let currentCount = parseInt(likeCountEl.textContent);

            likeCountEl.textContent = currentCount + 1;
            alert("좋아요를 누르셨습니다.");
        });
        
     	// 댓글 수정 토글
        document.querySelectorAll(".edit-btn").forEach(button => {
            button.addEventListener("click", function () {
                const commentDiv = this.closest(".comment");
                const editForm = commentDiv.querySelector(".edit-form");
                editForm.style.display = editForm.style.display === "none" ? "block" : "none";
            });
        });

        // 수정 취소 버튼
        document.querySelectorAll(".cancel-edit").forEach(button => {
            button.addEventListener("click", function () {
                const editForm = this.closest(".edit-form");
                editForm.style.display = "none";
            });
        });    
    </script>
</body>
</html>