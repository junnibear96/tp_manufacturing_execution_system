<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TP · Board</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css" />
</head>
<body>
  <%@ include file="/WEB-INF/jsp/app/_appHeader.jspf" %>

  <main class="container" role="main">
    <section class="hero" aria-label="Board">
      <div class="hero-grid">
        <div class="card card-strong">
          <div class="kicker">
            <span class="badge">Oracle</span>
            <span class="small">tp_board_post</span>
          </div>
          <h1>게시판</h1>

          <ul class="list">
            <c:forEach items="${posts}" var="p">
              <li>
                <a href="${pageContext.request.contextPath}/app/board/${p.postId}"><c:out value="${p.title}" /></a>
                <div class="small">${p.createdAt}</div>
              </li>
            </c:forEach>
          </ul>
        </div>

        <aside class="card" aria-label="Info">
          <h2 style="margin-top:0;">Scope</h2>
          <p class="small">요구사항대로 list/view만 구현했습니다.</p>
        </aside>
      </div>
    </section>
  </main>
</body>
</html>
