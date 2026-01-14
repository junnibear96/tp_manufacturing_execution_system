<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!doctype html>
    <html lang="ko">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <title>TP · Production Stats</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css" />
    </head>

    <body>
      <main class="container" role="main">
        <section class="hero" aria-label="Stats">
          <div class="hero-grid">
            <div class="card card-strong">
              <div class="kicker"><span class="badge">Oracle</span><span class="small">Aggregation</span></div>
              <h1>통계(최근 14일)</h1>
              <div style="overflow:auto;">
                <table style="width:100%; border-collapse:collapse;">
                  <thead>
                    <tr>
                      <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Day
                      </th>
                      <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Plan
                      </th>
                      <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Good
                      </th>
                      <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">NG
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${daily}" var="d">
                      <tr>
                        <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);">
                          <c:out value="${d.bucket}" />
                        </td>
                        <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);">
                          <c:out value="${d.qtyPlan}" />
                        </td>
                        <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);">
                          <c:out value="${d.qtyGood}" />
                        </td>
                        <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);">
                          <c:out value="${d.qtyNg}" />
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>

            <aside class="card" aria-label="Monthly">
              <h2 style="margin-top:0;">월 통계(올해)</h2>
              <div style="overflow:auto;">
                <table style="width:100%; border-collapse:collapse;">
                  <thead>
                    <tr>
                      <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">
                        Month</th>
                      <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Plan
                      </th>
                      <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">Good
                      </th>
                      <th style="text-align:left; padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.12);">NG
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${monthly}" var="m">
                      <tr>
                        <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);">
                          <c:out value="${m.bucket}" />
                        </td>
                        <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);">
                          <c:out value="${m.qtyPlan}" />
                        </td>
                        <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);">
                          <c:out value="${m.qtyGood}" />
                        </td>
                        <td style="padding:10px 8px; border-bottom:1px solid rgba(255,255,255,.08);">
                          <c:out value="${m.qtyNg}" />
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </aside>
          </div>
        </section>
      </main>
    </body>

    </html>