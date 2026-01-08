<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TP · Production</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css" />
</head>
<body>
  <%@ include file="/WEB-INF/jsp/app/_appHeader.jspf" %>

  <main class="container" role="main">
    <section class="hero" aria-label="Production">
      <div class="hero-grid">
        <div class="card card-strong">
          <div class="kicker">
            <span class="badge">MES</span>
            <span class="small">Production MVP</span>
          </div>
          <h1>생산</h1>
          <ul class="list">
            <li><a href="${pageContext.request.contextPath}/app/production/processes">공정 목록</a></li>
            <li><a href="${pageContext.request.contextPath}/app/production/equipment">설비 목록</a></li>
            <li><a href="${pageContext.request.contextPath}/app/production/plans">생산 계획</a></li>
            <li><a href="${pageContext.request.contextPath}/app/production/results">생산 실적</a></li>
            <li><a href="${pageContext.request.contextPath}/app/production/stats">통계(일/월)</a></li>
          </ul>
          <p class="small">등록/삭제는 /admin/production/* (ROLE_ADMIN)에서 수행합니다.</p>
        </div>

        <aside class="card" aria-label="Notes">
          <h2 style="margin-top:0;">Schema</h2>
          <ul class="list">
            <li>tp_process</li>
            <li>tp_equipment</li>
            <li>tp_prod_plan</li>
            <li>tp_prod_result</li>
          </ul>
        </aside>
      </div>
    </section>
  </main>
</body>
</html>
