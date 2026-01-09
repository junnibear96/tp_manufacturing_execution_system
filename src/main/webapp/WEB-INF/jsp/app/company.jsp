<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TP · Company Intro</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css" />
</head>
<body>
  <%@ include file="/WEB-INF/jsp/app/_appHeader.jspf" %>

  <main id="content" class="container" role="main">
    <section class="hero" aria-label="Company Intro">
      <div class="hero-grid">
        <div class="card card-strong">
          <div class="kicker">
            <span class="badge">Company</span>
            <span class="small">소개 페이지</span>
          </div>
          <h1>TP</h1>
          <p>
            제조 현장에서 바로 쓰이는 실행 시스템을 지향합니다.
            내부 시스템(/app)과 데이터 기반 페이지를 함께 구성해, "업무형 포트폴리오" 형태로 보여줍니다.
          </p>
          <p class="small">서버 시간: ${now}</p>
          <div style="margin-top:14px; display:flex; gap:8px; flex-wrap:wrap;">
            <a class="btn" href="${pageContext.request.contextPath}/app/company/sections">DB 섹션 보기</a>
          </div>
        </div>

        <aside class="card" aria-label="핵심 키워드">
          <h2 style="margin-top:0;">핵심 키워드</h2>
          <div class="chips" role="list" aria-label="키워드">
            <c:forEach var="k" items="${keywords}">
              <span class="chip" role="listitem">${k}</span>
            </c:forEach>
          </div>
          <p class="small" style="margin-top:12px;">DB 섹션 그룹: <strong>${menuGroupCount}</strong></p>
        </aside>
      </div>
    </section>

    <section class="section" aria-label="Company Overview">
      <div class="card">
        <h2 style="margin-top:0;">회사 개요</h2>
        <div class="grid-2" style="margin-top:12px;">
          <div class="card">
            <h3>미션</h3>
            <p class="small">현장 운영을 단순화하고, 품질/납기를 데이터로 관리할 수 있는 시스템을 제공합니다.</p>
          </div>
          <div class="card">
            <h3>비전</h3>
            <p class="small">표준화된 프로세스와 실행 가능한 데이터로 제조 경쟁력을 강화합니다.</p>
          </div>
        </div>
      </div>
    </section>

    <section class="section" aria-label="Key Sections">
      <div class="card">
        <h2 style="margin-top:0;">주요 메뉴(샘플)</h2>
        <p class="small">아래 구성은 기업형 사이트 UI 느낌을 내기 위한 샘플입니다.</p>
        <div class="cards" style="margin-top:12px;">
          <details class="card">
            <summary><strong>TP 소개</strong> <span class="small">CEO/연혁/비전</span></summary>
            <ul class="list" style="margin-top:12px;">
              <li>CEO 인사말</li>
              <li>연혁</li>
              <li>미션·비전</li>
              <li>CI</li>
              <li>계열사</li>
              <li>글로벌 사업장</li>
            </ul>
          </details>
          <details class="card">
            <summary><strong>사업부문</strong> <span class="small">제조/소재/브랜드</span></summary>
            <ul class="list" style="margin-top:12px;">
              <li>의류 제조</li>
              <li>소재</li>
              <li>브랜드</li>
              <li>부동산</li>
            </ul>
          </details>
          <details class="card">
            <summary><strong>지속가능</strong> <span class="small">환경/윤리</span></summary>
            <ul class="list" style="margin-top:12px;">
              <li>환경경영</li>
              <li>사회적 책임</li>
              <li>윤리경영</li>
            </ul>
          </details>
        </div>
      </div>
    </section>
  </main>

  <%@ include file="/partials/footer.jspf" %>
  <script src="${pageContext.request.contextPath}/assets/app.js" defer></script>
</body>
</html>
