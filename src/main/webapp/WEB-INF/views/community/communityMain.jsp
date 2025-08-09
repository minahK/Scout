<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>커뮤니티 메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    :root {
        --color-light: #ff9752;
        --color-base: #ee853f;
        --color-dark: #eb5e00;
        --color-border: #ddd;
        --color-bg: #f5f8fa;
        --color-font: #222;
        --color-font-gray: #555;
        --color-white: #fff;
    }
    * { box-sizing: border-box; }

    html, body { height: 100%; margin: 0; font-family: Arial, sans-serif; background-color: var(--color-bg); }

    /* ===== 공통 이니셜 아바타 ===== */
    .avatar-initial{
        width: 36px; height: 36px; border-radius: 50%;
        display: inline-flex; align-items: center; justify-content: center;
        background: var(--color-light); color: #fff; font-weight: 700;
        border: 1px solid var(--color-border);
    }
    .avatar-initial.profile { width: 48px; height: 48px; }

    /* ===== 레이아웃 ===== */
    .layout { display: grid; grid-template-columns: 260px 1fr 300px; min-height: 100vh; margin: 0 auto; background: var(--color-white); }
    .main { padding: 0; background: var(--color-white); border-right: 1px solid var(--color-border); }
    .rightbar { background: #f7fafc; border-left: 1px solid #e6ecf0; padding: 20px; }

    /* ===== 사이드바 ===== */
    .sidebar { background: var(--color-white); border-right: 1px solid var(--color-border); display: flex; flex-direction: column; justify-content: space-between; padding: 16px 12px; position: sticky; top: 0; height: 100vh; }
    .sidebar-logo { text-align: center; margin-bottom: 15px; }
    .sidebar-logo img { width: 90%; }
    .sidebar ul { list-style: none; margin: 16px 0 0; padding: 0; }
    .sidebar ul li { margin-bottom: 8px; }
    .sidebar a { display: block; padding: 10px 14px; border-radius: 999px; text-decoration: none; color: var(--color-font); font-weight: 700; }
    .sidebar a:hover { background: #f3f3f3; }
    .sidebar a.active { background: #dfeee6; font-weight: bold; }
    .sidebar-bottom { border-top: 1px solid var(--color-border); padding-top: 12px; }
    .sidebar-profile { display: flex; align-items: center; gap: 10px; }

    /* ===== 상단 헤더 ===== */
    .community-header { position: sticky; top: 0; z-index: 50; background: var(--color-white); border-bottom: 1px solid var(--color-border); display: flex; justify-content: space-between; align-items: center; padding: 12px 20px; }
    .community-header h2 { margin: 0; font-size: 20px; }

    /* ===== 필터 (탭) ===== */
    .tab-switch { display: flex; border-bottom: 1px solid #eee; background: var(--color-white); }
    .tab-switch div { flex: 1; text-align: center; padding: 12px 0; cursor: pointer; font-weight: bold; color: var(--color-font); }
    .tab-switch .active { border-bottom: 3px solid var(--color-base); color: var(--color-font); }
    .tab-switch .inactive { color: gray; background-color: #f1f1f1; }

    /* ===== 게시물 작성 폼 ===== */
    .post-form { display: flex; align-items: flex-start; background: var(--color-white); padding: 15px; border-bottom: 1px solid var(--color-border); }
    .post-form textarea { width: 100%; flex: 1; font-size: 16px; resize: none; border: none; outline: none; padding: 10px; line-height: 1.5; white-space: pre-wrap; word-break: break-word; }
    .post-options { display: flex; gap: 10px; padding: 10px 0; font-size: 18px; color: var(--color-dark); }
    .option-fields label { display: block; margin: 5px 0; }
    .option-btn { background: none; border: none; font-size: 18px; cursor: pointer; padding: 6px; border-radius: 50%; transition: background-color 0.2s ease; }
    .option-btn:hover { background-color: #f0f0f0; }

    /* ===== 게시물 카드 ===== */
    .post-box { background: var(--color-white); padding: 16px; border-bottom: 1px solid #eee; }
    .post-box h3 { margin: 0 0 4px 0; }
    .post-box p { margin: 0 0 6px 0; color: var(--color-font-gray); white-space: pre-wrap; word-break: break-word; }
    .post-box small { color: gray; font-size: 12px; }
    .post-actions { margin-top: 10px; }
    .post-actions button { background: none; border: none; font-size: 1.2rem; cursor: pointer; padding: 6px; border-radius: 50%; transition: background-color 0.2s ease; }
    .post-actions button:hover { background-color: #f0f0f0; }

    /* ===== 댓글 박스 ===== */
    .comment-box { background: #f0f0f0; border-radius: 8px; padding: 12px; margin-top: 12px; }
    .comment-box > div { margin-bottom: 8px; }
    .comment-form { margin-top: 10px; display: flex; gap: 8px; }
    .comment-form input { flex: 1; padding: 8px; border: 1px solid var(--color-border); border-radius: 20px; outline: none; }

    /* ===== 우측 위젯 ===== */
    .widget { background: var(--color-white); border: 1px solid #e6ecf0; border-radius: 12px; padding: 14px 16px; margin-bottom: 16px; }
    .widget h4 { margin: 0 0 10px 0; font-size: 16px; font-weight: 700; color: var(--color-font); }
    .widget ul { list-style: none; padding: 0px; }
    .trend-item { margin: 8px 0; }
    .trend-item a { color: var(--color-font); text-decoration: none; font-weight: 700; }
    .trend-more { display: inline-block; margin-top: 8px; font-size: 14px; color: var(--color-dark); text-decoration: underline; }
    .follow-list { display: flex; flex-direction: column; gap: 12px; }
    .follow-item { display: flex; align-items: center; justify-content: space-between; }
    .follow-left { display: flex; align-items: center; gap: 10px; min-width: 0; }
    .follow-name { font-weight: 700; color: var(--color-font); line-height: 1.2; }
    .follow-handle { font-size: 12px; color: #657786; }
    .follow-btn { border: none; border-radius: 20px; padding: 6px 12px; cursor: pointer; font-weight: 700; color: var(--color-white); background: var(--color-base); }
    .follow-btn:hover { background: var(--color-dark); }

    /* ===== 버튼 ===== */
    .btn { padding: 8px 14px; border: none; border-radius: 6px; cursor: pointer; }
    .btn.primary { background: var(--color-dark); color: var(--color-white); }
    .btn.primary:hover { background: var(--color-base); }

    /* 반응형 */
    @media screen and (max-width: 1024px) {
        .layout { grid-template-columns: 1fr; }
        .sidebar, .rightbar { display: none; }
    }
</style>
</head>
<body>
<div class="layout">
    <div class="sidebar">
        <div>
            <div class="sidebar-logo">
                <a href="/community/main">
                    <img src="https://i.imgur.com/xpGazxz.png" alt="Logo" />
                </a>
            </div>
            <ul>
                <li><a class="active" href="/community/main">🏠 홈</a></li>
                <li><a href="/community/search">🔍 검색</a></li>
                <li><a href="/community/notifications">🔔 알림</a></li>
                <li><a href="/community/messages">✉️ 채팅</a></li>
                <li><a href="/community/communities">👥 커뮤니티</a></li>
                <li><a href="/community/profile">🧑‍ 프로필</a></li>
                <li><a href="/community/settings/account">⚙️ 설정</a></li>
            </ul>
        </div>
        <div class="sidebar-bottom">
            <div class="sidebar-profile">
                <c:choose>
                    <c:when test="${not empty loginUser}">
                        <div class="avatar-initial">
                            ${fn:substring(loginUser.nickname,0,1)}
                        </div>
                        <div>
                            <strong>${loginUser.nickname}</strong><br>
                            <span style="font-size: 12px; color: gray;">${loginUser.handle}</span>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="avatar-initial">G</div>
                        <div>
                            <strong>비회원</strong><br>
                            <span style="font-size: 12px; color: gray;">@guest</span>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <main class="main">
        <div class="community-header">
            <h2>홈</h2>
        </div>
        
        <form class="post-form" action="/community/post" method="post" enctype="multipart/form-data">
            <div class="avatar-initial profile" style="margin-right:10px;">
                ${fn:substring(loginUser.nickname,0,1)}
            </div>
            <div style="flex: 1;">
                <textarea name="content" rows="2" placeholder="게시물 작성하기"></textarea>
                <input type="hidden" name="authorId" value="${loginUser.userId}" />
                <div class="post-options">
                    <button type="button" class="option-btn" data-type="image" title="이미지 첨부">📷</button>
                    <button type="button" class="option-btn" data-type="video" title="비디오 첨부">🎥</button>
                    <button type="button" class="option-btn" data-type="location" title="위치 태그">📍</button>
                </div>
                <div class="option-fields"></div>
                <div style="text-align: right;">
                 <button class="btn primary" type="submit">게시하기</button>
                </div>
            </div>
        </form>

        <c:forEach var="post" items="${posts}">
            <div class="post-box">
                <div style="display: flex; align-items: center; gap: 10px;">
                    <div class="avatar-initial">
                        ${fn:substring(post.authorNickname,0,1)}
                    </div>
                    <div>
                        <strong>${post.authorNickname}</strong> <small>${post.handle}</small>
                    </div>
                </div>
                <p style="margin-top: 10px;">${post.content}</p>

                <div class="post-actions">
                    <button type="button" class="comment-icon" data-post-id="${post.postId}">💬</button>
                    <button>🔁</button>
                    <button>❤️</button>
                    <small>${post.createdAt}</small>
                </div>

                <c:if test="${not empty commentsMap[post.postId]}">
                    <div class="comment-box">
                        <c:forEach var="comment" items="${commentsMap[post.postId]}">
                            <div style="margin-bottom: 8px;">
                                <strong>${comment.nickname}</strong>
                                <small style="color: gray;">${comment.handle}</small><br>
                                <span>${comment.content}</span>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>

                <form action="/community/mention/add" method="post" class="comment-form" id="comment-form-${post.postId}" style="display: none; margin-top: 10px;">
                    <input type="hidden" name="postId" value="${post.postId}" />
                    <input type="text" name="content" placeholder="댓글을 입력하세요." />
                    <button type="submit" class="btn primary" style="margin-top: 0;">작성</button>
                </form>
            </div>
        </c:forEach>
    </main>

    <aside class="rightbar">
        <section class="widget">
            <h4>실시간 트렌드</h4>
            <ul>
                <c:forEach var="trend" items="${trends}">
                    <li><strong>${trend.hashtag}</strong><br></li>
                </c:forEach>
            </ul>
            <a href="/community/search" class="trend-more">더 보기</a>
        </section>

        <section class="widget">
            <h4>팔로우 추천</h4>
            <div class="follow-list">
                <c:forEach var="user" items="${recommendedUsers}">
                    <div class="follow-item">
                        <div class="follow-left">
                            <div class="avatar-initial">
                                ${fn:substring(user.nickname,0,1)}
                            </div>
                            <div>
                                <div class="follow-name">${user.nickname}</div>
                                <div class="follow-handle">@${user.handle}</div>
                            </div>
                        </div>
                        <form method="post" action="/community/follow">
                            <input type="hidden" name="targetUserId" value="${user.userId}"/>
                            <button type="submit" class="follow-btn">팔로우</button>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </section>
    </aside>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const optionFields = document.querySelector('.option-fields');
        const buttons = document.querySelectorAll('.option-btn');
        const templates = {
            image: `<label>이미지 업로드 <input type="file" name="imageFile" accept="image/*"></label>`,
            video: `<label>비디오 업로드 <input type="file" name="videoFile" accept="video/*"></label>`,
            location: `<label>위치 입력 <input type="text" name="location" placeholder="위치 입력 (예: 서울 마포구)"></label>`
        };
        let current = null;

        buttons.forEach(btn => {
            btn.addEventListener('click', () => {
                const type = btn.dataset.type;
                if (current === type) {
                    optionFields.innerHTML = '';
                    current = null;
                } else {
                    optionFields.innerHTML = templates[type] || '';
                    current = type;
                }
            });
        });

        document.querySelectorAll('.comment-icon').forEach(icon => {
            icon.addEventListener('click', function () {
                const postId = this.dataset.postId;
                const form = document.getElementById(`comment-form-${postId}`);
                if (form.style.display === 'none' || form.style.display === '') {
                    form.style.display = 'flex';
                } else {
                    form.style.display = 'none';
                }
            });
        });
    });
</script>
</body>
</html>
