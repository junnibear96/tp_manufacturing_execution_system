<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TP · Admin · Notice</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css" />
</head>
<body>
  <%@ include file="/WEB-INF/jsp/app/_appHeader.jspf" %>

  <main class="container" role="main">
    <section class="hero" aria-label="Admin Notice">
      <div class="hero-grid">
        <div class="card card-strong">
          <div class="kicker">
            <span class="badge">Admin</span>
            <span class="small">tp_notice</span>
          </div>
          <h1>공지 등록</h1>

          <form method="post" action="${pageContext.request.contextPath}/admin/notices/new">
            <div style="display:grid; gap:10px;">
              <label>
                <div class="small">Title</div>
                <input name="title" value="<c:out value='${title}' />" style="width:100%; padding:10px;" required />
              </label>
              <label>
                <div class="small">Body</div>
                <textarea name="body" rows="10" style="width:100%; padding:10px;" required><c:out value="${body}" /></textarea>
              </label>
            </div>

            <div style="margin-top:16px; display:flex; gap:8px; align-items:center;">
              <button class="btn" type="submit">Publish</button>
              <a class="btn" href="${pageContext.request.contextPath}/app/notices" style="text-decoration:none;">Cancel</a>
            </div>
          </form>
        </div>

        <aside class="card" aria-label="Help">
          <h2 style="margin-top:0;">Notes</h2>
          <p class="small">created_by는 로그인 사용자 ID로 저장됩니다.</p>
        </aside>
      </div>
    </section>
  </main>
</body>
</html>
