<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>TRACE 1:1 상담 채팅</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap');

        :root {
            --main-color: #ee853f;   /* 기본색 */
            --main-dark: #eb5e00;    /* 진한색 */
            --light-gray: #f5f5f5;
            --white-color: #ffffff;
            --dark-gray: #333333;
            --border-color: #dddddd;
            --chat-bubble-bg: #f0f0f0;
            --my-bubble-bg: var(--main-color);
        }

        * { box-sizing: border-box; }
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: var(--light-gray);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .chat-container {
            width: 100%;
            max-width: 600px;
            height: 95vh;
            display: flex;
            flex-direction: column;
            background-color: var(--white-color);
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }

        .chat-header {
            background-color: var(--main-color);
            color: var(--white-color);
            padding: 20px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            font-weight: 700;
            font-size: 18px;
        }

        .chat-window {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .message-row {
            display: flex;
            align-items: flex-end;
            gap: 10px;
        }
        .message-row.mine { justify-content: flex-end; }

        .profile-img {
            width: 40px; height: 40px;
            border-radius: 50%;
            object-fit: cover;
            flex-shrink: 0;
        }
        .message-row.mine .profile-img { display: none; }

        .message-info {
            display: flex;
            align-items: flex-end;
        }
        .message-row.other .message-info { flex-direction: row; }
        .message-row.mine  .message-info { flex-direction: row-reverse; }

        .message-content {
            display: flex;
            flex-direction: column;
            gap: 5px;
            max-width: 75%;
        }

        .bubble {
            padding: 12px 18px;
            border-radius: 20px;
            line-height: 1.5;
            word-break: break-all;
            background-color: var(--chat-bubble-bg);
            color: var(--dark-gray);
        }
        .message-row.mine .bubble {
            background-color: var(--my-bubble-bg);
            color: var(--white-color);
        }

        .message-time {
            font-size: 12px;
            color: #999;
            margin: 0 5px;
            white-space: nowrap;
        }

        .button-list { display: flex; flex-direction: column; gap: 8px; margin-top: 10px; }
        .chat-button {
            background-color: var(--white-color);
            border: 1px solid var(--border-color);
            padding: 12px;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: background-color .2s;
        }
        .chat-button:hover { background-color: #f0f0f0; }

        .chat-footer {
            padding: 10px 15px;
            border-top: 1px solid var(--border-color);
            background-color: var(--white-color);
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .chat-footer input {
            flex: 1;
            padding: 12px 20px;
            border: 1px solid #ccc;
            border-radius: 25px;
            font-size: 14px;
            outline: none;
        }
        .chat-footer button {
            background-color: var(--my-bubble-bg);
            color: var(--white-color);
            border: none;
            border-radius: 25px;
            padding: 12px 25px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: background-color .2s;
        }
        .chat-footer button:hover { background-color: var(--main-dark); }
    </style>
</head>
<body>
<div class="chat-container">
    <div class="chat-header">TRACE 1:1 상담 채팅방</div>

    <div class="chat-window" id="chatWindow">
        <!-- 초기 안내 메시지들 -->
        <div class="message-row other">
            <img src="/image/gam.png" alt="전문가 프로필" class="profile-img"/>
            <div class="message-info">
                <div class="message-content">
                    <div class="bubble">
                        <p>1:1 채팅을 요청하셨습니다. 채팅 내용은 상담 품질 관리를 위해 TRACE 상담안내에 저장됩니다. 상담을 시작하려면 메시지를 입력해주세요. 채팅을 원치 않으시면 "종료"를 입력해주세요.</p>
                    </div>
                </div>
                <span class="message-time">5:15 오후</span>
            </div>
        </div>

        <div class="message-row other">
            <img src="/image/gam.png" alt="전문가 프로필" class="profile-img"/>
            <div class="message-info">
                <div class="message-content">
                    <div class="bubble">
                        <p>언어를 선택해주세요. 미 선택 시 상담사 연결이 불가합니다.</p>
                        <p>(Please choose your language to start a chat with a tourism information representative. You won't be connected to a representative unless you select a language.)</p>
                    </div>
                    <div class="button-list">
                        <button class="chat-button">한국어</button>
                        <button class="chat-button">English</button>
                        <button class="chat-button">日本語</button>
                        <button class="chat-button">中文(简体)</button>
                        <button class="chat-button">中文(繁體)</button>
                    </div>
                </div>
                <span class="message-time">5:15 오후</span>
            </div>
        </div>

        <div class="message-row mine">
            <div class="message-info">
                <div class="message-content">
                    <div class="bubble">한국어 선택</div>
                </div>
                <span class="message-time">5:15 오후</span>
            </div>
        </div>
    </div>

    <div class="chat-footer">
        <input type="text" id="chatMessageInput" placeholder="메시지를 입력하세요..." />
        <button id="sendMessageButton">보내기</button>
    </div>
</div>

<script>
    // 현재 시간 문자열 (오전/오후 HH:mm)
    function getCurrentTime() {
        const now = new Date();
        let h = now.getHours();
        const m = now.getMinutes();
        const ampm = h >= 12 ? '오후' : '오전';
        h = h % 12; if (h === 0) h = 12;
        const mm = (m < 10 ? '0' : '') + m;
        return h + ':' + mm + ' ' + ampm;
    }

    // 메시지를 화면에 추가 (DOM으로 구성: JSP EL 충돌 없음)
    function addMessageToChat(message, isMine) {
        const chatWindow = document.getElementById('chatWindow');

        const row = document.createElement('div');
        row.className = 'message-row ' + (isMine ? 'mine' : 'other');

        if (!isMine) {
            const img = document.createElement('img');
            img.src = '/image/gam.png';
            img.alt = '전문가 프로필';
            img.className = 'profile-img';
            row.appendChild(img);
        }

        const info = document.createElement('div');
        info.className = 'message-info';

        const content = document.createElement('div');
        content.className = 'message-content';

        const bubble = document.createElement('div');
        bubble.className = 'bubble';
        bubble.textContent = message; // XSS 방지: 텍스트로 삽입

        const time = document.createElement('span');
        time.className = 'message-time';
        time.textContent = getCurrentTime();

        content.appendChild(bubble);
        info.appendChild(content);
        info.appendChild(time);
        row.appendChild(info);

        chatWindow.appendChild(row);
        chatWindow.scrollTop = chatWindow.scrollHeight;
    }

    function sendMessage() {
        const input = document.getElementById('chatMessageInput');
        const message = input.value.trim();
        if (!message) return;
        addMessageToChat(message, true);
        input.value = '';
    }

    document.addEventListener('DOMContentLoaded', function () {
        const sendBtn = document.getElementById('sendMessageButton');
        const input = document.getElementById('chatMessageInput');

        sendBtn.addEventListener('click', sendMessage);
        input.addEventListener('keydown', function (e) {
            if (e.key === 'Enter') sendMessage();
        });

        document.querySelectorAll('.chat-button').forEach(function (btn) {
            btn.addEventListener('click', function () {
                addMessageToChat(this.innerText, true);
            });
        });
    });
</script>
</body>
</html>
