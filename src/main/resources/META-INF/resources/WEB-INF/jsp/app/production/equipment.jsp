<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TP · Equipment</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css" />
</head>
<body>
  <%@ include file="/WEB-INF/jsp/app/_appHeader.jspf" %>
  <main class="container" role="main">
    <section class="hero" aria-label="Equipment">
      <div class="card card-strong">
        <div class="kicker"><span class="badge">Oracle</span><span class="small">tp_equipment</span></div>
        <h1>설비</h1>
        <div style="overflow:auto;">
          <table style="width:100%; border-collapse:collapse;">
            <thead>
              <tr>
                <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Code</th>
                <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Name</th>
                <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Process</th>
                <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Active</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${equipment}" var="e">
                <tr>
                  <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);"><c:out value="${e.equipmentCode}" /></td>
                  <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);"><c:out value="${e.equipmentName}" /></td>
                  <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);"><c:out value="${e.processName}" /></td>
                  <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);"><c:out value="${e.activeYn}" /></td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </section>
  </main>
</body>
</html>
