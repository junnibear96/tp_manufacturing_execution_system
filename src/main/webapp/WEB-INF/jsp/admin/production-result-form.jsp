<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TP · Admin · Production Result</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css" />
</head>
<body>
  <%@ include file="/WEB-INF/jsp/app/_appHeader.jspf" %>
  <main class="container" role="main">
    <section class="hero" aria-label="New Result">
      <div class="hero-grid">
        <div class="card card-strong">
          <div class="kicker"><span class="badge">Admin</span><span class="small">tp_prod_result</span></div>
          <h1>실적 등록</h1>

          <form method="post" action="${pageContext.request.contextPath}/admin/production/results/new">
            <div style="display:grid; gap:10px;">
              <label>
                <div class="small">Work Date (YYYY-MM-DD)</div>
                <input name="workDate" value="<c:out value='${workDate}' />" style="width:100%; padding:10px;" required />
              </label>
              <label>
                <div class="small">Item Code</div>
                <input name="itemCode" value="<c:out value='${itemCode}' />" style="width:100%; padding:10px;" required />
              </label>
              <label>
                <div class="small">Qty Good</div>
                <input name="qtyGood" value="<c:out value='${qtyGood}' />" style="width:100%; padding:10px;" required />
              </label>
              <label>
                <div class="small">Qty NG</div>
                <input name="qtyNg" value="<c:out value='${qtyNg}' />" style="width:100%; padding:10px;" required />
              </label>
              <label>
                <div class="small">Equipment (optional)</div>
                <select name="equipmentId" style="width:100%; padding:10px;">
                  <option value="">(none)</option>
                  <c:forEach items="${equipmentList}" var="e">
                    <option value="${e.equipmentId}"><c:out value="${e.equipmentCode}" /> · <c:out value="${e.equipmentName}" /></option>
                  </c:forEach>
                </select>
              </label>
            </div>

            <div style="margin-top:16px; display:flex; gap:8px; align-items:center;">
              <button class="btn" type="submit">Save</button>
              <a class="btn" href="${pageContext.request.contextPath}/app/production/results" style="text-decoration:none;">Cancel</a>
            </div>
          </form>
        </div>

        <aside class="card" aria-label="Hint">
          <h2 style="margin-top:0;">Hint</h2>
          <p class="small">설비는 optional입니다.</p>
        </aside>
      </div>
    </section>
  </main>
</body>
</html>
