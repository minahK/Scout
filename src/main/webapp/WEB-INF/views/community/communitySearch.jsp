<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>검색</title>
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

    html, body {
        height: 100%;
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: var(--color-bg);
    }

    .layout {
        display: grid;
        grid-template-columns: 260px 1fr 300px;
        min-height: 100vh;
        margin: 0 auto;
        background: var(--color-white);
    }

    .main {
        padding: 0;
        background: var(--color-white);
        border-right: 1px solid var(--color-border);
    }

    .rightbar {
        background: #f7fafc;
        border-left: 1px solid #e6ecf0;
        padding: 20px;
    }

    .sidebar {
        background: var(--color-white);
        border-right: 1px solid var(--color-border);
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        padding: 16px 12px;
        position: sticky; top: 0; height: 100vh;
    }
    .sidebar-logo { text-align: center; margin-bottom: 15px; }
    .sidebar-logo img { width: 90%; }
    .sidebar ul { list-style: none; margin: 16px 0 0; padding: 0; }
    .sidebar ul li { margin-bottom: 8px; }
    .sidebar a {
        display: block; padding: 10px 14px; border-radius: 9999px;
        text-decoration: none; color: var(--color-font); font-weight: 700;
    }
    .sidebar a:hover { background: #f3f3f3; }
    .sidebar a.active { background: #dfeee6; font-weight: bold; }
    .sidebar-bottom { border-top: 1px solid var(--color-border); padding-top: 12px; }
    .sidebar-profile { display: flex; align-items: center; gap: 10px; }

    /* 이니셜 아바타 공통 */
    .avatar-initial {
        display:flex; align-items:center; justify-content:center;
        border-radius:50%; color:#fff; font-weight:700; user-select:none;
    }

    .search-header {
        position: sticky; top: 0; z-index: 50;
        background: var(--color-white); padding: 12px 20px;
        border-bottom: 1px solid var(--color-border);
    }
    .search-header input[type="text"] {
        width: 100%; padding: 10px 20px; border-radius: 9999px;
        border: 1px solid var(--color-border); background-color: var(--color-bg); outline: none;
    }
    .search-header input[type="text"]::placeholder { color: #999; }

    .content-box { padding: 16px 20px; background: var(--color-white); }
    .content-box h4 { margin: 0 0 12px 0; font-size: 18px; color: var(--color-font); }

    .post-box { background: var(--color-white); padding: 16px; border-bottom: 1px solid #eee; }
    .post-box:last-child { border-bottom: none; }
    .post-info { display: flex; align-items: center; gap: 10px; }
    .post-content { margin-top: 10px; }
    .post-content img { max-width: 100%; border-radius: 8px; margin-top: 10px; display: block; }
    .post-box small { color: gray; font-size: 12px; }

    .trend-list { list-style: none; padding: 0; margin: 0; }
    .trend-item { padding: 10px 0; border-bottom: 1px solid #eee; }
    .trend-item:last-child { border-bottom: none; }
    .trend-item a { text-decoration: none; color: var(--color-font); }

    .widget {
        background: var(--color-white); border: 1px solid #e6ecf0;
        border-radius: 12px; padding: 14px 16px; margin-bottom: 16px;
    }
    .widget h4 { margin: 0 0 10px 0; font-size: 16px; font-weight: 700; color: var(--color-font); }

    .follow-list { list-style: none; padding: 0; margin: 0; }
    .follow-list li {
        margin-bottom: 12px; display: flex; align-items: center; justify-content: space-between;
    }
    .follow-list li:last-child { margin-bottom: 0; }
    .follow-btn {
        border: none; border-radius: 20px; padding: 6px 12px; cursor: pointer;
        font-weight: 700; color: var(--color-white); background: var(--color-base); white-space: nowrap;
    }
    .follow-btn:hover { background: var(--color-dark); }

    .follow-info { display: flex; align-items: center; gap: 10px; }
    .follow-info strong { font-weight: 700; color: var(--color-font); line-height: 1.2; }
    .follow-info small { font-size: 12px; color: #657786; }

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
               <a href="${ctx}/"><img src="https://i.imgur.com/xpGazxz.png" alt="Logo" /></a>
            </div>
            <ul>
                <li><a href="/community/main">🏠 홈</a></li>
                <li><a class="active" href="/community/search">🔍 검색</a></li>
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
                        <div class="avatar-initial" style="width:38px;height:38px;background:#ee853f;">
                            ${fn:substring(loginUser.name,0,1)}
                        </div>
                        <div>
                            <strong>${loginUser.name}</strong><br>
                            <span style="font-size: 12px; color: gray;">@${loginUser.id}</span>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="avatar-initial" style="width:38px;height:38px;background:#ccc;">G</div>
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
        <div class="search-header">
            <form action="/community/search" method="get">
                <input type="text" name="keyword" placeholder="검색어를 입력하세요." value="${keyword}" />
            </form>
        </div>

        <div class="content-box">
            <c:choose>
                <c:when test="${not empty keyword}">
                    <h4>"${keyword}" 검색 결과</h4>
                    <c:forEach var="post" items="${posts}">
                        <div class="post-box">
                            <div class="post-info">
                                <div class="avatar-initial" style="width:40px;height:40px;background:#eb5e00;">
                                    ${fn:substring(post.authorName,0,1)}
                                </div>
                                <div>
                                    <strong>${post.authorName}</strong><br>
                                    <small>${post.authorId}</small>
                                </div>
                            </div>
                            <div class="post-content">
                                <p>${post.content}</p>
                                <c:if test="${not empty post.imageUrl}">
                                    <img src="/upload/${post.imageUrl}" alt="게시물 이미지" />
                                </c:if>
                                <small>${post.createdAt}</small>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <h4>실시간 트렌드</h4>
                    <ul class="trend-list">
                        <c:forEach var="trend" items="${trends}">
                            <li class="trend-item">
                                <a href="/community/search?keyword=${trend.hashtag}">
                                    <strong>${trend.hashtag}</strong>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
    </main>

    <aside class="rightbar">
        <section class="widget">
            <h4>팔로우 추천</h4>
            <ul class="follow-list">
                <c:choose>
                    <c:when test="${not empty loginUser}">
                        <c:forEach var="user" items="${recommendedUsers}">
                            <li>
                                <div class="follow-info">
                                    <div class="avatar-initial" style="width:36px;height:36px;background:#ff9752;">
                                        ${fn:substring(user.name,0,1)}
                                    </div>
                                    <div>
                                        <strong>${user.name}</strong><br>
                                        <small>@${user.id}</small>
                                    </div>
                                </div>
                                <form method="post" action="/community/follow">
                                    <input type="hidden" name="targetUserId" value="${user.id}"/>
                                    <button type="submit" class="follow-btn">팔로우</button>
                                </form>
                            </li>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <li><span>로그인 시 추천 유저가 표시됩니다.</span></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </section>
    </aside>
</div>
</body>
</html>