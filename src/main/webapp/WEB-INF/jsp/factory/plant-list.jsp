<%@ page pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>사업장 목록 - TP MES</title>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
                rel="stylesheet">
            <link href="/assets/factory-modern.css" rel="stylesheet">
            <style>
                .filter-row {
                    grid-template-columns: 1fr 1fr auto;

                    /* Responsive Design */
                    @media (max-width: 768px) {
                        body {
                            padding: 12px;
                        }

                        .page-header {
                            padding: 20px;
                        }

                        .page-header h1 {
                            font-size: 22px;
                        }

                        table {
                            font-size: 13px;
                            display: block;
                            overflow-x: auto;
                        }

                        .btn {
                            width: 100%;
                        }
                    }

                    @media (max-width: 480px) {
                        .page-header h1 {
                            font-size: 20px;
                        }

                        table {
                            font-size: 12px;
                        }
                    }
                }
            </style>
        </head>

        <body>
            <%@ include file="../app/_appHeader.jspf" %>

                <div class="container">
                    <!-- Page Header -->
                    <div class="page-header">
                        <h1>📍 사업장 관리</h1>
                        <p class="subtitle">법인 및 지역별 생산 거점을 관리합니다</p>
                    </div>

                    <!-- Success Message -->
                    <c:if test="${not empty message}">
                        <div class="message">
                            ${message}
                        </div>
                    </c:if>

                    <!-- Filter Card -->
                    <div class="filter-card">
                        <form method="get" action="/factory/plants" id="filterForm">
                            <div class="filter-row">
                                <div class="filter-group">
                                    <label>🏢 사업장 유형</label>
                                    <select name="type" id="typeSelect">
                                        <option value="">전체 유형</option>
                                        <option value="MAIN_FACTORY" ${selectedType=='MAIN_FACTORY' ? 'selected' : '' }>
                                            본사 공장</option>
                                        <option value="BRANCH_FACTORY" ${selectedType=='BRANCH_FACTORY' ? 'selected'
                                            : '' }>지사 공장</option>
                                        <option value="WAREHOUSE" ${selectedType=='WAREHOUSE' ? 'selected' : '' }>물류 창고
                                        </option>
                                        <option value="R&D_CENTER" ${selectedType=='R&D_CENTER' ? 'selected' : '' }>
                                            연구개발센터</option>
                                    </select>
                                </div>

                                <div class="filter-group">
                                    <label>📊 운영 상태</label>
                                    <select name="status" id="statusSelect">
                                        <option value="">전체 상태</option>
                                        <option value="ACTIVE" ${selectedStatus=='ACTIVE' ? 'selected' : '' }>정상 가동
                                        </option>
                                        <option value="MAINTENANCE" ${selectedStatus=='MAINTENANCE' ? 'selected' : '' }>
                                            점검 중</option>
                                        <option value="SUSPENDED" ${selectedStatus=='SUSPENDED' ? 'selected' : '' }>일시중지
                                        </option>
                                        <option value="CLOSED" ${selectedStatus=='CLOSED' ? 'selected' : '' }>폐쇄
                                        </option>
                                    </select>
                                </div>

                                <div class="filter-group">
                                    <button type="submit" class="btn btn-primary">필터 적용</button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <!-- Action Buttons -->
                    <div class="action-buttons">
                        <a href="/factory/plants/new" class="btn btn-primary">➕ 신규 사업장 등록</a>
                    </div>

                    <!-- Table Container -->
                    <div class="table-container">
                        <c:choose>
                            <c:when test="${empty plants}">
                                <div class="empty-state">
                                    <p>등록된 사업장이 없습니다</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>사업장 ID</th>
                                            <th>사업장명</th>
                                            <th>유형</th>
                                            <th>위치</th>
                                            <th>면적</th>
                                            <th>상태</th>
                                            <th>작업</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${plants}" var="plant">
                                            <tr>
                                                <td>
                                                    <code>${plant.plantId}</code>
                                                </td>
                                                <td>
                                                    <a href="/factory/plants/${plant.plantId}"
                                                        style="color: #667eea; font-weight: 600; text-decoration: none;">
                                                        ${plant.plantName}
                                                    </a>
                                                </td>
                                                <td>${plant.plantType}</td>
                                                <td>${plant.address}</td>
                                                <td>${plant.totalArea} m²</td>
                                                <td>
                                                    <span
                                                        class="badge badge-${plant.status == 'ACTIVE' ? 'active' : 'maintenance'}">
                                                        ${plant.status}
                                                    </span>
                                                </td>
                                                <td>
                                                    <a href="/factory/plants/${plant.plantId}"
                                                        style="color: #667eea;">상세보기</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Summary -->
                    <div class="summary-box">
                        총 <strong>${plants.size()}</strong>개의 사업장이 조회되었습니다
                    </div>
                </div>

                <%@ include file="../include/footer.jspf" %>

                    <script>
                        document.getElementById('typeSelect').addEventListener('change', function () {
                            document.getElementById('filterForm').submit();
                        });

                        document.getElementById('statusSelect').addEventListener('change', function () {
                            document.getElementById('filterForm').submit();
                        });
                    </script>
        </body>

        </html>