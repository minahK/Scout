<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <title>여행코스 리스트</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/colors.css" />

  <!-- === 네비게이션 CSS === -->
  <style>
    body { margin:0; font-family:'Noto Sans KR',sans-serif; padding-top:70px; background:#fff; }
    .top-nav {
      background:#fff!important; border-bottom:1px solid transparent;
      display:flex; justify-content:space-between; align-items:center;
      padding:18px 60px 18px 45px; position:fixed; top:0; left:0; right:0; z-index:1000;
      box-shadow:0 2px 10px rgba(0,0,0,0.1);
    }
    .top-nav .logo a { display:flex; align-items:center; text-decoration:none; }
    .top-nav .logo img { height:35px; }
    .top-nav .menu { display:flex; gap:38px; font-size:18px; }
    .top-nav .menu a {
      text-decoration:none; color:#222; font-weight:500;
      padding:3px 2px; border-bottom:2px solid transparent; transition:.15s;
    }
    .top-nav .menu a:hover,
    .top-nav .menu a.active { font-weight:700; border-bottom:2px solid #222; }
    .top-nav .icons { display:flex; gap:20px; font-size:22px; color:#222; }
    .top-nav .icons i { cursor:pointer; }
    .dropdown { display:none; /* …rest of dropdown styling… */ }
    .menu-item:hover .dropdown { display:block; }
    @media(max-width:900px){ .top-nav{flex-direction:column;} }
  </style>

  <!-- === 카드뷰 스타일 === -->
  <style>
    .container { max-width:850px; margin:110px auto 40px; }
    .course-top-bar { font-size:1.10em; margin:30px 0 18px; color:#222; }
    .course-top-bar .total-count { color:#2176ff; font-weight:bold; }
    .course-top-bar .order-btns { float:right; }
    .course-top-bar .order-btns a {
      margin-left:16px; color:#616161; text-decoration:none; font-weight:500;
      transition:color .13s;
    }
    .course-top-bar .order-btns a.active,
    .course-top-bar .order-btns a:hover { color:#ee853f; font-weight:700; }

    .course-cards { display:flex; flex-direction:column; gap:28px; }
    .course-card {
      display:flex; background:#fff; border-radius:18px;
      box-shadow:0 2px 14px rgba(255,151,82,0.10);
      padding:18px 23px; align-items:flex-start; gap:18px;
    }
    .card-img img {
      width:112px; height:80px; border-radius:11px; object-fit:cover;
    }
    .card-main { flex:1; min-width:0; }
    .card-title { font-size:1.15em; color:#2a2012; font-weight:700; margin-bottom:6px; }
    .card-meta { color:#3c3b39; font-size:0.99em; margin-bottom:2px; }
    .card-tags { margin-top:7px; display:flex; flex-wrap:wrap; gap:7px; }
    .dest-tag {
      background:#f5e1cf; color:#ee853f; font-size:0.99em;
      border-radius:7px; padding:2px 9px;
    }
    .card-side { display:flex; flex-direction:column; align-items:flex-end; }
    .card-distance { color:#888; font-size:0.97em; margin-bottom:16px; }
    .card-etc-btn {
      background:none; border:none; font-size:1.6em; color:#bababa; cursor:pointer;
    }
  </style>
</head>

<body>
  <!-- 네비게이션 바 -->
  <div class="top-nav">
    <div class="logo">
      <a href="/"><img src="https://i.imgur.com/xpGazxz.png" alt="Logo"/></a>
    </div>
    <div class="menu">
      <div class="menu-item"><a href="/" class="active">홈</a></div>
      <div class="menu-item"><a href="theme.jsp">테마</a></div>
      <div class="menu-item"><a href="theme.jsp">추천코스</a></div>
      <div class="menu-item">
        <a href="javascript:void(0)">여행정보</a>
        <div class="dropdown">
          <div class="dropdown-list">
            <a href="/travelDestination?sort=recent">여행지</a>
            <a href="#">여행기사</a>
            <a href="#">여행행사</a>
          </div>
        </div>
      </div>
    </div>
    <div class="icons">
      <i class="fa fa-search"></i>
      <i class="fas fa-comments"></i>
      <i class="fa fa-user"></i>
      <i class="fa fa-globe"></i>
    </div>
  </div>

  <!-- 컨텐츠: 여행코스 리스트 -->
  <div class="container">
    <div class="course-top-bar">
      총 <span class="total-count">${fn:length(courseList)}</span>건
      <span class="order-btns">
        <a href="?order=latest" class="${order eq 'latest' || empty order ? 'active' : ''}">최신순</a>
        <a href="?order=popular" class="${order eq 'popular' ? 'active' : ''}">인기순</a>
      </span>
    </div>

    <c:if test="${empty courseList}">
      <p style="text-align:center; color:#999;">등록된 코스가 없습니다.</p>
    </c:if>

    <div class="course-cards">
      <c:forEach var="course" items="${courseList}">
        <div class="course-card">
          <div class="card-img">
            <img src="${course.imageUrl}" alt="${course.title}"/>
          </div>
          <div class="card-main">
            <div class="card-title">${course.title}</div>
            <div class="card-meta">${course.region}</div>
            <div class="card-tags">
              <!-- 목적지 리스트가 DTO에 있다면 -->
              <c:forEach var="dest" items="${course.detailList}">
                <span class="dest-tag">${dest.memo}</span>
              </c:forEach>
            </div>
          </div>
          <div class="card-side">
            <span class="card-distance">${course.viewCount} views</span>
            <a href="${pageContext.request.contextPath}/travelCourse/detail/${course.courseId}">
              <button class="card-etc-btn">⋮</button>
            </a>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</body>
</html>
