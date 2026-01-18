<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!doctype html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>생산 계획 등록 - TP MES</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common-dashboard.css" />
        </head>

        <body>
            <%@ include file="/WEB-INF/jsp/app/_appHeader.jspf" %>
                <main class="container" role="main">
                    <section class="hero" aria-label="New Plan">
                        <div class="hero-grid">
                            <div class="card card-strong">
                                <div class="kicker"><span class="badge">Production</span><span class="small">생산
                                        계획</span></div>
                                <h1>📋 새 계획 등록</h1>

                                <form method="post" action="${pageContext.request.contextPath}/production/plans/new">
                                    <div style="display:grid; gap:10px;">
                                        <label>
                                            <div class="small">계획 일자 (YYYY-MM-DD)</div>
                                            <input name="planDate" value="<c:out value='${planDate}' />"
                                                style="width:100%; padding:10px;" required />
                                        </label>
                                        <label>
                                            <div class="small">품목 코드</div>
                                            <input name="itemCode" value="<c:out value='${itemCode}' />"
                                                style="width:100%; padding:10px;" required />
                                        </label>
                                        <label>
                                            <div class="small">계획 수량</div>
                                            <input name="qtyPlan" value="<c:out value='${qtyPlan}' />"
                                                style="width:100%; padding:10px;" required />
                                        </label>
                                    </div>

                                    <div style="margin-top:16px; display:flex; gap:8px; align-items:center;">
                                        <button class="btn" type="submit">저장</button>
                                        <a class="btn" href="${pageContext.request.contextPath}/production/plans"
                                            style="text-decoration:none;">취소</a>
                                    </div>
                                </form>
                            </div>

                            <aside class="card" aria-label="Hint">
                                <h2 style="margin-top:0;">안내</h2>
                                <p class="small">날짜는 YYYY-MM-DD 형식으로 입력합니다.</p>
                            </aside>
                        </div>
                    </section>
                </main>
        </body>

        </html>