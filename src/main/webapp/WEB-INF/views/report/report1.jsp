<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주 묻는 질문</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body, h1, h2, h3, h4, p, ul, li, input, button {
            margin: 0;
            padding: 0;
            font-family: 'Noto Sans KR', sans-serif;
            color: #333;
            box-sizing: border-box;
        }
        
        a {
            text-decoration: none;
            color: inherit;
        }
        
        ul {
            list-style-type: none;
        }

        .container {
            max-width: 960px;
            margin: 0 auto;
            padding: 20px;
        }

        .page-title {
            font-size: 24px;
            font-weight: 700;
            margin: 40px 0 20px 0;
            text-align: center;
        }
        
        .tab-menu {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }

        .tab-menu button {
            padding: 8px 40px;
            font-size: 14px;
            font-weight: 700;
            color: #ee853f;
            background-color: #f0f0f0;
            border: none;
            cursor: pointer;
            transition: background-color 0.2s, color 0.2s;
        }

        .tab-menu button.active {
            color: #fff;
            background-color: #ee853f;
        }

        .tab-menu button:first-child {
            border-radius: 5px 0 0 5px;
        }
        
        .tab-menu button:last-child {
            border-radius: 0 5px 5px 0;
        }

        .search-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .search-box {
            display: flex;
            width: 100%;
            max-width: 600px;
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
            margin-bottom: 15px;
        }

        .search-box input {
            flex-grow: 1;
            padding: 10px;
            font-size: 13px;
            background-color: #f2f2f2;
            border: none;
            outline: none;
        }
        
        .search-box input::placeholder {
            font-size: 13px;
            color: #777;
        }

        .search-box button {
            background-color: #fff;
            border: none;
            padding: 0 15px;
            cursor: pointer;
        }

        .search-box button img {
            width: 20px;
            height: 20px;
        }

        .tags {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 15px;
        }
        
        .tag-btn {
            background-color: #f0f0f0;
            color: #555;
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 400;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        
        .tag-btn.active {
            background-color: #333;
            color: #fff;
        }

        .faq-list {
            margin-top: 40px;
            border-top: 2px solid #333;
        }

        .faq-item {
            border-bottom: 1px solid #e0e0e0;
        }

        .faq-question {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 400;
        }
        
        .faq-question div {
            font-weight: 400;
        }

        .faq-question .toggle-icon {
            width: 14px;
            height: 14px;
            transition: transform 0.3s;
        }

        .faq-answer {
            background-color: #f8f8f8;
            padding: 20px;
            font-size: 15px;
            display: none;
        }
        
        .faq-item.active .faq-question .toggle-icon {
            transform: rotate(180deg);
        }
        
        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }
    </style>
