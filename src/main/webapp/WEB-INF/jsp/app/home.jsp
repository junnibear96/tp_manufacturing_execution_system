<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TP · App Home</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css" />
</head>
<body>
  <%@ include file="/WEB-INF/jsp/app/_appHeader.jspf" %>

  <main id="content" class="container" role="main">
    <section class="hero" aria-label="Home">
      <div class="hero-grid">
        <div class="card card-strong">
          <div class="kicker">
            <span class="badge">Spring MVC</span>
            <span class="small">Session · ROLE</span>
          </div>
          <h1>내부 시스템</h1>
          <p>로그인 사용자: <strong><c:out value="${user.displayName}" /></strong> (<c:out value="${user.username}" />)</p>
          <p class="small">서버 시간: ${now}</p>
        </div>

        <aside class="card" aria-label="Modules">
          <h2 style="margin-top:0;">모듈</h2>
          <ul class="list">
            <li><a href="${pageContext.request.contextPath}/app/companies">그룹사 정보 관리</a></li>
            <li><a href="${pageContext.request.contextPath}/app/notices">공지사항</a> / <a href="${pageContext.request.contextPath}/app/board">게시판</a></li>
            <li>생산 계획 / 실적 / 설비 / 통계</li>
            <li>관리자 화면(/admin/*)</li>
          </ul>
          <p class="small">그룹사/공지/게시판은 현재 동작하는 MVP입니다.</p>
        </aside>
      </div>
    </section>
  </main>
</body>
</html>

