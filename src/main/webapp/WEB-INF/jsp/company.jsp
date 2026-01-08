<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TP 회사 소개 (MVC)</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css" />
</head>
<body>
  <%@ include file="/partials/header.jspf" %>

  <main id="content" class="container" role="main">
    <section class="hero" aria-label="TP 소개">
      <div class="hero-grid">
        <div class="card card-strong">
          <div class="kicker">
            <span class="badge">Spring MVC</span>
            <span class="small">회사 소개 (Controller → Model)</span>
          </div>
          <h1>TP</h1>
          <p>
            제조 현장의 운영 효율과 품질 향상을 목표로,
            그룹사 및 자체 생산 시스템(MES)의 개발·운영을 수행합니다.
          </p>
          <p class="small">서버 시간: ${now}</p>
        </div>

        <aside class="card" aria-label="핵심 키워드">
          <h2 style="margin-top:0;">핵심 키워드</h2>
          <div class="chips" role="list" aria-label="키워드">
            <c:forEach var="k" items="${keywords}">
              <span class="chip" role="listitem">${k}</span>
            </c:forEach>
          </div>
        </aside>
      </div>
    </section>

    <section class="section" aria-label="회사 메뉴">
      <div class="card">
        <h2 style="margin-top:0;">회사 소개 메뉴</h2>
        <p class="small">Oracle 데이터( tp_company_section )를 읽어 카테고리별로 그룹핑하여 렌더링합니다.</p>

        <c:forEach var="g" items="${menuGroups}">
          <details class="card" style="margin-top:12px;">
            <summary>
              <strong>${g.title}</strong>
              <span class="small">(${fn:length(g.sections)})</span>
            </summary>
            <div style="margin-top:12px;">
              <ul class="list">
                <c:forEach var="s" items="${g.sections}">
                  <li><a href="#${s.anchor}">${s.title}</a></li>
                </c:forEach>
              </ul>

              <c:forEach var="s" items="${g.sections}">
                <article id="${s.anchor}" class="card" style="margin-top:12px;">
                  <h3 style="margin-top:0;"><c:out value="${s.title}" /></h3>
                  <p><c:out value="${s.body}" /></p>
                </article>
              </c:forEach>
            </div>
          </details>
        </c:forEach>
      </div>
    </section>
  </main>

  <%@ include file="/partials/footer.jspf" %>
  <script src="${pageContext.request.contextPath}/assets/app.js" defer></script>
</body>
</html>
