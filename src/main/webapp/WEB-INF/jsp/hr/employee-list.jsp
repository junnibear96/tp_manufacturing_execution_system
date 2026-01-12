<%@ page pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>사원 관리 - TP MES</title>
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }

                body {
                    font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
                    background: #f5f7fa;
                    color: #333;
                }

                .container {
                    max-width: 1400px;
                    margin: 0 auto;
                    padding: 40px 20px;
                }

                h1 {
                    font-size: 32px;
                    font-weight: 700;
                    margin-bottom: 10px;
                    color: #1a202c;
                }

                .subtitle {
                    color: #718096;
                    margin-bottom: 30px;
                }

                .actions {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 25px;
                }

                .filters {
                    display: flex;
                    gap: 15px;
                    align-items: center;
                }

                .filters label {
                    font-weight: 500;
                    color: #4a5568;
                    margin-right: 8px;
                }

                .filters select {
                    padding: 8px 12px;
                    border: 1px solid #cbd5e0;
                    border-radius: 6px;
                    font-size: 14px;
                    background: white;
                }

                .btn {
                    padding: 10px 20px;
                    border: none;
                    border-radius: 6px;
                    font-size: 14px;
                    font-weight: 600;
                    cursor: pointer;
                    text-decoration: none;
                    display: inline-block;
                    transition: all 0.2s;
                }

                .btn-primary {
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    color: white;
                }

                .btn-primary:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
                }

                .btn-secondary {
                    background: #e2e8f0;
                    color: #4a5568;
                }

                .btn-secondary:hover {
                    background: #cbd5e0;
                }

                .table-container {
                    background: white;
                    border-radius: 8px;
                    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
                    overflow: hidden;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                }

                thead {
                    background: #f7fafc;
                    border-bottom: 2px solid #e2e8f0;
                }

                th {
                    padding: 16px;
                    text-align: left;
                    font-weight: 600;
                    color: #2d3748;
                    font-size: 14px;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                td {
                    padding: 16px;
                    border-bottom: 1px solid #e2e8f0;
                    font-size: 14px;
                }

                tbody tr {
                    transition: background 0.2s;
                }

                tbody tr:hover {
                    background: #f7fafc;
                }

                .emp-link {
                    color: #667eea;
                    text-decoration: none;
                    font-weight: 600;
                }

                .emp-link:hover {
                    text-decoration: underline;
                }

                .badge {
                    display: inline-block;
                    padding: 4px 12px;
                    border-radius: 12px;
                    font-size: 12px;
                    font-weight: 600;
                }

                .badge-active {
                    background: #c6f6d5;
                    color: #22543d;
                }

                .badge-leave {
                    background: #feebc8;
                    color: #7c2d12;
                }

                .badge-retired {
                    background: #e2e8f0;
                    color: #4a5568;
                }

                .message {
                    background: #d4edda;
                    border: 1px solid #c3e6cb;
                    color: #155724;
                    padding: 12px 16px;
                    border-radius: 6px;
                    margin-bottom: 20px;
                }

                .empty-state {
                    text-align: center;
                    padding: 60px 20px;
                    color: #718096;
                }

                .empty-state svg {
                    width: 80px;
                    height: 80px;
                    margin-bottom: 20px;
                    opacity: 0.5;
                }
            </style>
        </head>

        <body>
            <%@ include file="../include/header.jspf" %>

                <div class="container">
                    <h1>📋 사원 관리</h1>
                    <p class="subtitle">조직 구성원 정보를 관리합니다</p>

                    <c:if test="${not empty message}">
                        <div class="message">${message}</div>
                    </c:if>

                    <div class="actions">
                        <div class="filters">
                            <form method="get" action="/hr/employees"
                                style="display: flex; gap: 15px; align-items: center;">
                                <div>
                                    <label>부서:</label>
                                    <select name="department" onchange="this.form.submit()">
                                        <option value="">전체</option>
                                        <c:forEach items="${departments}" var="dept">
                                            <option value="${dept.departmentId}" <c:if
                                                test="${dept.departmentId == selectedDepartment}">selected</c:if>>
                                                ${dept.deptName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div>
                                    <label>재직상태:</label>
                                    <select name="status" onchange="this.form.submit()">
                                        <option value="">전체</option>
                                        <option value="ACTIVE" <c:if test="${selectedStatus == 'ACTIVE'}">selected
                                            </c:if>>재직</option>
                                        <option value="LEAVE" <c:if test="${selectedStatus == 'LEAVE'}">selected</c:if>
                                            >휴직</option>
                                        <option value="RETIRED" <c:if test="${selectedStatus == 'RETIRED'}">selected
                                            </c:if>>퇴직</option>
                                    </select>
                                </div>
                            </form>
                        </div>

                        <a href="/hr/employees/new" class="btn btn-primary">+ 신규 사원 등록</a>
                    </div>

                    <div class="table-container">
                        <c:choose>
                            <c:when test="${empty employees}">
                                <div class="empty-state">
                                    <p style="font-size: 18px; font-weight: 600; margin-bottom: 8px;">등록된 사원이 없습니다</p>
                                    <p>신규 사원을 등록하거나 DB 스키마를 확인하세요</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>사번</th>
                                            <th>이름</th>
                                            <th>부서</th>
                                            <th>직급</th>
                                            <th>근무유형</th>
                                            <th>재직상태</th>
                                            <th>이메일</th>
                                            <th>입사일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${employees}" var="emp">
                                            <tr>
                                                <td><code>${emp.empId}</code></td>
                                                <td>
                                                    <a href="/hr/employees/${emp.empId}"
                                                        class="emp-link">${emp.empName}</a>
                                                </td>
                                                <td>${emp.deptName}</td>
                                                <td>${emp.positionName}</td>
                                                <td>${emp.jobType}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${emp.status == 'ACTIVE'}">
                                                            <span class="badge badge-active">재직</span>
                                                        </c:when>
                                                        <c:when test="${emp.status == 'LEAVE'}">
                                                            <span class="badge badge-leave">휴직</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge badge-retired">${emp.status}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${emp.email}</td>
                                                <td>${emp.hireDate}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div style="margin-top: 20px; text-align: center; color: #718096; font-size: 14px;">
                        총 <strong>${employees.size()}</strong>명의 사원이 조회되었습니다
                    </div>
                </div>

                <%@ include file="../include/footer.jspf" %>
        </body>

        </html>