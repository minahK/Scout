<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
  <title>프로필 편집</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- 공통 스타일(인라인) -->
  <style>
    :root{
      --color-light:#ff9752; --color-base:#ee853f; --color-dark:#eb5e00;
      --color-border:#ddd; --color-bg:#f5f8fa; --color-font:#222; --color-white:#fff;
    }
    /* Base */
    *{box-sizing:border-box}
    html,body{height:100%;margin:0;font-family:Arial,sans-serif;background:var(--color-bg);color:var(--color-font)}
    /* 3컬럼 레이아웃 */
    .layout{display:grid;grid-template-columns:260px 1fr 300px;min-height:100vh;background:var(--color-white)}
    .sidebar{border-right:1px solid var(--color-border);padding:16px 12px}
    .main{border-right:1px solid var(--color-border)}
    .rightbar{border-left:1px solid var(--color-border);padding:20px;background:#f7fafc}
    /* 사이드바 공통 */
    .sidebar-logo{text-align:center;margin-bottom:12px}
    .sidebar-logo img{width:90%}
    .sidebar-menu{list-style:none;margin:0;padding:0}
    .sidebar-menu li{margin:8px 0}
    .sidebar-menu a{display:block;padding:10px 14px;border-radius:999px;text-decoration:none;color:var(--color-font);font-weight:700}
    .sidebar-menu a:hover{background:#f3f3f3}
    .sidebar-menu a.active{background:#dfeee6}
    /* 카드/폼 */
    .card{max-width:720px;margin:20px auto;background:#fff;border:1px solid var(--color-border);border-radius:12px;padding:20px}
    h2{margin:0 0 16px 0}
    .row{display:grid;grid-template-columns:180px 1fr;gap:12px;align-items:center;margin-bottom:14px}
    .input{width:100%;padding:10px 12px;border:1px solid var(--color-border);border-radius:8px}
    /* 버튼 */
    .btn{border:none;border-radius:999px;padding:10px 16px;font-weight:700;cursor:pointer}
    .btn-primary{background:var(--color-dark);color:#fff}
    .btn-primary:hover{background:var(--color-base)}
    .btn-ghost{background:transparent;color:var(--color-dark)}
    .btn-outline{background:#fff;border:1px solid var(--color-border);color:var(--color-font)}
    /* 알림 */
    .alert{border-radius:8px;padding:10px 12px;margin-bottom:12px}
    .alert-ok{background:#e6fff2;border:1px solid #b6f0cf}
    .alert-err{background:#fff3f3;border:1px solid #ffd3d3}
    .alert-warn{background:#fffbe6;border:1px solid #ffe58f}
    /* 아바타/프리뷰 */
    .preview{display:flex;align-items:center;justify-content:space-between;gap:12px}
    .preview-left{display:flex;align-items:center;gap:12px}
    .preview img{width:72px;height:72px;border-radius:50%;object-fit:cover;border:1px solid var(--color-border);background:#fff}
    .muted{color:#6b7280;font-size:13px}
    /* 반응형 */
    @media (max-width:1024px){
      .layout{grid-template-columns:1fr}
      .sidebar,.rightbar{display:none}
      .row{grid-template-columns:1fr}
    }
  </style>
</head>
<body>
<div class="layout">

  <!-- 사이드바 -->
  <aside class="sidebar">
    <div class="sidebar-logo" style="text-align:left;">
      <a href="${ctx}/community/profile" class="btn btn-ghost">← 프로필로 돌아가기</a>
    </div>
    <ul class="sidebar-menu">
      <li style="font-weight:700;margin:8px 0;">프로필</li>
      <li><a href="${ctx}/community/profile/edit" class="active">프로필 편집</a></li>
      <li style="margin-top:8px;"><a href="${ctx}/community/settings/account">⚙️ 계정 설정</a></li>
    </ul>
  </aside>

  <!-- 메인 -->
  <main class="main">
    <form class="card" method="post" action="${ctx}/community/profile/edit" enctype="multipart/form-data"
      <c:if test="${preview}">onsubmit="return false" data-preview="true"</c:if>>
      <h2>프로필 편집</h2>

      <c:if test="${not empty msg}">
        <div class="alert alert-ok">${msg}</div>
      </c:if>
      <c:if test="${not empty error}">
        <div class="alert alert-err">${error}</div>
      </c:if>
      <c:if test="${preview}">
        <div class="alert alert-warn">미리보기 모드입니다. 저장하려면 로그인해 주세요.</div>
      </c:if>

      <div class="row">
        <label>현재 프로필 이미지</label>
        <div class="preview">
          <div class="preview-left">
            <img id="avatarPreview"
                 src="${ctx}/image/community/${empty user.profileImage ? 'default-profile.png' : user.profileImage}"
                 alt="avatar" />
            <div class="muted">${empty user.profileImage ? '기본 이미지' : user.profileImage}</div>
          </div>
          <label class="btn btn-outline" <c:if test="${preview}">style="opacity:.5;pointer-events:none"</c:if>>
            이미지 선택
            <input type="file" name="profileImageFile" accept="image/*" style="display:none" <c:if test="${preview}">disabled</c:if>>
          </label>
        </div>
      </div>

      <div class="row">
        <label for="nickname">닉네임</label>
        <input id="nickname" name="nickname" class="input" maxlength="50"
               value="<c:out value='${user.nickname}' default=''/>"
               <c:if test='${preview}'>readonly</c:if> />
      </div>

      <div style="display:flex;gap:8px;justify-content:flex-end;margin-top:16px;">
        <a href="${ctx}/community/profile" class="btn btn-ghost">취소</a>
        <c:choose>
          <c:when test="${preview}">
            <a href="${ctx}/login?redirect=${ctx}/community/profile/edit" class="btn btn-primary">로그인하고 편집</a>
          </c:when>
          <c:otherwise>
            <button type="submit" class="btn btn-primary">저장</button>
          </c:otherwise>
        </c:choose>
      </div>
    </form>
  </main>

  <!-- 필요하면 우측 칼럼 사용 -->
  <aside class="rightbar"></aside>
</div>

<!-- 파일 미리보기 (preview 모드면 비활성) -->
<script>
(function(){
  var form = document.querySelector('form.card');
  if (!form || form.hasAttribute('data-preview')) return;
  var input = form.querySelector('input[name="profileImageFile"]');
  var img   = document.getElementById('avatarPreview');
  if (!input || !img) return;
  input.addEventListener('change', function(e){
    var f = e.target.files && e.target.files[0];
    if (!f) return;
    img.src = URL.createObjectURL(f);
  });
})();
</script>
</body>
</html>
