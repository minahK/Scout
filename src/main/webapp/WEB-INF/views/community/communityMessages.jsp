<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>채팅</title>
<meta name="viewport" content="width=device-width, initial-s cale=1.0">
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

* {
	box-sizing: border-box;
}

html, body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: var(--color-bg);
	height: 100%;
}

.layout {
	display: grid;
	grid-template-columns: 260px 300px 1fr;
	min-height: 100vh;
	margin: 0 auto;
	background: var(--color-white);
}

.sidebar {
	background: var(--color-white);
	border-right: 1px solid var(--color-border);
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	padding: 16px 12px;
	position: sticky;
	top: 0;
	height: 100vh;
}

.inbox {
	border-right: 1-px solid var(--color-border);
	background: var(--color-white);
}

.inbox-header {
	padding: 12px 20px;
	border-bottom: 1px solid var(--color-border);
	position: sticky;
	top: 0;
	background-color: var(--color-white);
	display: flex;
	align-items: center;
}

.inbox-header h3 {
	margin: 0;
	font-size: 20px;
}

.inbox-search {
	padding: 12px 20px;
	background-color: var(--color-white);
	border-bottom: 1px solid var(--color-border);
}

.inbox-search input {
	width: 100%;
	padding: 10px;
	border-radius: 9999px;
	border: 1px solid var(--color-border);
	background-color: var(--color-bg);
	outline: none;
}

.inbox-list {
	list-style: none;
	padding: 0;
	margin: 0;
	overflow-y: auto;
	height: calc(100vh - 120px);
}

.inbox-list li {
	padding: 15px 20px;
	border-bottom: 1px solid var(--color-border);
	cursor: pointer;
}

.inbox-list li.selected {
	background-color: #e8f5fe;
}

.chat {
	display: flex;
	flex-direction: column;
	background-color: var(--color-white);
}

.chat-header {
	background-color: var(--color-white);
	padding: 12px 20px;
	border-bottom: 1px solid var(--color-border);
	font-weight: bold;
	font-size: 16px;
	position: sticky;
	top: 0;
	z-index: 10;
}

.message-list {
	flex: 1;
	padding: 20px;
	overflow-y: auto;
	background-color: var(--color-bg);
}

.message {
	max-width: 60%;
	padding: 12px;
	margin-bottom: 10px;
	border-radius: 18px;
	position: relative;
	clear: both;
	line-height: 1.4;
}

.message.sent {
	background-color: var(--color-dark);
	color: var(--color-white);
	margin-left: auto;
}

.message.received {
	background-color: var(--color-white);
	color: var(--color-font);
	border: 1px solid var(--color-border);
}

.message .meta {
	font-size: 11px;
	color: #888;
	margin-top: 5px;
	text-align: right;
}

.message.sent .meta {
	color: #fff;
}

.input-area {
	padding: 15px 20px;
	border-top: 1px solid var(--color-border);
	background-color: var(--color-white);
	display: flex;
	align-items: center;
}

.input-area form {
	display: flex;
	gap: 10px;
	width: 100%;
}

.input-area input[type="text"] {
	flex: 1;
	padding: 12px 20px;
	border-radius: 9999px;
	border: 1px solid var(--color-border);
	background-color: var(--color-bg);
	outline: none;
	font-size: 14px;
}

/* ===== 사이드바 ===== */
.sidebar-logo {
	text-align: center;
	margin-bottom: 15px;
}

.sidebar-logo img {
	width: 90%;
}

.sidebar ul {
	list-style: none;
	margin: 16px 0 0;
	padding: 0;
}

.sidebar ul li {
	margin-bottom: 8px;
}

.sidebar a {
	display: block;
	padding: 10px 14px;
	border-radius: 9999px;
	text-decoration: none;
	color: var(--color-font);
	font-weight: 700;
}

.sidebar a:hover {
	background: #f3f3f3;
}

.sidebar a.active {
	background: #dfeee6;
	font-weight: bold;
}

.sidebar-bottom {
	border-top: 1px solid var(--color-border);
	padding-top: 12px;
}

.sidebar-profile {
	display: flex;
	align-items: center;
	gap: 10px;
}

/* 이니셜 아바타 (이미지 컬럼 제거 대응) */
.avatar-initial {
	width: 38px;
	height: 38px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: 700;
	background: #eee;
	color: #444;
	border: 1px solid var(--color-border);
}

/* 버튼 */
.btn {
	padding: 10px 20px;
	border: none;
	border-radius: 9999px;
	cursor: pointer;
	font-weight: 700;
	color: var(--color-white);
	background: var(--color-dark);
	font-size: 14px;
}

.btn:hover {
	background: var(--color-base);
}

/* ===== 모달 스타일 ===== */
.modal-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1000;
}

.modal-content {
	background-color: var(--color-white);
	width: 450px;
	height: 600px;
	border-radius: 12px;
	overflow: hidden;
	display: flex;
	flex-direction: column;
}

