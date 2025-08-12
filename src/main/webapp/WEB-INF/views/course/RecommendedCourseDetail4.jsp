<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>제주도 세계자연유산 탐방 1 코스 | 코스 상세</title>

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
  background:#ddd url('https://api.cdn.visitjeju.net/photomng/imgpath/202409/19/bd61b692-26b0-4aaa-b3d7-7e120cf0f168.jpg') center/cover no-repeat;
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
.route-pin{background:var(--c-base);color:#fff;width:26px;height:26px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-weight:800;font-size:12px;border:2px solid #fff;box-shadow:0 1px 6px rgba(0,0,0,.25)}
.route-label{background:#fff;border:1px solid rgba(0,0,0,.15);padding:2px 8px;border-radius:8px;box-shadow:0 1px 6px rgba(0,0,0,.08);font-size:12px;color:#111}
</style>
</head>
<body>

<%@ include file="RCHeader.jsp"%>

<div class="wrap">
  <div class="hero">
    <div class="breadcrumb">홈 › 추천코스 › 제주</div>
    <div class="hero-inner">
      <div class="title">제주도 세계자연유산 탐방 1 코스<span class="badge">추천</span></div>
      <div class="subtitle"> 깁영갑갤러리 ↔ 해오름</div>
      <div class="chips">
        <span class="chip">총거리 32.44km</span>
        <span class="chip">제주도 제주시</span>
        <span class="chip">난이도 보통</span>
        <span class="chip">테마 힐링</span>
      </div>
    </div>
  </div>

  <div class="grid">
    <main>
      <section id="overview" class="section">
        <h2>코스 개요</h2>
        <div class="kv">
          <div class="item"><span class="label">출발</span><span class="val">깁영갑 갤러리</span></div>
          <div class="item"><span class="label">도착</span><span class="val">해오름</span></div>
          <div class="item"><span class="label">지역</span><span class="val">제주도 제주시</span></div>
          <div class="item"><span class="label">추천시기</span><span class="val">3~6월, 9~11월</span></div>
        </div>
        <p class="small">※ 실제 거리·시간은 보행 속도 및 우회에 따라 달라질 수 있습니다.</p>
      </section>

      <section id="route" class="section">
        <h2>코스 동선</h2>
        <div class="timeline">
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202110/29/94ba276e-6141-44c6-87f7-1feb679c0dc4.jpg" alt="">
            <div>
              <h3><span class="step">1</span>김영갑 갤러리(두모악)</h3>
              <p>제주특별자치도 서귀포시 성산읍 삼달로 137</p>
              <div class="meta">#15_16한국관광100선 #가족여행 #기념품판매 #김영갑갤러리</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201810/16/1ddbbf85-d954-4234-b16f-65af69c042fb.jpg" alt="">
            <div>
              <h3><span class="step">2</span>산굼부리</h3>
              <p>제주특별자치도 제주시 조천읍 비자림로 768</p>
              <div class="meta">#산굼부리 #아이와함께 #연인과함께 #자연</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202409/20/c8df320a-80df-47d9-a541-bf86631e5d51.png" alt="">
            <div>
              <h3><span class="step">3</span>성산일출봉 [유네스코 세계자연유산]</h3>
              <p>제주특별자치도 서귀포시 성산읍 일출로 284-12</p>
              <div class="meta">#가족여행 #가족체험여행 #관광지 #성산일출봉</div>
            </div>
          </article>
          <article class="stop">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202405/31/8715f81c-e54c-4630-8934-4e3cc75f4c94.jpg" alt="">
            <div>
              <h3><span class="step">4</span>해오름</h3>
              <p>제주특별자치도 서귀포시 성산읍 일출로 260</p>
              <div class="meta">#가족과함께 #갈치조림 #갈치조림맛집 #맛집</div>
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
            <li>성산일출봉: 강풍/우천 시 통제 가능. 경사·계단 구간이 미끄러우니 미끄럼 방지화 착용.</li>
            <li>기상·자외선: 해풍이 강하고 자외선이 셈. 바람막이·선크림·선글라스 준비.</li>
            <li>주정차: 불법 주·정차 단속 빈번. 지정 주차장 이용 및 보행자 안전에 유의하세요.</li>
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
          <div>거리 <b>32.44km</b></div>
          <div>지역 <b>제주도 제주시</b></div>
          <div>난이도 <b>보통</b></div>
          <div>테마 <b>힐링</b></div>
        </div>
        <div class="btns">
          <a class="btn" href="#" onclick="alert('지도 다운로드(예시)');return false;">지도 다운로드</a>
          <a class="btn secondary" href="#" id="shareBtn">공유</a>
        </div>
      </div>

      <div class="side-card">
        <h4>#해시태그</h4>
        <div class="side-tags">
          <span class="tag active">#제주1코스</span>
          <span class="tag">#성산일출봉</span>
          <span class="tag">#제주시</span>
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
  {step:1, name:'김영갑 갤러리(두모악)', addr:'서귀포시 성산읍 삼달로 137', lat:33.3462, lng:126.8447},
  {step:2, name:'산굼부리', addr:'제주시 조천읍 비자림로 768', lat:33.4306, lng:126.6905},
  {step:3, name:'성산일출봉 [세계자연유산]', addr:'서귀포시 성산읍 일출로 284-12', lat:33.4595, lng:126.9407},
  {step:4, name:'해오름', addr:'서귀포시 성산읍 일출로 260', lat:33.4600, lng:126.9347}
];

const cssVar = getComputedStyle(document.documentElement);
const baseColor = (cssVar.getPropertyValue('--c-base')||'#ee853f').trim();

const map = L.map('leafletMap',{scrollWheelZoom:true, zoomControl:true});
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',{attribution:'&copy; OpenStreetMap'}).addTo(map);

const latlngs = [];
stops.forEach(s=>{
  const ll = [s.lat,s.lng];
  latlngs.push(ll);
  const icon = L.divIcon({className:'', html:`<div class="route-pin">${s.step}</div>`, iconSize:[26,26], iconAnchor:[13,26]});
  L.marker(ll,{icon}).addTo(map)
    .bindTooltip({permanent:true, direction:'right', offset:[10,0], opacity:1, className:''});
});
const line = L.polyline(latlngs,{color:baseColor,weight:4,opacity:.95}).addTo(map);
map.fitBounds(line.getBounds(),{padding:[20,20]});
L.control.scale({metric:true, imperial:false}).addTo(map);
</script>
</body>
</html>
