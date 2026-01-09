<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TP · Production Results</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css" />
</head>
<body>
  <%@ include file="/WEB-INF/jsp/app/_appHeader.jspf" %>
  <main class="container" role="main">
    <section class="hero" aria-label="Results">
      <div class="hero-grid">
        <div class="card card-strong">
          <div class="kicker"><span class="badge">Oracle</span><span class="small">tp_prod_result</span></div>
          <h1>생산 실적</h1>
          <div style="overflow:auto;">
            <table style="width:100%; border-collapse:collapse;">
              <thead>
                <tr>
                  <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Date</th>
                  <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Item</th>
                  <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Good</th>
                  <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">NG</th>
                  <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Equipment</th>
                  <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Created</th>
                  <c:if test="${sessionScope.AUTH_USER != null && sessionScope.AUTH_USER.hasRole('ROLE_ADMIN')}">
                    <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Admin</th>
                  </c:if>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${results}" var="r">
                  <tr>
                    <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);"><c:out value="${r.workDate}" /></td>
                    <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);"><c:out value="${r.itemCode}" /></td>
                    <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);"><c:out value="${r.qtyGood}" /></td>
                    <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);"><c:out value="${r.qtyNg}" /></td>
                    <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);"><c:out value="${r.equipmentName}" /></td>
                    <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);"><c:out value="${r.createdAt}" /></td>
                    <c:if test="${sessionScope.AUTH_USER != null && sessionScope.AUTH_USER.hasRole('ROLE_ADMIN')}">
                      <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);">
                        <form method="post" action="${pageContext.request.contextPath}/admin/production/results/delete" style="display:inline;">
                          <input type="hidden" name="resultId" value="${r.resultId}" />
                          <button class="btn" type="submit">Delete</button>
                        </form>
                      </td>
                    </c:if>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>

        <aside class="card" aria-label="Admin">
          <h2 style="margin-top:0;">Admin</h2>
          <c:if test="${sessionScope.AUTH_USER != null && sessionScope.AUTH_USER.hasRole('ROLE_ADMIN')}">
            <p><a class="btn" href="${pageContext.request.contextPath}/admin/production/results/new">+ New Result</a></p>
          </c:if>
          <p class="small">등록/삭제는 ROLE_ADMIN만 가능합니다.</p>
        </aside>
      </div>
    </section>
  </main>
</body>
</html>