.modal-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 12px 20px;
	border-bottom: 1px solid var(--color-border);
	font-weight: bold;
}

.modal-header h3 {
	margin: 0;
	font-size: 18px;
}

.modal-header button {
	background: none;
	border: none;
	cursor: pointer;
	font-size: 16px;
	font-weight: bold;
	color: #888;
}

.modal-header .btn.primary {
	background-color: var(--color-base);
	color: var(--color-white);
	padding: 8px 16px;
	border-radius: 20px;
	font-weight: bold;
}

.modal-body {
	padding: 15px 20px;
}

.modal-body .search-input {
	width: 100%;
	padding: 10px 20px;
	border-radius: 9999px;
	border: 1px solid var(--color-border);
	background-color: var(--color-bg);
	outline: none;
}

.modal-body .group-button {
	margin-top: 15px;
	text-align: center;
}

.modal-body .group-button button {
	background: none;
	border: none;
	font-size: 16px;
	color: var(--color-base);
	cursor: pointer;
	font-weight: bold;
}

.modal-user-list {
	list-style: none;
	padding: 0;
	margin: 0;
	flex: 1;
	overflow-y: auto;
}

.modal-user-list li {
	padding: 15px 20px;
	border-bottom: 1px solid var(--color-border);
	cursor: pointer;
}

.modal-user-list li:hover {
	background-color: var(--color-bg);
}

.user-item {
	display: flex;
	align-items: center;
	gap: 10px;
}
.user-item .avatar-initial {
	background-color: #eee;
	color: #444;
}
.user-info {
	flex: 1;
}

.hidden {
	display: none;
}

