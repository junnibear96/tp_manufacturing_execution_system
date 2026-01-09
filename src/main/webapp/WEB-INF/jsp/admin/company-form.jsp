<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TP · Admin · Company</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css" />
</head>
<body>
  <%@ include file="/WEB-INF/jsp/app/_appHeader.jspf" %>

  <main class="container" role="main">
    <section class="hero" aria-label="Admin Company">
      <div class="hero-grid">
        <div class="card card-strong">
          <div class="kicker">
            <span class="badge">Admin</span>
            <span class="small">${mode}</span>
          </div>
          <h1>그룹사 ${mode == 'create' ? '등록' : '수정'}</h1>

          <c:choose>
            <c:when test="${mode == 'create'}">
              <c:set var="formAction" value="${pageContext.request.contextPath}/admin/companies/new" />
            </c:when>
            <c:otherwise>
              <c:set var="formAction" value="${pageContext.request.contextPath}/admin/companies/${companyId}/edit" />
            </c:otherwise>
          </c:choose>

          <form method="post" action="${formAction}">
            <div style="display:grid; gap:10px;">
              <label>
                <div class="small">Company Code</div>
                <input name="companyCode" value="<c:out value='${companyCode}' />" style="width:100%; padding:10px;" required />
              </label>
              <label>
                <div class="small">Company Name</div>
                <input name="companyName" value="<c:out value='${companyName}' />" style="width:100%; padding:10px;" required />
              </label>
              <label>
                <div class="small">Description</div>
                <textarea name="description" rows="5" style="width:100%; padding:10px;"><c:out value="${description}" /></textarea>
              </label>
              <label>
                <div class="small">Active</div>
                <select name="activeYn" style="width:100%; padding:10px;">
                  <option value="Y" <c:if test="${activeYn == 'Y'}">selected</c:if>>Y</option>
                  <option value="N" <c:if test="${activeYn == 'N'}">selected</c:if>>N</option>
                </select>
              </label>
            </div>

            <div style="margin-top:16px; display:flex; gap:8px; align-items:center;">
              <button class="btn" type="submit">Save</button>
              <a class="btn" href="${pageContext.request.contextPath}/app/companies" style="text-decoration:none;">Cancel</a>
            </div>
          </form>

          <c:if test="${mode == 'edit'}">
            <form method="post" action="${pageContext.request.contextPath}/admin/companies/${companyId}/delete" style="margin-top:14px;">
              <button class="btn" type="submit">Delete</button>
              <span class="small" style="margin-left:8px;">주의: 실제 DB 삭제입니다.</span>
            </form>
          </c:if>
        </div>

        <aside class="card" aria-label="Help">
          <h2 style="margin-top:0;">Tips</h2>
          <p class="small">company_code는 UNIQUE 입니다.</p>
          <p class="small">테이블이 없으면 Repository가 no-op/fallback으로 동작합니다.</p>
        </aside>
      </div>
    </section>
  </main>
</body>
</html>
