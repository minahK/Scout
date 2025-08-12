<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>제주 사계해안도로 | 코스 상세</title>

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

<style>
:root{
  --c-light:#ff9752;
  --c-base:#ee853f;
  --c-dark:#eb5e00;
  --ink:#0f172a; --muted:#6b7280; --line:#e5e7eb;
  --bg:#fff; --chip:#f8fafc;
}
*{box-sizing:border-box}
body{margin:0;font-family:'Noto Sans KR', system-ui, -apple-system, sans-serif;color:var(--ink);background:#fff}
.wrap{max-width:1100px;margin:0 auto;padding:0 20px}
.grid{display:grid;grid-template-columns:2fr 1fr;gap:28px}
@media (max-width: 980px){.grid{grid-template-columns:1fr}}
.hero{
  position:relative;height:300px;border-radius:18px;overflow:hidden;margin:18px 0 22px;
  background:#ddd url('https://api.cdn.visitjeju.net/photomng/imgpath/202408/21/aaa847fb-3f15-4f1f-ba64-f6d730eed782.jpg') center/cover no-repeat;
}
.hero::after{content:"";position:absolute;inset:0;background:linear-gradient(180deg,rgba(0,0,0,.35),rgba(0,0,0,.45))}
.breadcrumb{font-size:14px;color:#fff;position:absolute;left:18px;top:14px;z-index:2;opacity:.9}
.hero-inner{position:absolute;left:18px;bottom:18px;z-index:2;color:#fff}
.title{font-size:34px;font-weight:900;letter-spacing:-.8px;margin:4px 0 8px}
.subtitle{font-size:16px;opacity:.95}
.chips{display:flex;flex-wrap:wrap;gap:8px;margin-top:12px}
.chip{background:#fff;color:#111;padding:6px 10px;border-radius:999px;font-size:12px;border:1px solid rgba(0,0,0,.06)}
.badge{background:var(--c-base);color:#fff;padding:4px 8px;border-radius:8px;font-size:12px;margin-left:8px}
.toc{position:sticky;top:16px;background:#fff;border:1.5px solid rgba(255,151,82,.45);border-radius:12px;padding:14px}
.toc h4{margin:0 0 10px;font-size:15px}
.toc a{display:block;padding:8px 10px;border-radius:8px;color:#374151;text-decoration:none;font-size:14px}
.toc a.active,.toc a:hover{background:#fff7f0;color:#111;border:1px solid var(--c-base)}
.section{padding:12px 0 6px;border-bottom:1px solid var(--line);margin-bottom:18px}
.section:last-child{border-bottom:none}
.section h2{font-size:20px;margin:2px 0 12px}
.kv{display:flex;flex-wrap:wrap;gap:10px 14px;margin:6px 0 12px}
.kv .item{display:flex;gap:8px;align-items:center;background:#fff;border:1px solid var(--line);padding:8px 10px;border-radius:10px}
.kv .label{color:var(--muted);font-size:12px}
.kv .val{font-weight:700}
.timeline{display:flex;flex-direction:column;gap:14px}
.stop{display:grid;grid-template-columns:140px 1fr;gap:14px;align-items:start;background:#fff;border:1px solid var(--line);border-radius:12px;padding:12px}
.stop img{width:140px;height:90px;object-fit:cover;border-radius:10px;background:#f3f4f6}
.stop h3{font-size:16px;margin:0 0 6px}
.stop p{margin:0;color:#374151;font-size:14px;line-height:1.45}
.stop .meta{margin-top:6px;font-size:12px;color:var(--muted)}
.step{display:inline-block;background:var(--c-base);color:#fff;border-radius:999px;padding:2px 8px;font-size:12px;margin-right:6px}
.mapbox{border:1px solid var(--line);border-radius:12px;overflow:hidden}
#leafletMap{width:100%;height:360px;display:block}
.tip{background:#fff;border:1px solid var(--line);border-radius:12px;padding:12px}
.tip h4{margin:0 0 8px}
.tip li{margin:6px 0}
.side-card{background:#fff;border:1px solid var(--line);border-radius:12px;padding:14px;margin-bottom:14px}
.side-card h4{margin:0 0 10px}
.info-list{display:grid;grid-template-columns:1fr 1fr;gap:8px;font-size:14px}
.info-list div{background:#fff;border:1px solid #edf2f7;border-radius:10px;padding:8px}
.side-tags{display:flex;flex-wrap:wrap;gap:8px}
.tag{background:#fff;border:1px solid #e5e7eb;border-radius:999px;padding:6px 12px;font-size:12px}
.tag.active{background:#fff7f0;border-color:var(--c-base)}
.btns{display:flex;gap:8px;margin-top:8px}
.btn{border:1px solid var(--c-base);color:#fff;background:var(--c-base);border-radius:10px;padding:8px 12px;font-size:14px;text-decoration:none}
.btn.secondary{background:#fff;color:#111;border-color:#e5e7eb}
.hr{height:1px;background:var(--line);border:none;margin:10px 0}
.small{font-size:12px;color:var(--muted)}
.route-pin{background:var(--c-base);color:#fff;width:24px;height:24px;line-height:24px;text-align:center;border-radius:50%;border:2px solid #fff;font-weight:700;font-size:12px;box-shadow:0 1px 6px rgba(0,0,0,.25)}
.route-label{background:#fff;border:1px solid rgba(0,0,0,.15);padding:2px 8px;border-radius:8px;box-shadow:0 1px 6px rgba(0,0,0,.08);font-size:12px;color:#111}
</style>
</head>
<body>

<%@ include file="RCHeader.jsp"%>

<div class="wrap">
  <div class="hero">
    <div class="breadcrumb">홈 › 추천코스 › 제주</div>
    <div class="hero-inner">
      <div class="title">제주 사계해안도로 코스<span class="badge">추천</span></div>
      <div class="subtitle"> 섯알오름 ↔ 산방산</div>
      <div class="chips">
        <span class="chip">총거리 약 10km</span>
        <span class="chip">제주도 서귀포시</span>
        <span class="chip">난이도 보통</span>
        <span class="chip">테마 해안도로</span>
      </div>
    </div>
  </div>

  <div class="grid">
    <main>
      <section id="overview" class="section">
        <h2>코스 개요</h2>
        <div class="kv">
          <div class="item"><span class="label">출발</span><span class="val">섯알오름</span></div>
          <div class="item"><span class="label">도착</span><span class="val">산방산 </span></div>
          <div class="item"><span class="label">지역</span><span class="val">제주도 서귀포시</span></div>
          <div class="item"><span class="label">추천시기</span><span class="val">3~6월, 9~11월</span></div>
        </div>
        <p class="small">※ 실제 거리·시간은 보행 속도 및 우회에 따라 달라질 수 있습니다.</p>
      </section>

      <section id="route" class="section">
        <h2>코스 동선</h2>
        <div class="timeline">
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202111/05/75c96e35-4be5-40e7-a187-8171b32a0f33.jpg" alt="">
            <div>
              <h3><span class="step">1</span>섯알오름</h3>
              <p>제주특별자치도 서귀포시 대정읍 상모리 1618</p>
              <div class="meta">#관광지 #알뜨르비행장 #자연관광지 #제주43사건</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202008/21/a8ee7cef-10ef-42a1-b1f7-d5730021f0dc.jpg" alt="">
            <div>
              <h3><span class="step">2</span>송악산</h3>
              <p>제주특별자치도 서귀포시 대정읍 송악관광로 421-1</p>
              <div class="meta">#가족여행 #걷기길 #관광지 #바다풍경</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202409/25/4297007f-2918-4bb5-bc75-066410fa520e.jpg" alt="">
            <div>
              <h3><span class="step">3</span>용머리해안</h3>
              <p>제주특별자치도 서귀포시 안덕면 사계리</p>
              <div class="meta">#산방산 #용머리해안 #유네스코 #자연 #자연경관</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202112/22/abadcad3-4ec2-4242-b359-000352b4f5bb.jpg" alt="">
            <div>
              <h3><span class="step">4</span>발자국화석공원</h3>
              <p>제주특별자치도 서귀포시 대정읍 형제해안로 192</p>
              <div class="meta">#관광지 #동물발자국 #사계해안 #송악해안도로</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202408/21/47091457-d3b2-4d0a-bfcd-175cbf8fd14a.jpg" alt="">
            <div>
              <h3><span class="step">5</span>사계해변</h3>
              <p>제주특별자치도 서귀포시 안덕면 사계리</p>
              <div class="meta">#경치좋은곳 #관광지 #마린포트홀 #바다경치</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202408/21/47091457-d3b2-4d0a-bfcd-175cbf8fd14a.jpg" alt="">
            <div>
              <h3><span class="step">6</span>산방산(제주)</h3>
              <p>제주특별자치도 서귀포시 안덕면 사계리</p>
              <div class="meta">#가족여행 #걷기길 #관광지 #사진찍기좋은곳</div>
            </div>
          </article>
        </div>
      </section>

      <section id="map" class="section">
        <h2>코스 지도</h2>
        <div class="mapbox">
          <div id="leafletMap"></div>
        </div>
      </section>

      <section id="tips" class="section">
        <h2>이용 팁 · 주의사항</h2>
        <div class="tip">
          <h4>알아두면 좋아요</h4>
          <ul>
            <li>주차 팁: 송악산/용머리/산방산은 주차장이 비교적 넓지만 성수기·주말엔 대기가 발생해요.</li>
            <li>일몰 스폿: 송악산전망대·사계해변에서 한라산 실루엣과 바다 일몰 뷰가 좋아요.</li>
            <li>편의시설: 사계해변 주변 카페·편의점 이용이 편해요.</li>
          </ul>
        </div>
      </section>
    </main>

    <aside>
      <nav class="toc">
        <h4>바로가기</h4>
        <a href="#overview" class="toc-link active">코스 개요</a>
        <a href="#route" class="toc-link">코스 동선</a>
        <a href="#map" class="toc-link">지도</a>
        <a href="#tips" class="toc-link">팁 · 주의</a>
      </nav>

      <div class="side-card">
        <h4>기본 정보</h4>
        <div class="info-list">
          <div>거리 <b>약 10km</b></div>
          <div>지역 <b>제주도 서귀포시</b></div>
          <div>난이도 <b>보통</b></div>
          <div>테마 <b>해안도로</b></div>
        </div>
        <div class="btns">
          <a class="btn" href="#" onclick="alert('지도 다운로드(예시)');return false;">지도 다운로드</a>
          <a class="btn secondary" href="#" id="shareBtn">공유</a>
        </div>
      </div>

      <div class="side-card">
        <h4>#해시태그</h4>
        <div class="side-tags">
          <span class="tag active">#드라이브코스</span>
          <span class="tag">#차타고</span>
          <span class="tag">#추천코스</span>
          <span class="tag">#해안도로</span>
        </div>
      </div>
    </aside>
  </div>
</div>

<script>
const links = document.querySelectorAll('.toc-link');
const secs  = [...links].map(a => document.querySelector(a.getAttribute('href')));
const act = i => links.forEach((l,idx)=>l.classList.toggle('active', idx===i));
window.addEventListener('scroll', () => {
  let i = 0; const y = window.scrollY + 120;
  secs.forEach((s,idx)=>{ if(s.offsetTop <= y) i = idx; });
  act(i);
});
links.forEach((a,idx)=>{
  a.addEventListener('click', e=>{
    e.preventDefault();
    document.querySelector(a.getAttribute('href')).scrollIntoView({behavior:'smooth',block:'start'});
    act(idx);
  });
});
document.getElementById('shareBtn').addEventListener('click', async e=>{
  e.preventDefault();
  const url = location.href;
  try{
    if(navigator.share){ await navigator.share({title:document.title, url}); }
    else{
      await navigator.clipboard.writeText(url);
      alert('페이지 주소를 복사했어요 👍');
    }
  }catch(err){}
});

const ROUTE = [
  { n:1, name:'섯알오름',       lat:33.205780,   lon:126.280850,  addr:'서귀포시 대정읍 상모리 1618' },
  { n:2, name:'송악산',         lat:33.2077419,  lon:126.2909048, addr:'서귀포시 대정읍 송악관광로 421-1' },
  { n:3, name:'용머리해안',     lat:33.23139,    lon:126.31417,   addr:'서귀포시 안덕면 사계리' },
  { n:4, name:'발자국화석공원', lat:33.21735034, lon:126.2931434, addr:'서귀포시 대정읍 형제해안로 192' },
  { n:5, name:'사계해변',       lat:33.22457,    lon:126.29935,   addr:'서귀포시 안덕면 사계리' },
  { n:6, name:'산방산(제주)',   lat:33.24167,    lon:126.31306,   addr:'서귀포시 안덕면 사계리' },
];

const cssVar = getComputedStyle(document.documentElement);
const baseColor = (cssVar.getPropertyValue('--c-base')||'#ee853f').trim();

const map = L.map('leafletMap', { zoomControl:true });
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', { attribution: '&copy; OpenStreetMap' }).addTo(map);

const latlngs = [];
ROUTE.forEach(p => {
  const ll = [p.lat, p.lon];
  latlngs.push(ll);
  const icon = L.divIcon({ className:'', html:`<div class="route-pin">${p.n}</div>`, iconSize:[24,24], iconAnchor:[12,12] });
  const marker = L.marker(ll, { icon }).addTo(map);
  marker.bindTooltip({ permanent:true, direction:'right', offset:[10,0], opacity:1, className:'' });
});
L.polyline(latlngs, { color: baseColor, weight:4, opacity:0.9 }).addTo(map);
map.fitBounds(L.latLngBounds(latlngs), { padding:[20,20] });
L.control.scale({ metric:true, imperial:false }).addTo(map);
</script>
</body>
</html>
