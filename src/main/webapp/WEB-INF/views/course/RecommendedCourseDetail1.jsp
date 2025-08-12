<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>제주 올레길 | 코스 상세</title>

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

<style>
:root{
  --c-light:#ff9752; /* 옅은색 */
  --c-base:#ee853f;  /* 기본색 */
  --c-dark:#eb5e00;  /* 진한색 */
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
  background:#ddd url('https://images.unsplash.com/photo-1521401830884-6c03c1c87ebb?q=80&w=1600&auto=format&fit=crop') center/cover no-repeat;
}
.hero::after{
  content:"";position:absolute;inset:0;background:linear-gradient(180deg,rgba(0,0,0,.35),rgba(0,0,0,.45));
}
.breadcrumb{font-size:14px;color:#fff;position:absolute;left:18px;top:14px;z-index:2;opacity:.9}
.hero-inner{position:absolute;left:18px;bottom:18px;z-index:2;color:#fff}
.title{font-size:34px;font-weight:900;letter-spacing:-.8px;margin:4px 0 8px}
.subtitle{font-size:16px;opacity:.95}

.chips{display:flex;flex-wrap:wrap;gap:8px;margin-top:12px}
.chip{background:#fff;color:#111;padding:6px 10px;border-radius:999px;font-size:12px;border:1px solid rgba(0,0,0,.06)}
.badge{background:var(--c-base);color:#fff;padding:4px 8px;border-radius:8px;font-size:12px;margin-left:8px}

.toc{
  position:sticky;top:16px;background:#fff;border:1.5px solid rgba(255,151,82,.45);
  border-radius:12px;padding:14px
}
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
.stop{
  display:grid;grid-template-columns:140px 1fr;gap:14px;align-items:start;
  background:#fff;border:1px solid var(--line);border-radius:12px;padding:12px;
}
.stop img{width:140px;height:90px;object-fit:cover;border-radius:10px;background:#f3f4f6}
.stop h3{font-size:16px;margin:0 0 6px}
.stop p{margin:0;color:#374151;font-size:14px;line-height:1.45}
.stop .meta{margin-top:6px;font-size:12px;color:var(--muted)}
.step{display:inline-block;background:var(--c-base);color:#fff;border-radius:999px;padding:2px 8px;font-size:12px;margin-right:6px}

.mapbox{border:1px solid var(--line);border-radius:12px;overflow:hidden}
.mapbox .kmap{width:100%;height:320px;display:block}

.marker-badge{
  width:22px;height:22px;border-radius:50%;
  background:var(--c-base);color:#fff;font-weight:700;font-size:12px;
  display:flex;align-items:center;justify-content:center;
  border:2px solid #fff;box-shadow:0 2px 6px rgba(0,0,0,.2)
}
.leaflet-tooltip.map-label{
  background:#fff;border:1px solid rgba(255,151,82,.55);
  color:var(--ink);border-radius:10px;padding:6px 8px;
  box-shadow:0 4px 12px rgba(0,0,0,.08);font-size:12px
}

.tip{background:#fff;border:1px solid var(--line);border-radius:12px;padding:12px}
.tip h4{margin:0 0 8px}
.tip li{margin:6px 0}

.side-card{
  background:#fff;border:1px solid var(--line);border-radius:12px;padding:14px;margin-bottom:14px
}
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
</style>
</head>
<body>

<%@ include file="RCHeader.jsp"%>

<div class="wrap">
  <div class="hero">
    <div class="breadcrumb">홈 › 추천코스 › 제주</div>
    <div class="hero-inner">
      <div class="title">제주 올레길 코스<span class="badge">추천</span></div>
      <div class="subtitle"> 서우봉둘레길 ↔ 알뜨르비행장</div>
      <div class="chips">
        <span class="chip">총거리 96.7km</span>
        <span class="chip">제주도 제주시</span>
        <span class="chip">난이도 보통</span>
        <span class="chip">테마 둘레길</span>
      </div>
    </div>
  </div>

  <div class="grid">
    <main>
      <section id="overview" class="section">
        <h2>코스 개요</h2>
        <div class="kv">
          <div class="item"><span class="label">출발</span><span class="val">서우봉둘레길</span></div>
          <div class="item"><span class="label">도착</span><span class="val">알뜨르 비행장</span></div>
          <div class="item"><span class="label">지역</span><span class="val">제주도 제주시</span></div>
          <div class="item"><span class="label">추천시기</span><span class="val">3~6월, 9~11월</span></div>
        </div>
        <p class="small">※ 실제 거리·시간은 보행 속도 및 우회에 따라 달라질 수 있습니다.</p>
      </section>

      <section id="route" class="section">
        <h2>코스 동선</h2>
        <div class="timeline">
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202111/05/448c06e4-73c2-47ff-b230-c76bb72ff86f.JPG" alt="">
            <div>
              <h3><span class="step">1</span>서우봉둘레길</h3>
              <p>제주특별자치도 제주시 조천읍 함덕12길 16</p>
              <div class="meta">#서우봉 #서우봉둘레길 #역사관광지 #올레길</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201907/26/0d153f72-b2a9-4395-b292-ff6ca9fa996c.jpg" alt="">
            <div>
              <h3><span class="step">2</span>제주4·3평화공원</h3>
              <p>제주특별자치도 제주시 명림로 430</p>
              <div class="meta">#가족여행 #걷기여행 #걷기좋은길 #관광지</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://image.여기유.com/content_travel/thumb-2020021412433815816518185378_421x300.jpg" alt="">
            <div>
              <h3><span class="step">3</span>신풍 신천 바다목장</h3>
              <p>제주특별자치도 서귀포시 성산읍 일주동로 5417</p>
              <div class="meta">#SNS속_인생샷명소 #가족여행 #관광지 #귤피 #데이트명소</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202410/16/a8784094-08b6-4e9e-acf2-d86ab445dda5.jpg" alt="">
            <div>
              <h3><span class="step">4</span>쇠소깍</h3>
              <p>제주특별자치도 서귀포시 쇠소깍로 128</p>
              <div class="meta">#아이와함께 #여름여행 #연인과함께 #자연</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202409/25/2d76eeb2-7ffc-49d1-b087-4859ac38bdf3.jpg" alt="">
            <div>
              <h3><span class="step">5</span>정방폭포</h3>
              <p>제주특별자치도 서귀포시 칠십리로214번길 37</p>
              <div class="meta">#경치여행 #경치좋은곳 #관광지 #사진찍기</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202408/21/47091457-d3b2-4d0a-bfcd-175cbf8fd14a.jpg" alt="">
            <div>
              <h3><span class="step">6</span>사계해변</h3>
              <p>제주특별자치도 서귀포시 안덕면 사계리</p>
              <div class="meta">#여름피서지 #자연속으로 #자연여행 #자연좋은곳</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://여기유.com/data/editor/2204/20220412165952_205c9fd9c74b09d5dc7691564e18a3b7_7v65.jpg" alt="">
            <div>
              <h3><span class="step">7</span>송악산전망대</h3>
              <p>제주특별자치도 서귀포시 대정읍 상모리 2-13</p>
              <div class="meta">#관광지 #송악산전망대 #제주99봉 #제주가볼만한곳</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://cdn.kplus.kr/news/photo/202303/446916_737198_3123.jpg" alt="">
            <div>
              <h3><span class="step">8</span>알뜨르비행장 및 일본군 비행기 격납고</h3>
              <p>제주특별자치도 서귀포시 대정읍 상모리</p>
              <div class="meta">#관광지 #비행기격납고 #역사 #역사공부</div>
            </div>
          </article>
        </div>
      </section>

      <!-- 지도 -->
      <section id="map" class="section">
        <h2>코스 지도</h2>
        <div class="mapbox">
          <div id="jejuMap" class="kmap"></div>
        </div>
      </section>

      <section id="tips" class="section">
        <h2>이용 팁 · 주의사항</h2>
        <div class="tip">
          <h4>알아두면 좋아요</h4>
          <ul>
            <li>교통·이동: 출발지/도착지 대중교통 시간표 확인, 일부 구간은 버스 배차 간격이 김.</li>
            <li>식사·간식: 중간에 편의점·카페가 드문 구간이 있으니 간식 챙기기.</li>
            <li>걷기 전 준비물: 편한 워킹화·모자·선크림·바람막이·충분한 생수 준비.</li>
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
          <div>거리 <b>96.7km</b></div>
          <div>지역 <b>제주도 제주시</b></div>
          <div>난이도 <b>보통</b></div>
          <div>테마 <b>둘레길</b></div>
        </div>
        <div class="btns">
          <a class="btn" href="#" onclick="alert('지도 다운로드(예시)');return false;">지도 다운로드</a>
          <a class="btn secondary" href="#" id="shareBtn">공유</a>
        </div>
      </div>

      <div class="side-card">
        <h4>#해시태그</h4>
        <div class="side-tags">
          <span class="tag active">#올레길</span>
          <span class="tag">#해안길</span>
          <span class="tag">#서귀포</span>
          <span class="tag">#일몰맛집</span>
          <span class="tag">#힐링</span>
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

const STOPS = [
  { step:1, name:'서우봉둘레길', lat:33.5560, lng:126.7590 },
  { step:2, name:'제주4·3평화공원', lat:33.4740, lng:126.6220 },
  { step:3, name:'신풍 신천 바다목장', lat:33.3560, lng:126.8620 },
  { step:4, name:'쇠소깍', lat:33.2460, lng:126.6230 },
  { step:5, name:'정방폭포', lat:33.2450, lng:126.5630 },
  { step:6, name:'사계해변', lat:33.2370, lng:126.3130 },
  { step:7, name:'송악산전망대', lat:33.1960, lng:126.3180 },
  { step:8, name:'알뜨르비행장 및 일본군 비행기 격납고', lat:33.2050, lng:126.2730 }
];

const leafletMap = L.map('jejuMap', {scrollWheelZoom:true, zoomControl:true})
  .setView([33.38, 126.55], 10);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution:'&copy; OpenStreetMap contributors'
}).addTo(leafletMap);

const bounds = L.latLngBounds();
const path = [];
STOPS.forEach(s => {
  const p = [s.lat, s.lng];
  path.push(p);
  bounds.extend(p);

  const icon = L.divIcon({
    className: '',
    html: `<div class="marker-badge">${s.step}</div>`,
    iconSize: [22,22],
    iconAnchor: [11,11]
  });

  const marker = L.marker(p, { icon }).addTo(leafletMap);
  marker.bindTooltip({
    permanent:true, direction:'top', offset:[0,-8], className:'map-label'
  });
});

L.polyline(path, { color:'#eb5e00', weight:4, opacity:0.95 }).addTo(leafletMap);

leafletMap.fitBounds(bounds.pad(0.15));
</script>
</body>
</html>