@media screen and (max-width:1024px) {
	.layout {
		grid-template-columns: 1fr;
	}
	.sidebar, .inbox {
		display: none;
	}
	.chat {
		width: 100%;
	}
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
					<li><a href="${pageContext.request.contextPath}/community/main">🏠 홈</a></li>
					<li><a href="${pageContext.request.contextPath}/community/search">🔍 검색</a></li>
					<li><a href="${pageContext.request.contextPath}/community/notifications">🔔 알림</a></li>
					<li><a class="active" href="${pageContext.request.contextPath}/community/messages?roomId=${currentRoomId}">✉️ 채팅</a></li>
					<li><a href="${pageContext.request.contextPath}/community/communities">👥 커뮤니티</a></li>
					<li><a href="${pageContext.request.contextPath}/community/profile">🧑‍ 프로필</a></li>
					<li><a href="${pageContext.request.contextPath}/community/settings/account">⚙️ 설정</a></li>
				</ul>
			</div>
		</div>

		<div class="inbox">
			<div class="inbox-header" style="display:flex; align-items:center;">
			  <h3 style="margin:0;">쪽지</h3>
			  <button id="start-chat-btn" class="btn"
			          style="margin-left:auto; padding:8px 14px; border:0; border-radius:999px;
			                 background:var(--color-base, #ee853f); color:#fff; font-weight:700; cursor:pointer;">
			    새 쪽지
			  </button>
			</div>
			<div class="inbox-search">
			    <input type="text" placeholder="쪽지 검색하기" />
			</div>
			<ul class="inbox-list">
				<c:forEach var="room" items="${chatRooms}">
					<li class="${room.chatRoomId == currentRoomId ? 'selected' : ''}">
						<a
						href="${pageContext.request.contextPath}/community/messages?roomId=${room.chatRoomId}"
						style="text-decoration: none; color: inherit;"> <strong>${room.roomName}</strong><br>
					</a>
					</li>
				</c:forEach>
			</ul>
		</div>

		<div class="chat">
			<div class="chat-header">
				<c:forEach var="room" items="${chatRooms}">
					<c:if test="${room.chatRoomId == currentRoomId}">
                    ${room.roomName}
                </c:if>
				</c:forEach>
			</div>

			<div class="message-list">
				<c:forEach var="msg" items="${messages}">
					<div
						class="message ${msg.senderId == loginUser.userId ? 'sent' : 'received'}">
						<div>${msg.content}</div>
						<div class="meta">${msg.sentAt}</div>
					</div>
				</c:forEach>
			</div>

			<div class="input-area">
			    <form id="message-form">
			        <input type="hidden" name="roomId" value="${currentRoomId}" />
			        <input type="text" id="message-content" name="content" placeholder="새 쪽지 작성하기" required />
			        <button type="submit" class="btn">전송</button>
			    </form>
			</div>
		</div>
	</div>

    <div id="new-message-modal" class="modal-overlay hidden">
        <div class="modal-content">
            <div class="modal-header">
                <button class="modal-close-btn">❌</button>
                <h3>새 쪽지</h3>
                <button class="btn primary" id="next-step-btn">다음</button>
            </div>
            <div class="modal-body">
                <input type="text" id="user-search-input" placeholder="사용자 검색" class="search-input">
                <div class="group-button">
                    <button>그룹 만들기</button>
                </div>
            </div>
            <ul id="modal-user-list-ul" class="modal-user-list">
                <c:forEach var="user" items="${recommendedUsers}">
                    <li class="user-item-li" data-user-id="${user.userId}" data-nickname="${user.nickname}" data-handle="${user.handle}">
                        <div class="user-item">
                            <div class="avatar-initial">${fn:substring(user.nickname,0,1)}</div>
                            <div class="user-info">
                                <strong>${user.nickname}</strong><br>
                                <span style="font-size: 12px; color: gray;">@${user.handle}</span>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

	<script>
    document.addEventListener('DOMContentLoaded', function() {
        const messageForm = document.getElementById('message-form');
        const messageContentInput = document.getElementById('message-content');
        const messageList = document.querySelector('.message-list');
        const currentRoomIdInput = document.querySelector('input[name="roomId"]');
        const loginUserId = ${loginUser.userId};

        messageForm.addEventListener('submit', function(e) {
            e.preventDefault();

            const content = messageContentInput.value.trim();
            if (content === "") {
                return;
            }

            const formData = new FormData();
            formData.append('roomId', currentRoomIdInput.value);
            formData.append('content', content);

            fetch('${pageContext.request.contextPath}/community/messages/send', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(result => {
                if (result === 'success') {
                    addMessageToChat(content, loginUserId, new Date().toLocaleString());
                    messageContentInput.value = '';
                    messageList.scrollTop = messageList.scrollHeight;
                } else {
                    console.error('메시지 전송 실패');
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
        });

        function addMessageToChat(content, senderId, sentAt) {
            const messageDiv = document.createElement('div');
            const isSent = senderId == loginUserId;
            messageDiv.className = `message ${isSent ? 'sent' : 'received'}`;
            
            messageDiv.innerHTML = `
                <div>${content}</div>
                <div class="meta">${sentAt}</div>
            `;
            messageList.appendChild(messageDiv);
        }

        const newMessageBtn = document.getElementById('start-chat-btn');
        const modal = document.getElementById('new-message-modal');
        const modalCloseBtn = document.querySelector('.modal-close-btn');
        const userSearchInput = document.getElementById('user-search-input');
        const modalUserListUl = document.getElementById('modal-user-list-ul');

        // 서버에서 전달받은 recommendedUsers 데이터를 JavaScript 배열로 저장
        const allUsers = [
            <c:forEach var="user" items="${recommendedUsers}" varStatus="loop">
                {
                    userId: ${user.userId},
                    nickname: "${user.nickname}",
                    handle: "${user.handle}"
                }${!loop.last ? ',' : ''}
            </c:forEach>
        ];

        // 초기 화면 렌더링
        renderUserList(allUsers);

        // 검색어 입력 시 사용자 목록 필터링
        userSearchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const filteredUsers = allUsers.filter(user => 
                user.nickname.toLowerCase().includes(searchTerm) || 
                user.handle.toLowerCase().includes(searchTerm)
            );
            renderUserList(filteredUsers);
        });

        // 사용자 목록 렌더링 함수
        function renderUserList(users) {
            modalUserListUl.innerHTML = '';
            users.forEach(user => {
                const li = document.createElement('li');
                li.className = 'user-item-li';
                li.setAttribute('data-user-id', user.userId);
                li.setAttribute('data-nickname', user.nickname);
                li.setAttribute('data-handle', user.handle);
                li.innerHTML = `
                    <div class="user-item">
                        <div class="avatar-initial">${user.nickname.substring(0, 1)}</div>
                        <div class="user-info">
                            <strong>${user.nickname}</strong><br>
                            <span style="font-size: 12px; color: gray;">@${user.handle}</span>
                        </div>
                    </div>
                `;
                modalUserListUl.appendChild(li);
            });
        }

        // 모달 열기/닫기 이벤트 리스너
        newMessageBtn.addEventListener('click', function() {
            modal.classList.remove('hidden');
            userSearchInput.value = '';
            renderUserList(allUsers); // 모달 열 때 전체 목록 다시 렌더링
        });

        modalCloseBtn.addEventListener('click', function() {
            modal.classList.add('hidden');
        });

        modal.addEventListener('click', function(e) {
            if (e.target === modal) {
                modal.classList.add('hidden');
            }
        });

        // 사용자 목록 클릭 이벤트 (채팅방 생성)
        modalUserListUl.addEventListener('click', function(e) {
            const li = e.target.closest('.user-item-li');
            if (li) {
                const targetUserId = li.dataset.userId;
                // 채팅방 생성 로직 (컨트롤러에 POST 요청)
                // 예시: fetch('/community/messages/create', { method: 'POST', body: JSON.stringify({ targetUserId }) })
                alert(`${li.dataset.nickname}님과 채팅방을 생성합니다! (ID: ${targetUserId})`);
                modal.classList.add('hidden');
            }
        });
    });
    </script>
</body>
</html>
근데 자바스크립트에서 loginUser.userId에서 빨간 줄 떠