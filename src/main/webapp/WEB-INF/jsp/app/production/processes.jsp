<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TP · Processes</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css" />
</head>
<body>
  <%@ include file="/WEB-INF/jsp/app/_appHeader.jspf" %>
  <main class="container" role="main">
    <section class="hero" aria-label="Processes">
      <div class="card card-strong">
        <div class="kicker"><span class="badge">Oracle</span><span class="small">tp_process</span></div>
        <h1>공정</h1>
        <ul class="list">
          <c:forEach items="${processes}" var="p">
            <li><strong><c:out value="${p.processCode}" /></strong> · <c:out value="${p.processName}" /></li>
          </c:forEach>
        </ul>
      </div>
    </section>
  </main>
</body>
</html>
