<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TRACE 1:1 상담 채팅</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap');
        
        :root {
            --main-color: #ee853f;
            --white-color: #ffffff;
            --light-gray: #f5f5f5;
            --dark-gray: #333333;
            --border-color: #dddddd;
            --chat-bubble-bg: #f0f0f0;
            --my-bubble-bg: var(--main-color);
        }

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
        }
        
        .chat-header .header-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 20px;
            font-weight: 700;
        }
        
        .chat-header .header-bottom {
            display: flex;
            align-items: center;
            font-size: 14px;
            margin-top: 10px;
        }
        
        .chat-header .header-bottom img {
            width: 16px;
            height: 16px;
            margin-right: 5px;
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
        
        .message-row.mine {
            justify-content: flex-end;
        }

        .profile-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            flex-shrink: 0;
        }

        .message-row.mine .profile-img {
            display: none;
        }

        .message-content {
            display: flex;
            flex-direction: column;
            gap: 5px;
            max-width: 75%;
        }
        
        .message-info {
            display: flex;
            align-items: flex-end;
        }
        
        .message-row.other .message-info {
            flex-direction: row;
        }
        
        .message-row.mine .message-info {
            flex-direction: row-reverse;
        }

        .message-time {
            font-size: 12px;
            color: #999;
            margin: 0 5px;
            white-space: nowrap;
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
        
        .bubble p {
            margin: 0;
        }

        .button-list {
            display: flex;
            flex-direction: column;
            gap: 8px;
            margin-top: 10px;
        }
        
        .chat-button {
            background-color: var(--white-color);
            border: 1px solid var(--border-color);
            padding: 12px;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .chat-button:hover {
            background-color: #f0f0f0;
        }
        
        .chat-footer {
            padding: 10px 15px;
            border-top: 1px solid var(--border-color);
            background-color: var(--white-color);
            display: flex;
            align-items: center;
        }

        .chat-footer input {
            flex: 1;
            padding: 12px 20px;
            border: 1px solid #ccc;
            border-radius: 25px;
            font-size: 14px;
            margin-right: 10px;
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
            transition: background-color 0.3s ease;
        }
        
        .chat-footer button:hover {
            background-color: #e5772e;
        }
    </style>
</head>
<body>
    <div class="chat-container">
        <div class="chat-header">
            <div class="header-top">
                TRACE 1:1 상담 채팅방
            </div>
            <div class="header-bottom">
                상담 가능시간 입니다.
            </div>
        </div>
        
        <div class="chat-window" id="chatWindow">
            <div class="message-row other">
                <img src="/image/gam.png" alt="전문가 프로필" class="profile-img" />
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
                <img src="/image/gam.png" alt="전문가 프로필" class="profile-img" />
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
        // 현재 시간을 가져오는 함수
        function getCurrentTime() {
            const now = new Date();
            let hours = now.getHours();
            const minutes = now.getMinutes();
            const ampm = hours >= 12 ? '오후' : '오전';
            hours = hours % 12;
            hours = hours ? hours : 12;
            const formattedMinutes = minutes < 10 ? '0' + minutes : minutes;
            return hours + ':' + formattedMinutes + ' ' + ampm;
        }

        // 메시지를 화면에 추가하는 함수
        function addMessageToChat(message, isMine) {
            const chatWindow = document.getElementById('chatWindow');
            const messageRow = document.createElement('div');
            messageRow.className = 'message-row ' + (isMine ? 'mine' : 'other');
            
            const messageContentHtml = `<div class="bubble">${message}</div>`;
            const messageInfoHtml = `
                <div class="message-info">
                    <div class="message-content">
                        ${messageContentHtml}
                    </div>
                    <span class="message-time">${getCurrentTime()}</span>
                </div>`;
                
            if (!isMine) {
                messageRow.innerHTML = `<img src="/image/gam.png" alt="전문가 프로필" class="profile-img" />` + messageInfoHtml;
            } else {
                messageRow.innerHTML = messageInfoHtml;
            }
            
            chatWindow.appendChild(messageRow);
            chatWindow.scrollTop = chatWindow.scrollHeight;
        }

        // 입력창에 메시지를 보내는 함수
        function sendMessage() {
            const input = document.getElementById('chatMessageInput');
            const message = input.value.trim();
            if (message === '') return;
            
            addMessageToChat(message, true);
            input.value = '';
        }
        
        // DOMContentLoaded 이벤트 발생 시 이벤트 리스너 연결
        document.addEventListener('DOMContentLoaded', () => {
            const sendMessageButton = document.getElementById('sendMessageButton');
            const chatMessageInput = document.getElementById('chatMessageInput');
            
            sendMessageButton.addEventListener('click', sendMessage);

            chatMessageInput.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    sendMessage();
                }
            });
            
            document.querySelectorAll('.chat-button').forEach(button => {
                button.addEventListener('click', function() {
                    const buttonText = this.innerText;
                    addMessageToChat(buttonText, true);
                });
            });
        });
    </script>
</body>
</html>