</head>
<body>
	<%@ include file="../travelDestination/tdHeader.jsp"%>
	
    <div class="container">
        <h1 class="page-title">자주 묻는 질문</h1>

        <div class="tab-menu">
            <button class="tab-btn" data-tab="user">일반 사용자</button>
            <button class="tab-btn" data-tab="biz">지자체/여행업계 담당자</button>
        </div>

        <div id="user" class="tab-content active">
            <div class="search-container">
                <div class="search-box">
                    <input type="text" placeholder="궁금한 내용을 검색해 보세요.">
                    <button><img src="https://i.imgur.com/gK9u3jO.png" alt="검색 아이콘"></button>
                </div>
            </div>

            <div class="faq-list">
                <div class="faq-item">
                    <div class="faq-question">
                        <div>TRACE는 어떤 서비스인가요?</div>
                        <span class="toggle-icon">&#x25BC;</span>
                    </div>
                    <div class="faq-answer">
                        <p>TRACE는 여행객들이 자유롭게 관광 정보를 검색하고, 다양한 테마별 여행 코스를 탐색할 수 있도록 돕는 서비스입니다. 별도의 회원가입 없이 누구나 편리하게 이용할 수 있습니다.</p>
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        <div>제가 직접 새로운 여행지를 추천하거나 등록할 수 있나요?</div>
                        <span class="toggle-icon">&#x25BC;</span>
                    </div>
                    <div class="faq-answer">
                        <p>네, 가능합니다. '관광정보 신규 요청' 메뉴를 통해 새로운 여행지에 대한 정보를 작성해 주시면, TRACE에서 해당 정보를 검토한 후 사이트에 반영할 수 있습니다.</p>
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        <div>제공되는 여행 정보는 신뢰할 수 있나요?</div>
                        <span class="toggle-icon">&#x25BC;</span>
                    </div>
                    <div class="faq-answer">
                        <p>TRACE의 모든 여행 정보는 공공기관 및 신뢰할 수 있는 파트너사를 통해 제공됩니다. 최신 정보 유지를 위해 주기적으로 업데이트하고 있으며, 혹시 오류가 있는 경우 '관광정보 수정 요청' 메뉴를 통해 알려주시면 신속하게 조치하겠습니다.</p>
                    </div>
                </div>
                 <div class="faq-item">
                    <div class="faq-question">
                        <div>TRACE에서 다른 사용자들이 올린 여행 후기를 볼 수 있나요?</div>
                        <span class="toggle-icon">&#x25BC;</span>
                    </div>
                    <div class="faq-answer">
                        <p>현재는 다른 사용자의 후기를 직접 볼 수 있는 기능은 제공하지 않습니다. 하지만, '여행 정보' 메뉴에서 다양한 블로그와 소셜 미디어의 여행 후기 링크를 찾아볼 수 있습니다.</p>
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        <div>서비스 이용 중 오류가 발생했는데, 어떻게 해야 하나요?</div>
                        <span class="toggle-icon">&#x25BC;</span>
                    </div>
                    <div class="faq-answer">
                        <p>서비스 이용에 불편을 드려 죄송합니다. 오류가 발생한 상황과 사용하고 계신 브라우저 정보 등을 상세하게 작성하여 '1:1 문의'를 통해 알려주시면, 빠르게 확인하고 해결하도록 노력하겠습니다.</p>
                    </div>
                </div>
                 <div class="faq-item">
                    <div class="faq-question">
                        <div>TRACE를 이용하려면 회원가입이나 로그인이 필요한가요?</div>
                        <span class="toggle-icon">&#x25BC;</span>
                    </div>
                    <div class="faq-answer">
                        <p>TRACE는 별도의 회원가입이나 로그인 없이 모든 서비스를 이용할 수 있습니다. 개인화된 서비스나 맞춤형 정보를 제공하지 않기 때문에, 모든 사용자가 동일한 정보에 접근할 수 있습니다.</p>
                    </div>
                </div>
                 <div class="faq-item">
                    <div class="faq-question">
                        <div>문의사항이 있는데, 어디에 연락해야 하나요?</div>
                        <span class="toggle-icon">&#x25BC;</span>
                    </div>
                    <div class="faq-answer">
                        <p>웹사이트 하단의 '1:1 문의' 또는 '고객센터'를 통해 문의사항을 남겨주시면, 담당자가 확인 후 답변을 드릴 것입니다. 문의량이 많을 경우 답변이 다소 지연될 수 있는 점 양해 부탁드립니다.</p>
                    </div>
                </div>
            </div>
        </div>

        <div id="biz" class="tab-content">
            <div class="search-container">
                <div class="search-box">
                    <input type="text" placeholder="궁금한 내용을 검색해 보세요.">
                    <button><img src="https://i.imgur.com/gK9u3jO.png" alt="검색 아이콘"></button>
                </div>
              
            </div>

            <div class="faq-list">
                <div class="faq-item">
                    <div class="faq-question">
                        <div>TRACE에 등록된 관광지 정보를 수정하려면 어떻게 하나요?</div>
                        <span class="toggle-icon">&#x25BC;</span>
                    </div>
                    <div class="faq-answer">
                        <p>수정하려는 관광지 페이지 하단의 '정보수정요청' 버튼을 누르거나,
                           고객센터로 문의해주시면 수정해 드립니다.
                        </p>
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        <div>TRACE에 등록된 여행 기사 및 사진을 사용할 수 있나요?</div>
                        <span class="toggle-icon">&#x25BC;</span>
                    </div>
                    <div class="faq-answer">
                        <p>네, 가능합니다. 이용약관에 따라 자유롭게 사용하실 수 있습니다.</p>
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        <div>TRACE에 신규 관광지 정보를 등록하려면 어떻게 하나요?</div>
                        <span class="toggle-icon">&#x25BC;</span>
                    </div>
                    <div class="faq-answer">
                        <p>관광지 정보 등록은 '마이페이지 > 관광정보 수정/신규 요청'에서 신청할 수 있습니다.
                           신청이 완료되면 담당자 검토 후 등록이 진행됩니다.
                        </p>
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        <div>등록이 불가능한 관광지점의 기준은 무엇인가요?</div>
                        <span class="toggle-icon">&#x25BC;</span>
                    </div>
                    <div class="faq-answer">
                        <p>
                            1. 특정 종교를 목적으로 하는 시설<br>
                            2. 미풍양속을 저해하거나 반사회적인 시설<br>
                            3. 개인의 영리 목적을 위해 상시적으로 운영되는 시설 (프랜차이즈 등)<br>
                            4. 단순 임시 행사 시설<br>
                            5. 기타 TRACE의 목적에 부합하지 않는 시설
                        </p>
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        <div>TRACE에 등록된 정보에 오류가 있을 경우 어떻게 하나요?</div>
                        <span class="toggle-icon">&#x25BC;</span>
                    </div>
                    <div class="faq-answer">
                        <p>해당 정보 페이지 하단의 '정보수정요청' 버튼을 통해 수정 요청을 해주시면, 담당자가 확인 후 처리해 드립니다.</p>
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        <div>음식점의 경우 프랜차이즈 업체는 등록이 불가능한가요?</div>
                        <span class="toggle-icon">&#x25BC;</span>
                    </div>
                    <div class="faq-answer">
                        <p>네, 프랜차이즈 업체는 등록이 불가능합니다.</p>
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        <div>축제/공연/행사 정보 등록 시 필요한 서류가 있나요?</div>
                        <span class="toggle-icon">&#x25BC;</span>
                    </div>
                    <div class="faq-answer">
                        <p>행사 관련 공식 포스터, 사업자등록증 사본, 기타 홍보자료 등을 첨부해주시면 등록 심사에 도움이 됩니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const tabButtons = document.querySelectorAll('.tab-btn');
            const faqQuestions = document.querySelectorAll('.faq-question');
            const tabContents = document.querySelectorAll('.tab-content');

            tabButtons.forEach(btn => {
                btn.addEventListener('click', () => {
                    tabButtons.forEach(b => b.classList.remove('active'));
                    btn.classList.add('active');

                    tabContents.forEach(content => content.classList.remove('active'));
                    const targetTab = document.getElementById(btn.dataset.tab);
                    if (targetTab) {
                        targetTab.classList.add('active');
                    }
                });
            });
            // 초기 로드 시 '일반 사용자' 탭을 활성화
            document.querySelector('.tab-menu .tab-btn[data-tab="user"]').classList.add('active');
            document.getElementById('user').classList.add('active');

            faqQuestions.forEach(item => {
                item.addEventListener('click', () => {
                    const parent = item.closest('.faq-item');
                    parent.classList.toggle('active');
                    const answer = parent.querySelector('.faq-answer');
                    if (answer) {
                        if (answer.style.display === 'block') {
                            answer.style.display = 'none';
                        } else {
                            answer.style.display = 'block';
                        }
                    }
                });
            });
        });
    </script>
</body>
</html>