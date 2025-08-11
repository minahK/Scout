<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>추천 테마여행</title>
<style>
/* 전체 배경 및 레이아웃 */
.theme-hero{ background:#e5d84f; padding:60px 0 90px; font-family:'Noto Sans KR',sans-serif; color:#222; overflow:visible; }
.theme-hero .inner{
  max-width:1200px; margin:0 auto; padding:0 60px;
  display:grid; grid-template-columns:1fr min(520px,42vw); gap:48px; align-items:start;
}

/* 왼쪽 카피 */
.theme-copy h2{ font-size:44px; line-height:1.25; margin:0 0 18px; font-weight:900; color:#333; }
.theme-copy .view-all{ display:inline-flex; align-items:center; gap:8px; margin-top:8px; font-weight:600; cursor:pointer; font-size:16px; opacity:.9; }
.theme-copy .view-all:hover{ opacity:1; }
.theme-copy .plus{ width:22px; height:22px; border-radius:50%; display:inline-grid; place-items:center; border:2px solid #333; font-weight:800; font-size:14px; }

/* 메인 카드 */
.theme-card{ background:#fff; border-radius:28px; padding:20px; box-shadow:0 12px 38px rgba(0,0,0,.12); }
.theme-card .img-wrap{ border-radius:26px; overflow:hidden; border:10px solid #fff; box-shadow:0 8px 22px rgba(0,0,0,.08); }
.theme-card img{ width:100%; height:clamp(220px,32vw,360px); object-fit:cover; display:block; }
.theme-card .title{ font-size:22px; font-weight:900; margin:18px 8px 6px; color:#222; }
.theme-card .desc{ font-size:14px; color:#666; margin:0 8px 4px 8px; }

/* 아치형 썸네일 */
.thumb-row{ display:flex; gap:18px; margin:26px 0 8px; flex-wrap:wrap; overflow-x:auto; padding-bottom:6px; }
.thumb{
  width:220px; height:150px; cursor:pointer; position:relative;
   overflow:hidden; box-shadow:0 6px 18px rgba(0,0,0,.12);
   border-radius: 12px;   /* 혹은 16px 등 */
  overflow: hidden;
  background:#e8de58 center/cover no-repeat;  /* ← 이미지를 배경으로 꽉 채움 */
}
.thumb .label{
  position:absolute; left:14px; bottom:12px; color:#fff; font-weight:700; font-size:14px;
  text-shadow:0 2px 8px rgba(0,0,0,.6);
}
.thumb.active{ outline:3px solid #fff; }

/* 컨트롤 */
.theme-controls{ display:flex; align-items:center; gap:16px; justify-content:center; margin-top:10px; }
.theme-controls .bar{ width:340px; height:3px; background:#00000018; position:relative; border-radius:4px; }
.theme-controls .bar .fill{ position:absolute; left:0; top:0; height:100%; width:0%; background:#333; border-radius:4px; }
.theme-controls .page{ font-weight:800; letter-spacing:.04em; min-width:80px; text-align:center; }
.theme-controls .btn{ width:36px; height:36px; border-radius:50%; border:1px solid #222; display:grid; place-items:center; font-weight:900; cursor:pointer; background:#fff; }
.theme-controls .btn:hover{ background:#222; color:#fff; }

@media (max-width:1200px){ .theme-hero .inner{ grid-template-columns:1fr; } .theme-card{ margin-top:16px; } }
@media (max-width:960px){ .theme-card img{ height:280px; } }

.themeMaph2 {
	margin-left:150px;
}
</style>
</head>
<body>

<%@ include file="tdHeader.jsp"%>

<section class="theme-hero">
  <div class="inner">
    <!-- 왼쪽 -->
    <div class="theme-copy">
      <h2>다채로운 즐거움이 가득한<br><span style="font-weight:900;">제주도 추천 테마여행!</span></h2>
      <div class="view-all" onclick="alert('모든 테마 보기로 이동')"><span class="plus">+</span> 모든 테마 보기</div>
      <div class="thumb-row" id="thumbRow"></div>
    </div>

    <!-- 오른쪽 메인 카드 -->
    <div class="theme-card">
      <div class="img-wrap"><img id="mainImg" src="" alt="theme image"></div>
      <div class="title" id="mainTitle"></div>
      <p class="desc" id="mainDesc"></p>

      <div class="theme-controls">
        <div class="bar"><div class="fill" id="barFill"></div></div>
        <div class="page"><span id="pageNow">01</span> / <span id="pageTotal">00</span></div>
        <div class="btn" id="prevBtn">&#8592;</div>
        <div class="btn" id="nextBtn">&#8594;</div>
      </div>
    </div>
  </div>
</section>

<!-- 서버에서 themes 없으면 예시 데이터 -->
<c:if test="${empty themes}">
  <c:set var="themesJson" value='[
    {"title":"추천! 가볼만한곳","desc":"한국관광공사가 추천하는 월별 가볼 만한 여행지를 추천합니다.","img":"/resources/image/sample.jpg"},
    {"title":"문화관광해설사 통합예약","desc":"전국 문화관광해설사 프로그램을 한 번에.","img":"/resources/image/sample2.jpg"},
    {"title":"반려동물 동반여행","desc":"우리집 댕냥이와 함께하는 힐링코스.","img":"/resources/image/sample3.jpg"},
    {"title":"우수 웰니스","desc":"쉼과 회복이 있는 웰니스 여행.","img":"/resources/image/toscana.png"}
  ]'/>
</c:if>
<br>
<h2 class="themeMaph2">테마가 있는 여행을 즐겨보세요.</h2>
<%@ include file="themeMap.jsp"%>

<%@ include file="../main/footer.jsp" %>

<script>
// 데이터 세팅
var items = [];
<c:if test="${not empty themes}">
  <c:forEach var="t" items="${themes}">
    items.push({ title:"${fn:escapeXml(t.title)}", desc:"${fn:escapeXml(t.desc)}", img:"${fn:escapeXml(t.img)}" });
  </c:forEach>
</c:if>
<c:if test="${empty themes}">
  items = JSON.parse(`${themesJson}`);
</c:if>

// 컨텍스트 경로 보정(정적 경로일 때 안전)
const ctx = '${pageContext.request.contextPath}';
const toSrc = (src) => (src?.startsWith('http') ? src : ctx + src);

const mainImg   = document.getElementById('mainImg');
const mainTitle = document.getElementById('mainTitle');
const mainDesc  = document.getElementById('mainDesc');
const pageNow   = document.getElementById('pageNow');
const pageTotal = document.getElementById('pageTotal');
const barFill   = document.getElementById('barFill');
const thumbRow  = document.getElementById('thumbRow');
const prevBtn   = document.getElementById('prevBtn');
const nextBtn   = document.getElementById('nextBtn');

let idx = 0;
pageTotal.textContent = String(items.length).padStart(2,'0');

function renderThumbs(){
  thumbRow.innerHTML = '';
  items.forEach((it,i)=>{
    const el = document.createElement('div');
    el.className = 'thumb' + (i===idx ? ' active' : '');
    el.style.backgroundImage = "url('" + toSrc(it.img) + "')";
    el.innerHTML = `<div class="label">${it.title}</div>`;
    el.onclick = ()=>{ idx = i; render(); };
    thumbRow.appendChild(el);
  });
}

function render(){
  const it = items[idx];
  mainImg.src = toSrc(it.img);         // 메인 카드 이미지
  mainTitle.textContent = it.title;
  mainDesc.textContent  = it.desc;
  pageNow.textContent   = String(idx+1).padStart(2,'0');
  barFill.style.width   = ((idx+1)/items.length*100)+'%';
  renderThumbs();                      // 썸네일 active 갱신
}

mainImg.onerror = ()=>{                // 이미지 실패 시 대체
  mainImg.src = 'https://via.placeholder.com/960x540?text=Image+not+available';
};

prevBtn.onclick = ()=>{ idx = (idx-1+items.length)%items.length; render(); };
nextBtn.onclick = ()=>{ idx = (idx+1)%items.length; render(); };

render();
</script>
</body>
</html>