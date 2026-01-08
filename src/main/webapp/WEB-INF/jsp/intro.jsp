<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TP 포트폴리오 · Intro</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css" />
</head>
<body>
  <%@ include file="/partials/header.jspf" %>

  <main id="content" class="container" role="main">
    <section class="hero" aria-label="Intro">
      <div class="hero-grid">
        <div class="card card-strong">
          <div class="kicker">
            <span class="badge">JSP + Spring MVC</span>
            <span class="small">Controller · Service · Repository · Model</span>
          </div>
          <h1>TP 지원용 포트폴리오</h1>
          <p>
            JSP 기반 화면과 Spring MVC 구조를 함께 보여주는 데모 프로젝트입니다.
            아래 링크에서 MVC 화면과 API 상태를 바로 확인할 수 있습니다.
          </p>
          <p class="small">서버 시간: ${now}</p>
        </div>

        <aside class="card" aria-label="Quick links">
          <h2 style="margin-top:0;">바로가기</h2>
          <ul class="list">
            <li><a href="${pageContext.request.contextPath}/mvc/portfolio">MVC 포트폴리오</a></li>
            <li><a href="${pageContext.request.contextPath}/mvc/company">MVC 회사 소개</a></li>
            <li><a href="${pageContext.request.contextPath}/api/health">API Health</a></li>
          </ul>
          <p class="small">(정적 JSP) <a href="${pageContext.request.contextPath}/index.jsp">index.jsp</a> · <a href="${pageContext.request.contextPath}/company.jsp">company.jsp</a></p>
        </aside>
      </div>
    </section>

    <section class="section" aria-label="Run">
      <div class="card">
        <h2>운영 포인트</h2>
        <div class="grid-2" style="margin-top:12px;">
          <div class="card">
            <h3>MVC 레이어</h3>
            <ul class="list">
              <li>Controller: 요청/응답, View 선택</li>
              <li>Service: 페이지 데이터 조립</li>
              <li>Repository: Oracle 조회(JdbcTemplate)</li>
              <li>Model: View에 전달할 DTO</li>
            </ul>
          </div>
          <div class="card">
            <h3>DB 연동</h3>
            <ul class="list">
              <li>Oracle 접속은 환경변수로 주입</li>
              <li>테이블이 없으면 fallback 데이터로 표시</li>
              <li>테이블 생성/샘플 데이터: scripts/oracle-*.sql</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
  </main>

  <%@ include file="/partials/footer.jspf" %>
  <script src="${pageContext.request.contextPath}/assets/app.js" defer></script>
</body>
</html>
