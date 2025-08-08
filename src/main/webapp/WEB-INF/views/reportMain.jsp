<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TRACE - 관광정보 수정/신규 요청</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body, h1, h2, h3, h4, p, ul, li {
            margin: 0;
            padding: 0;
            font-family: 'Noto Sans KR', sans-serif;
            color: #333;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        ul {
            list-style: none;
        }

        .container {
            max-width: 960px;
            margin: 0 auto;
            padding: 20px 0;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            border-bottom: 1px solid #e0e0e0;
        }

        .header .logo {
            display: flex;
            align-items: center;
        }
        
        .header .logo img {
            height: 60px;
            width: auto;
            display: block;
        }
        /* TRACE 텍스트 스타일 추가 */
        .header .logo .logo-text {
            font-size: 24px;
            font-weight: 700;
            margin-left: 10px;
            color: #333;
        }

        .header .nav-menu {
            display: flex;
            gap: 25px;
        }

        .header .nav-menu li a {
            font-weight: 400;
            font-size: 15px;
            color: #555;
            transition: color 0.2s;
        }

        .header .nav-menu li a:hover {
            color: #000;
        }

        .header .user-menu {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .header .user-menu .icon {
            width: 24px;
            height: 24px;
            background-color: #eee;
            border-radius: 50%;
            border: 1px solid #ddd;
        }
        .header .user-menu .icon:first-child {
            background-color: #ccc;
        }
        .header .user-menu .icon:last-child {
            background-color: #888;
        }

        .content {
            padding: 40px 0;
        }
        
        .page-title-group {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 0 20px;
            margin-bottom: 10px;
        }
        .page-title {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 15px;
            font-weight: 400;
            margin-bottom: 5px;
            color: #777;
        }

        .page-title.main-title {
            font-size: 20px;
            font-weight: 550;
            color: #333;
        }
        .page-title .icon {
            width: 14px;
            height: 14px;
            background-color: #999;
            border-radius: 50%;
        }

        /* 수정된 부분: banner-top에 배경 이미지 추가 */
        .banner-top {
            background-color: #ee853f; /* 이미지가 로드되지 않을 경우 표시될 배경색 */
            background-image: url('/image/gam.png'); /* 여기에 'gam.jpg' 파일의 경로를 넣어주세요. */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            position: relative;
            height: 80px;
        }
        
        .banner-top .illustration {
            display: none;
        }
        
        .banner-top .content-wrapper {
            position: relative;
            z-index: 1;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            padding: 0 10px;
        }
        
        .banner-top .text {
            font-size: 15px;
            font-weight: 700;
            color: #fff;
        }

        .banner-top .button {
            background-color: #fff;
            color: #eb5e00;
            padding: 6px 14px;
            border-radius: 15px;
            font-weight: 700;
            font-size: 12px;
            transition: background-color 0.2s;
        }
        
        .my-page {
            padding: 0 20px;
            margin-bottom: 30px;
        }
        
        .my-page-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 15px;
        }

        .my-page .welcome-message {
            font-size: 15px;
            font-weight: 700;
            text-align: right;
            margin-top: 0;
            margin-bottom: 0;
        }
        
        .my-page-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .my-page-info .total-count {
            font-size: 15px;
            font-weight: 400;
            color: #555;
        }

        .my-page-info .dropdown {
            padding: 6px 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 13px;
        }

        .table-wrapper {
            border-top: 2px solid #333;
            border-bottom: 1px solid #e0e0e0;
            margin-bottom: 200px;
        }
        
        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
        }

        .table th {
            background-color: #f5f5f5;
            font-weight: 700;
        }
        
        .table-empty {
            text-align: center;
            padding: 100px;
            color: #888;
            font-size: 14px;
        }

        .bottom-section-container {
            padding: 0 20px;
            margin-top: 50px;
        }
        .bottom-section {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .banner-bottom {
            background-color: #ee853f;
            color: #fff;
            margin-top:-20%;
            padding: 10px 20px;
            border-radius: 5px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
            height: 80px;
        }
        .banner-bottom .illustration {
            display: none;
        }
        .banner-bottom .content-wrapper {
            position: relative;
            z-index: 1;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            padding: 0 10px;
        }
        .banner-bottom .text {
            font-size: 15px;
            font-weight: 700;
            color: #fff;
        }

        .banner-bottom .button {
            background-color: #fff;
            color: #eb5e00;
            padding: 6px 14px;
            border-radius: 15px;
            font-weight: 700;
            font-size: 12px;
            transition: background-color 0.2s;
        }

        .search-area {
            background-color: #fce4b3;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
            border-radius: 5px;
            height: 80px;
            position: relative;
        }

        .search-area .illustration-left,
        .search-area .illustration-right {
            display: none;
        }

        .search-box-wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 8px;
        }

        .search-box-wrapper .search-text {
            font-size: 14px;
            color: black;
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        
        .search-box {
            display: flex;
            width: 100%;
            max-width: 400px;
            border-radius: 5px;
            overflow: hidden;
        }
        
        .search-box input {
            flex-grow: 1;
            border: 1px solid #ccc;
            border-right: none;
            padding: 10px 12px;
            font-size: 13px;
            outline: none;
            border-radius: 5px 0 0 5px;
        }
        
        .search-box .search-btn {
            background-color: #ffaa00;
            color: #fff;
            border: none;
            padding: 10px 15px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            border-radius: 0 5px 5px 0;
        }
    </style>
</head>
<body>

    <div class="header">
        <div class="logo">
            <img src="https://i.imgur.com/xpGazxz.png" alt="TRACE 로고" />
        </div>
        <ul class="nav-menu">
            <li><a href="#">홈</a></li>
            <li><a href="#">테마</a></li>
            <li><a href="#">지역</a></li>
            <li><a href="#">여행코스</a></li>
            <li><a href="#">여행정보</a></li>
            <li><a href="#">여행혜택</a></li>
        </ul>
        <div class="user-menu">
            <div class="icon"></div>
            <div class="icon"></div>
            <div class="icon"></div>
            <div class="icon"></div>
        </div>
    </div>
    
    <div class="container">
        <div class="content">
            <div class="page-title-group">
                <h1 class="page-title">
                   
                </h1>
                <h2 class="page-title main-title">
                    관광정보 수정/신규 요청
                </h2>
            </div>
            
            <div class="banner-top">
                <div class="illustration"></div>
                <div class="content-wrapper">
                    <span class="text">[FAQ] 관광정보 수정/신규 요청은 처음이신가요?</span>
                    <a href="/reportMain/report1" class="button">서비스 자세히 보기</a>
                </div>
            </div>

            <div class="my-page">
                <div class="my-page-header">
                    <span class="total-count" id="total-count">총 0건 접수</span>
                    <p class="welcome-message">user 님 반갑습니다</p>
                </div>
                
                <div class="table-wrapper">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>구분</th>
                                <th>콘텐츠명</th>
                                <th>처리상태</th>
                                <th>접수일자/처리일자</th>
                            </tr>
                        </thead>
                        <tbody id="submission-list">
                            <tr>
                                <td colspan="5" class="table-empty" style ="padding:100px">
                                    등록된 수정/신규요청 건이 없습니다.
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="bottom-section-container">
                <div class="bottom-section">
                    <div class="banner-bottom">
                        <div class="illustration"></div>
                        <div class="content-wrapper">
                            <p class="text">새로운 여행정보등록을 원하시나요?</p>
                            <a href="/reportMain/report2" class="button">신규요청 바로가기</a>
                        </div>
                    </div>
    
                    <div class="search-area">
                        <div class="illustration-left"></div>
                        <div class="illustration-right"></div>
                        <div class="search-box-wrapper">
                            <p class="search-text">관광지/음식/숙박/상호명을 입력하세요.</p>
                            <div class="search-box">
                                <input type="text" placeholder="" />
                                <button class="search-btn">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>