<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TP · Group Companies</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css" />
</head>
<body>
  <%@ include file="/WEB-INF/jsp/app/_appHeader.jspf" %>

  <main class="container" role="main">
    <section class="hero" aria-label="Companies">
      <div class="hero-grid">
        <div class="card card-strong">
          <div class="kicker">
            <span class="badge">Oracle</span>
            <span class="small">tp_group_company</span>
          </div>
          <h1>그룹사 목록</h1>
          <p class="small">조회는 /app, 등록/수정은 /admin (ROLE_ADMIN)에서 수행합니다.</p>

          <div style="overflow:auto;">
            <table style="width:100%; border-collapse:collapse;">
              <thead>
                <tr>
                  <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Code</th>
                  <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Name</th>
                  <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Active</th>
                  <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Created</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${companies}" var="c">
                  <tr>
                    <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);"><c:out value="${c.companyCode}" /></td>
                    <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);">
                      <c:out value="${c.companyName}" />
                      <div class="small" style="margin-top:4px; opacity:.9;"><c:out value="${c.description}" /></div>
                      <c:if test="${sessionScope.AUTH_USER != null && sessionScope.AUTH_USER.hasRole('ROLE_ADMIN')}">
                        <div class="small" style="margin-top:8px;">
                          <a href="${pageContext.request.contextPath}/admin/companies/${c.companyId}/edit">Edit</a>
                        </div>
                      </c:if>
                    </td>
                    <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);"><c:out value="${c.activeYn}" /></td>
                    <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);"><c:out value="${c.createdAt}" /></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>

        <aside class="card" aria-label="Admin">
          <h2 style="margin-top:0;">Admin</h2>
          <c:choose>
            <c:when test="${sessionScope.AUTH_USER != null && sessionScope.AUTH_USER.hasRole('ROLE_ADMIN')}">
              <p><a class="btn" href="${pageContext.request.contextPath}/admin/companies/new">+ New Company</a></p>
              <p class="small">등록/수정은 ROLE_ADMIN만 가능합니다.</p>
            </c:when>
            <c:otherwise>
              <p class="small">관리자 권한이 없으면 등록/수정 메뉴가 표시되지 않습니다.</p>
            </c:otherwise>
          </c:choose>
        </aside>
      </div>
    </section>
  </main>
</body>
</html>
