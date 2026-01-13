<%@ page pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>생산라인 관리 - TP MES</title>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
                rel="stylesheet">
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }

                body {
                    font-family: 'Inter', 'Noto Sans KR', sans-serif;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    min-height: 100vh;
                }

                .container {
                    max-width: 1600px;
                    margin: 0 auto;
                    padding: 40px 20px;
                }

                .page-header {
                    background: white;
                    border-radius: 16px;
                    padding: 32px;
                    margin-bottom: 24px;
                    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
                    animation: fadeIn 0.5s ease-out forwards;
                }

                .page-header h1 {
                    font-size: 28px;
                    font-weight: 700;
                    color: #1a202c;
                    margin-bottom: 8px;
                }

                .filter-card {
                    background: white;
                    border-radius: 16px;
                    padding: 24px;
                    margin-bottom: 24px;
                    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
                    animation: fadeIn 0.5s ease-out forwards;
                }

                .filter-row {
                    display: grid;
                    grid-template-columns: 1fr 1fr auto;
                    gap: 16px;
                    align-items: end;
                }

                .filter-group {
                    display: flex;
                    flex-direction: column;
                    gap: 8px;
                }

                .filter-group label {
                    font-weight: 600;
                    color: #4a5568;
                    font-size: 13px;
                    text-transform: uppercase;
                }

                .filter-group select {
                    padding: 12px 16px;
                    border: 2px solid #e2e8f0;
                    border-radius: 10px;
                    font-size: 14px;
                    background: #f7fafc;
                    transition: all 0.2s;
                }

                .btn {
                    padding: 12px 24px;
                    border: none;
                    border-radius: 10px;
                    font-size: 14px;
                    font-weight: 600;
                    cursor: pointer;
                    text-decoration: none;
                    display: inline-flex;
                    align-items: center;
                    gap: 8px;
                    transition: all 0.3s;
                }

                .btn-primary {
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    color: white;
                    box-shadow: 0 4px 14px 0 rgba(102, 126, 234, 0.4);
                }

                .btn-primary:hover {
                    transform: translateY(-2px);
                }

                .table-container {
                    background: white;
                    border-radius: 16px;
                    overflow: hidden;
                    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
                    animation: fadeIn 0.5s ease-out forwards;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                }

                thead {
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                }

                th {
                    padding: 18px 16px;
                    text-align: left;
                    font-weight: 600;
                    color: white;
                    font-size: 13px;
                    text-transform: uppercase;
                }

                td {
                    padding: 16px;
                    border-bottom: 1px solid #f0f4f8;
                    font-size: 14px;
                }

                tbody tr:nth-child(even) {
                    background: #fafbfc;
                }

                tbody tr:hover {
                    background: #f0f4f8;
                }

                .badge {
                    display: inline-block;
                    padding: 6px 14px;
                    border-radius: 20px;
                    font-size: 12px;
                    font-weight: 600;
                }

                .badge-running {
                    background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
                    color: white;
                    animation: pulse 2s infinite;
                }

                .badge-stopped {
                    background: #cbd5e0;
                    color: #4a5568;
                }

                .badge-idle {
                    background: linear-gradient(135deg, #ecc94b 0%, #d69e2e 100%);
                    color: white;
                }

                .badge-maintenance {
                    background: linear-gradient(135deg, #ed8936 0%, #dd6b20 100%);
                    color: white;
                }

                .badge-error {
                    background: linear-gradient(135deg, #f56565 0%, #e53e3e 100%);
                    color: white;
                }

                .progress-bar {
                    width: 100px;
                    height: 8px;
                    background: #e2e8f0;
                    border-radius: 4px;
                    overflow: hidden;
                }

                .progress-fill {
                    height: 100%;
                    background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
                    transition: width 0.3s;
                }

                @keyframes pulse {

                    0%,
                    100% {
                        opacity: 1;
                    }

                    50% {
                        opacity: 0.7;
                    }
                }

                @keyframes fadeIn {
                    from {
                        opacity: 0;
                        transform: translateY(10px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }
            </style>
        </head>

        <body>
            <%@ include file="../include/header.jspf" %>

                <div class="container">
                    <div class="page-header">
                        <h1>⚙️ 생산라인 관리</h1>
                        <p class="subtitle">실시간 생산 현황을 모니터링하고 관리합니다</p>
                    </div>

                    <c:if test="${not empty message}">
                        <div
                            style="background: linear-gradient(135deg, #48bb78 0%, #38a169 100%); color: white; padding: 16px 20px; border-radius: 12px; margin-bottom: 24px;">
                            ${message}
                        </div>
                    </c:if>

                    <div class="filter-card">
                        <form method="get" action="/factory/lines" id="filterForm">
                            <div class="filter-row">
                                <div class="filter-group">
                                    <label>🏭 공장</label>
                                    <select name="factory" id="factorySelect">
                                        <option value="">전체 공장</option>
                                        <c:forEach items="${factories}" var="fac">
                                            <option value="${fac.factoryId}" ${selectedFactory==fac.factoryId
                                                ? 'selected' : '' }>
                                                ${fac.factoryName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="filter-group">
                                    <label>📊 운영 상태</label>
                                    <select name="status" id="statusSelect">
                                        <option value="">전체 상태</option>
                                        <option value="RUNNING" ${selectedStatus=='RUNNING' ? 'selected' : '' }>가동 중
                                        </option>
                                        <option value="STOPPED" ${selectedStatus=='STOPPED' ? 'selected' : '' }>정지
                                        </option>
                                        <option value="IDLE" ${selectedStatus=='IDLE' ? 'selected' : '' }>대기</option>
                                        <option value="MAINTENANCE" ${selectedStatus=='MAINTENANCE' ? 'selected' : '' }>
                                            점검</option>
                                        <option value="ERROR" ${selectedStatus=='ERROR' ? 'selected' : '' }>오류</option>
                                    </select>
                                </div>

                                <div class="filter-group">
                                    <button type="submit" class="btn btn-primary">필터 적용</button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div style="display: flex; justify-content: flex-end; margin-bottom: 16px;">
                        <a href="/factory/lines/new" class="btn btn-primary">
                            ➕ 신규 라인 등록
                        </a>
                    </div>

                    <div class="table-container">
                        <c:choose>
                            <c:when test="${empty lines}">
                                <div style="text-align: center; padding: 60px; color: #718096;">
                                    <p>등록된 생산라인이 없습니다</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>라인 ID</th>
                                            <th>라인명</th>
                                            <th>유형</th>
                                            <th>상태</th>
                                            <th>인원 (현재/표준)</th>
                                            <th>최대 생산능력</th>
                                            <th>가동률</th>
                                            <th>작업교대</th>
                                            <th>작업</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${lines}" var="line">
                                            <tr>
                                                <td><code
                                                        style="background: #edf2f7; padding: 4px 8px; border-radius: 6px;">${line.lineId}</code>
                                                </td>
                                                <td>
                                                    <strong>${line.lineName}</strong>
                                                    <br><small style="color: #718096;">${line.lineCode}</small>
                                                </td>
                                                <td>${line.lineType}</td>
                                                <td>
                                                    <span class="badge badge-${line.status.toLowerCase()}">
                                                        ${line.status}
                                                    </span>
                                                </td>
                                                <td>
                                                    <strong
                                                        style="color: ${line.currentWorkers == line.standardWorkers ? '#48bb78' : '#ed8936'};">
                                                        ${line.currentWorkers}
                                                    </strong> / ${line.standardWorkers}명
                                                </td>
                                                <td>${line.maxCapacity} 개/일</td>
                                                <td>
                                                    <div style="display: flex; align-items: center; gap: 8px;">
                                                        <div class="progress-bar">
                                                            <div class="progress-fill"
                                                                style="width: ${line.utilizationRate}%;"></div>
                                                        </div>
                                                        <strong>${line.utilizationRate}%</strong>
                                                    </div>
                                                </td>
                                                <td>${line.shiftPattern}</td>
                                                <td>
                                                    <form method="post" action="/factory/lines/${line.lineId}/status"
                                                        style="display: inline;">
                                                        <select name="status" onchange="this.form.submit()"
                                                            style="padding: 4px 8px; border-radius: 6px;">
                                                            <option value="">상태 변경</option>
                                                            <option value="RUNNING">가동</option>
                                                            <option value="STOPPED">정지</option>
                                                            <option value="MAINTENANCE">점검</option>
                                                        </select>
                                                        <input type="hidden" name="isOperating" value="true">
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div
                        style="background: white; border-radius: 16px; padding: 20px; margin-top: 24px; text-align: center;">
                        총 <strong style="color: #667eea; font-size: 18px;">${lines.size()}</strong>개의 생산라인이 조회되었습니다
                    </div>
                </div>

                <%@ include file="../include/footer.jspf" %>

                    <script>
                        document.getElementById('factorySelect').addEventListener('change', function () {
                            document.getElementById('filterForm').submit();
                        });

                        document.getElementById('statusSelect').addEventListener('change', function () {
                            document.getElementById('filterForm').submit();
                        });
                    </script>
        </body>

        </html>