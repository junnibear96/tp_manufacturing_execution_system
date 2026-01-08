<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TP · Intro</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css" />
</head>
<body>
  <a class="skip" href="#content">본문으로 바로가기</a>

  <header class="landing-top" role="banner">
    <div class="landing-top-inner">
      <a class="landing-logo" href="${pageContext.request.contextPath}/" aria-label="TP Home">TP</a>
      <nav class="landing-actions" aria-label="Language and menu">
        <a class="landing-action" href="#" aria-disabled="true">KOR</a>
        <span class="landing-sep" aria-hidden="true">·</span>
        <a class="landing-action" href="#" aria-disabled="true">ENG</a>
        <button class="landing-menu" type="button" aria-label="Menu" disabled>
          <span class="bar" aria-hidden="true"></span>
          <span class="bar" aria-hidden="true"></span>
          <span class="bar" aria-hidden="true"></span>
        </button>
      </nav>
    </div>
  </header>

  <main id="content" class="landing" role="main">
    <div class="landing-overlay" aria-hidden="true"></div>

    <section class="landing-center" aria-label="Intro">
      <h1>현장을 위한 실행 가능한 시스템</h1>
      <p class="landing-sub">Your Trusted Partner · TP</p>
      <p class="small" style="margin-top:18px;">서버 시간: ${now}</p>

      <div class="landing-chips" role="list" aria-label="Quick links">
        <a class="chip" role="listitem" href="${pageContext.request.contextPath}/mvc/company">회사 소개</a>
        <a class="chip" role="listitem" href="${pageContext.request.contextPath}/mvc/portfolio">포트폴리오</a>
        <a class="chip" role="listitem" href="${pageContext.request.contextPath}/api/health">Health</a>
      </div>

      <div class="landing-keywords" aria-label="Keywords">
        <div class="chips" role="list" aria-label="키워드">
          <c:forEach var="k" items="${keywords}">
            <span class="chip" role="listitem"><c:out value="${k}" /></span>
          </c:forEach>
        </div>
      </div>
    </section>

    <section class="landing-bottom" aria-label="Brands">
      <div class="brand-strip" role="list">
        <div class="brand-item" role="listitem"><span class="dot" aria-hidden="true"></span><span>TP</span></div>
        <div class="brand-item" role="listitem"><span class="dot" aria-hidden="true"></span><span>TP Nadia</span></div>
        <div class="brand-item" role="listitem"><span class="dot" aria-hidden="true"></span><span>EO</span></div>
        <div class="brand-item" role="listitem"><span class="dot" aria-hidden="true"></span><span>TP Living</span></div>
        <div class="brand-item" role="listitem"><span class="dot" aria-hidden="true"></span><span>TP F&amp;B</span></div>
        <div class="brand-item" role="listitem"><span class="dot" aria-hidden="true"></span><span>TP Square</span></div>
      </div>
    </section>
  </main>

  <script src="${pageContext.request.contextPath}/assets/app.js" defer></script>
</body>
</html>
