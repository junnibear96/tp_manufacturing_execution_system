<%@ page pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>공장 관리 - TP MES</title>
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
                    max-width: 1400px;
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

                .subtitle {
                    color: #718096;
                    font-size: 14px;
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
                    grid-template-columns: 1fr 1fr 1fr auto;
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

                .filter-group select:focus {
                    outline: none;
                    border-color: #667eea;
                    background: white;
                }

                .action-buttons {
                    display: flex;
                    justify-content: flex-end;
                    margin-bottom: 16px;
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
                    box-shadow: 0 6px 20px rgba(102, 126, 234, 0.5);
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

                .badge-active {
                    background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
                    color: white;
                }

                .badge-idle {
                    background: linear-gradient(135deg, #ecc94b 0%, #d69e2e 100%);
                    color: white;
                }

                .badge-maintenance {
                    background: linear-gradient(135deg, #ed8936 0%, #dd6b20 100%);
                    color: white;
                }

                .badge-shutdown {
                    background: #cbd5e0;
                    color: #4a5568;
                }

                .empty-state {
                    text-align: center;
                    padding: 60px 20px;
                    color: #718096;
                }

                .message {
                    background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
                    color: white;
                    padding: 16px 20px;
                    border-radius: 12px;
                    margin-bottom: 24px;
                    animation: fadeIn 0.5s ease-out;
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

                @media (max-width: 768px) {
                    .filter-row {
                        grid-template-columns: 1fr;
                    }
                }
            </style>
        </head>

        <body>
            <%@ include file="../include/header.jspf" %>

                <div class="container">
                    <div class="page-header">
                        <h1>🏭 공장 관리</h1>
                        <p class="subtitle">사업장 내 생산 기능별 구역을 관리합니다</p>
                    </div>

                    <c:if test="${not empty message}">
                        <div class="message">
                            ✓ ${message}
                        </div>
                    </c:if>

                    <div class="filter-card">
                        <form method="get" action="/factory/factories" id="filterForm">
                            <div class="filter-row">
                                <div class="filter-group">
                                    <label>📍 사업장</label>
                                    <select name="plant" id="plantSelect">
                                        <option value="">전체 사업장</option>
                                        <c:forEach items="${plants}" var="p">
                                            <option value="${p.plantId}" ${selectedPlant==p.plantId ? 'selected' : '' }>
                                                ${p.plantName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="filter-group">
                                    <label>🏭 공장 유형</label>
                                    <select name="type" id="typeSelect">
                                        <option value="">전체 유형</option>
                                        <option value="ASSEMBLY" ${selectedType=='ASSEMBLY' ? 'selected' : '' }>조립
                                        </option>
                                        <option value="PROCESSING" ${selectedType=='PROCESSING' ? 'selected' : '' }>가공
                                        </option>
                                        <option value="PACKAGING" ${selectedType=='PACKAGING' ? 'selected' : '' }>포장
                                        </option>
                                        <option value="TESTING" ${selectedType=='TESTING' ? 'selected' : '' }>검사
                                        </option>
                                        <option value="LOGISTICS" ${selectedType=='LOGISTICS' ? 'selected' : '' }>물류
                                        </option>
                                    </select>
                                </div>

                                <div class="filter-group">
                                    <label>📊 운영 상태</label>
                                    <select name="status" id="statusSelect">
                                        <option value="">전체 상태</option>
                                        <option value="ACTIVE" ${selectedStatus=='ACTIVE' ? 'selected' : '' }>정상 가동
                                        </option>
                                        <option value="IDLE" ${selectedStatus=='IDLE' ? 'selected' : '' }>휴지</option>
                                        <option value="MAINTENANCE" ${selectedStatus=='MAINTENANCE' ? 'selected' : '' }>
                                            점검</option>
                                        <option value="SHUTDOWN" ${selectedStatus=='SHUTDOWN' ? 'selected' : '' }>폐쇄
                                        </option>
                                    </select>
                                </div>

                                <div class="filter-group">
                                    <button type="submit" class="btn btn-primary">필터 적용</button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="action-buttons">
                        <a href="/factory/factories/new" class="btn btn-primary">
                            ➕ 신규 공장 등록
                        </a>
                    </div>

                    <div class="table-container">
                        <c:choose>
                            <c:when test="${empty factories}">
                                <div class="empty-state">
                                    <p style="font-size: 18px; margin-bottom: 16px;">📭</p>
                                    <p>등록된 공장이 없습니다</p>
                                    <a href="/factory/factories/new" class="btn btn-primary" style="margin-top: 20px;">
                                        첫 공장 등록하기
                                    </a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>공장 ID</th>
                                            <th>공장명</th>
                                            <th>사업장</th>
                                            <th>유형</th>
                                            <th>품목군</th>
                                            <th>면적</th>
                                            <th>목표 가동률</th>
                                            <th>상태</th>
                                            <th>작업</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${factories}" var="factory">
                                            <tr>
                                                <td>
                                                    <code
                                                        style="background: #edf2f7; padding: 4px 8px; border-radius: 6px;">
                                            ${factory.factoryId}
                                        </code>
                                                </td>
                                                <td>
                                                    <a href="/factory/factories/${factory.factoryId}"
                                                        style="color: #667eea; font-weight: 600; text-decoration: none;">
                                                        ${factory.factoryName}
                                                    </a>
                                                    <c:if test="${not empty factory.factoryNameEn}">
                                                        <br><small
                                                            style="color: #718096;">${factory.factoryNameEn}</small>
                                                    </c:if>
                                                </td>
                                                <td>${factory.plantId}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${factory.factoryType == 'ASSEMBLY'}">조립</c:when>
                                                        <c:when test="${factory.factoryType == 'PROCESSING'}">가공
                                                        </c:when>
                                                        <c:when test="${factory.factoryType == 'PACKAGING'}">포장</c:when>
                                                        <c:when test="${factory.factoryType == 'TESTING'}">검사</c:when>
                                                        <c:when test="${factory.factoryType == 'LOGISTICS'}">물류</c:when>
                                                        <c:otherwise>${factory.factoryType}</c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${factory.productCategory}</td>
                                                <td>${factory.area} m²</td>
                                                <td>
                                                    <strong
                                                        style="color: #667eea;">${factory.targetUtilizationRate}%</strong>
                                                </td>
                                                <td>
                                                    <span class="badge badge-${factory.status.toLowerCase()}">
                                                        ${factory.status}
                                                    </span>
                                                </td>
                                                <td>
                                                    <a href="/factory/factories/${factory.factoryId}"
                                                        style="color: #667eea;">
                                                        상세보기
                                                    </a>
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
                        총 <strong style="color: #667eea; font-size: 18px;">${factories.size()}</strong>개의 공장이 조회되었습니다
                    </div>
                </div>

                <%@ include file="../include/footer.jspf" %>

                    <script>
                        // 필터 자동 제출
                        document.getElementById('plantSelect').addEventListener('change', function () {
                            document.getElementById('filterForm').submit();
                        });

                        document.getElementById('typeSelect').addEventListener('change', function () {
                            document.getElementById('filterForm').submit();
                        });

                        document.getElementById('statusSelect').addEventListener('change', function () {
                            document.getElementById('filterForm').submit();
                        });
                    </script>
        </body>

        </html>