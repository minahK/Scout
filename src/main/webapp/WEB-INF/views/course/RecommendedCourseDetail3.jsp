<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>제주 한라산 | 코스 상세</title>
<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css">
<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
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
  background:#ddd url('https://api.cdn.visitjeju.net/photomng/imgpath/201911/29/13775f73-45ef-494f-bc15-7d78756284e7.jpg') center/cover no-repeat;
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
.route-pin{background:var(--c-base);color:#fff;width:28px;height:28px;border-radius:999px;display:flex;align-items:center;justify-content:center;font-size:13px;font-weight:800;border:2px solid #fff;box-shadow:0 2px 6px rgba(0,0,0,.25)}
.leaflet-popup-content-wrapper{border-radius:10px}
</style>
</head>
<body>
<%@ include file="RCHeader.jsp"%>
<div class="wrap">
  <div class="hero">
    <div class="breadcrumb">홈 › 추천코스 › 제주</div>
    <div class="hero-inner">
      <div class="title">한라산 품 안에서 보내는 하룻밤<span class="badge">추천</span></div>
      <div class="subtitle"> 천왕사 ↔ 어승생</div>
      <div class="chips">
        <span class="chip">총거리 28km</span>
        <span class="chip">제주도 제주시</span>
        <span class="chip">난이도 보통</span>
        <span class="chip">테마 캠핑</span>
      </div>
    </div>
  </div>
  <div class="grid">
    <main>
      <section id="overview" class="section">
        <h2>코스 개요</h2>
        <div class="kv">
          <div class="item"><span class="label">출발</span><span class="val">천왕사</span></div>
          <div class="item"><span class="label">도착</span><span class="val">어승생</span></div>
          <div class="item"><span class="label">지역</span><span class="val">제주도 제주시</span></div>
          <div class="item"><span class="label">추천시기</span><span class="val">3~6월, 9~11월</span></div>
        </div>
        <p class="small">※ 실제 거리·시간은 보행 속도 및 우회에 따라 달라질 수 있습니다.</p>
      </section>
      <section id="route" class="section">
        <h2>코스 동선</h2>
        <div class="timeline">
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202111/25/e1135e6b-28dc-435d-a6c8-d0aeda1f18e6.JPG" alt="">
            <div>
              <h3><span class="step">1</span>천왕사(제주)</h3>
              <p>제주특별자치도 제주시 1100로 2528-111 (노형동)</p>
              <div class="meta">#관광지 #불교 #불교문화 #사찰 #사찰여행</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201804/30/5d903f92-b1af-4149-a080-17aacdac7605.jpg" alt="">
            <div>
              <h3><span class="step">2</span>한라수목원</h3>
              <p>제주특별자치도 제주시 수목원길 72</p>
              <div class="meta">#걷기길 #관광지 #산책하기 #생태관광지</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201811/02/906536a1-b214-4797-9879-231f4a62f20c.jpg" alt="">
            <div>
              <h3><span class="step">3</span>서귀포자연휴양림</h3>
              <p>제주특별자치도 서귀포시 1100로 882</p>
              <div class="meta">#관광지 #나홀로여행 #리프레쉬 #생태관광</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201804/30/d69de7c8-dfe1-4964-8eb8-29896110beb0.jpg" alt="">
            <div>
              <h3><span class="step">4</span>어승생</h3>
              <p>제주특별자치도 제주시 해안동</p>
              <div class="meta">#경치여행 #경치좋은곳 #관광지 #어승생</div>
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
            <li>캠핑/숙박: 자연휴양림·야영장은 사전 예약 필수. 국립/도립공원 구역 지정 장소 외 야영 금지.</li>
            <li>물/식량: 고도 오를수록 매점 드뭄. 1인 기준 물 1.5~2L + 간단 탄수화물 지참.</li>
            <li>포토 스팟: 한라수목원 숲길, 자연휴양림 데크로드, 어승생 전망 구간은 오전에 색감 좋음.</li>
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
          <div>테마 <b>캠핑</b></div>
        </div>
        <div class="btns">
          <a class="btn" href="#" onclick="alert('지도 다운로드(예시)');return false;">지도 다운로드</a>
          <a class="btn secondary" href="#" id="shareBtn">공유</a>
        </div>
      </div>
      <div class="side-card">
        <h4>#해시태그</h4>
        <div class="side-tags">
          <span class="tag active">#한라산</span>
          <span class="tag">#제주시</span>
          <span class="tag">#캠핑</span>
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
window.addEventListener('scroll', () => { let i = 0; const y = window.scrollY + 120; secs.forEach((s,idx)=>{ if(s.offsetTop <= y) i = idx; }); act(i); });
links.forEach((a,idx)=>{ a.addEventListener('click', e=>{ e.preventDefault(); document.querySelector(a.getAttribute('href')).scrollIntoView({behavior:'smooth',block:'start'}); act(idx); }); });
document.getElementById('shareBtn').addEventListener('click', async e=>{ e.preventDefault(); const url = location.href; try{ if(navigator.share){ await navigator.share({title:document.title, url}); } else { await navigator.clipboard.writeText(url); alert('페이지 주소를 복사했어요 👍'); } }catch(err){} });

const stops = [
  {step:1, name:'천왕사(제주)', addr:'제주특별자치도 제주시 1100로 2528-111 (노형동)', lat:33.40926, lng:126.49375},
  {step:2, name:'한라수목원', addr:'제주시 수목원길 72', lat:33.4697692812, lng:126.4921487719},
  {step:3, name:'서귀포자연휴양림', addr:'서귀포시 1100로 882', lat:33.31167, lng:126.45876},
  {step:4, name:'어승생', addr:'제주시 해안동', lat:33.398006, lng:126.487176}
];

const map = L.map('leafletMap',{scrollWheelZoom:true, zoomControl:true});
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',{attribution:'&copy; OpenStreetMap'}).addTo(map);

const latlngs = [];
stops.forEach(s=>{
  latlngs.push([s.lat,s.lng]);
  const icon = L.divIcon({className:'', html:`<div class="route-pin">${s.step}</div>`, iconSize:[28,28], iconAnchor:[14,28]});
  L.marker([s.lat,s.lng],{icon}).addTo(map).bindPopup(`<b>${s.step}. ${s.name}</b><div class="small">${s.addr}</div>`);
});
const route = L.polyline(latlngs,{color:'#eb5e00',weight:3,opacity:.95,dashArray:'6 6'}).addTo(map);
map.fitBounds(route.getBounds(),{padding:[20,20]});
</script>
</body>
</html>
