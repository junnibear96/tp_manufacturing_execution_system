<%@ page pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
      <!DOCTYPE html>
      <html lang="ko">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>생산 계획 - TP MES</title>
        <link rel="stylesheet" href="/assets/css/common-dashboard.css">
      </head>

      <body>
        <%@ include file="/WEB-INF/jsp/app/_appHeader.jspf" %>

          <div class="container">
            <div class="page-header">
              <h1 class="page-title">📋 생산 계획</h1>
              <sec:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
                <a href="${pageContext.request.contextPath}/production/plans/new" class="btn-primary">+ 새 계획 등록</a>
              </sec:authorize>
            </div>

            <div class="card">
              <c:choose>
                <c:when test="${empty plans}">
                  <p class="empty-state">등록된 생산 계획이 없습니다.</p>
                </c:when>
                <c:otherwise>
                  <table class="table-modern">
                    <thead>
                      <tr>
                        <th style="width: 100px;">계획 ID</th>
                        <th>계획 일자</th>
                        <th>품목 코드</th>
                        <th style="text-align: right;">계획 수량</th>
                        <th style="text-align: center;">생성일시</th>
                        <sec:authorize access="hasRole('ADMIN')">
                          <th style="text-align: center; width: 120px;">관리</th>
                        </sec:authorize>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${plans}" var="plan">
                        <tr>
                          <td>
                            <strong style="color: #667eea;">#${plan.planId}</strong>
                          </td>
                          <td>${plan.planDate}</td>
                          <td>
                            <span
                              style="background: #edf2f7; padding: 4px 8px; border-radius: 4px; font-size: 13px; font-weight: 600;">
                              ${plan.itemCode}
                            </span>
                          </td>
                          <td style="text-align: right; font-weight: 600; color: #2d3748;">
                            ${plan.qtyPlan}
                          </td>
                          <td style="text-align: center; color: #718096; font-size: 13px;">
                            ${plan.createdAt}
                          </td>
                          <sec:authorize access="hasRole('ADMIN')">
                            <td style="text-align: center;">
                              <form method="post" action="${pageContext.request.contextPath}/production/plans/delete"
                                style="display: inline;">
                                <input type="hidden" name="planId" value="${plan.planId}" />
                                <button type="submit" class="btn-danger"
                                  style="padding: 6px 12px; font-size: 12px;">삭제</button>
                              </form>
                            </td>
                          </sec:authorize>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>

                  <div class="mt-24">
                    <div
                      style="display: flex; justify-content: space-between; align-items: center; padding: 16px; background: #f7fafc; border-radius: 8px;">
                      <div>
                        <strong style="color: #2d3748;">총 계획 수:</strong>
                        <span
                          style="color: #667eea; font-weight: 700; font-size: 18px; margin-left: 8px;">${plans.size()}</span>
                      </div>
                    </div>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
      </body>

      </html>