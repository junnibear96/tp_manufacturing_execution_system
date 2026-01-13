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
                    display: flex;
                    align-items: center;
                    gap: 12px;
                }

                .subtitle {
                    color: #718096;
                    font-size: 14px;
                }

                .stats-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                    gap: 24px;
                    margin-bottom: 24px;
                }

                .stat-card {
                    background: white;
                    border-radius: 16px;
                    padding: 24px;
                    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
                    animation: fadeIn 0.5s ease-out forwards;
                    transition: transform 0.3s;
                }

                .stat-card:hover {
                    transform: translateY(-4px);
                }

                .stat-card-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: flex-start;
                    margin-bottom: 16px;
                }

                .stat-icon {
                    font-size: 32px;
                    width: 56px;
                    height: 56px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    border-radius: 12px;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                }

                .stat-label {
                    font-size: 14px;
                    color: #718096;
                    font-weight: 500;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                .stat-value {
                    font-size: 36px;
                    font-weight: 700;
                    color: #1a202c;
                    margin: 8px 0;
                }

                .stat-detail {
                    font-size: 13px;
                    color: #4a5568;
                }

                .section {
                    background: white;
                    border-radius: 16px;
                    padding: 24px;
                    margin-bottom: 24px;
                    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
                    animation: fadeIn 0.5s ease-out forwards;
                }

                .section h2 {
                    font-size: 18px;
                    font-weight: 600;
                    color: #1a202c;
                    margin-bottom: 16px;
                    display: flex;
                    align-items: center;
                    gap: 8px;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                }

                thead {
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                }

                th {
                    padding: 16px;
                    text-align: left;
                    font-weight: 600;
                    color: white;
                    font-size: 13px;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                td {
                    padding: 16px;
                    border-bottom: 1px solid #f0f4f8;
                    font-size: 14px;
                    color: #2d3748;
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
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                .badge-running {
                    background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
                    color: white;
                }

                .badge-stopped {
                    background: #cbd5e0;
                    color: #4a5568;
                }

                .badge-maintenance {
                    background: linear-gradient(135deg, #ed8936 0%, #dd6b20 100%);
                    color: white;
                }

                .badge-active {
                    background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
                    color: white;
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

                .empty-state {
                    text-align: center;
                    padding: 60px 20px;
                    color: #718096;
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
                        <h1>
                            <span>🏭</span>
                            공장 관리 대시보드
                        </h1>
                        <p class="subtitle">제조 실행의 물리적 기준을 관리합니다</p>
                    </div>

                    <!-- 통계 카드 -->
                    <div class="stats-grid">
                        <div class="stat-card">
                            <div class="stat-card-header">
                                <div>
                                    <div class="stat-label">사업장</div>
                                    <div class="stat-value">${plants.size()}</div>
                                    <div class="stat-detail">운영 거점</div>
                                </div>
                                <div class="stat-icon">🏢</div>
                            </div>
                        </div>

                        <div class="stat-card">
                            <div class="stat-card-header">
                                <div>
                                    <div class="stat-label">공장</div>
                                    <div class="stat-value">${factories.size()}</div>
                                    <div class="stat-detail">생산 구역</div>
                                </div>
                                <div class="stat-icon">🏭</div>
                            </div>
                        </div>

                        <div class="stat-card">
                            <div class="stat-card-header">
                                <div>
                                    <div class="stat-label">가동 중인 라인</div>
                                    <div class="stat-value">${runningLines.size()}</div>
                                    <div class="stat-detail">실시간 생산 중</div>
                                </div>
                                <div class="stat-icon">⚙️</div>
                            </div>
                        </div>
                    </div>

                    <!-- 사업장 목록 -->
                    <div class="section">
                        <h2>📍 사업장 현황</h2>
                        <c:choose>
                            <c:when test="${empty plants}">
                                <div class="empty-state">
                                    <p>등록된 사업장이 없습니다</p>
                                    <a href="/factory/plants/new" class="btn btn-primary" style="margin-top: 16px;">
                                        ➕ 사업장 등록
                                    </a>
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
                                            <th>상태</th>
                                            <th>작업</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${plants}" var="plant">
                                            <tr>
                                                <td><code>${plant.plantId}</code></td>
                                                <td>
                                                    <a href="/factory/plants/${plant.plantId}"
                                                        style="color: #667eea; font-weight: 600;">
                                                        ${plant.plantName}
                                                    </a>
                                                </td>
                                                <td>${plant.plantType}</td>
                                                <td>${plant.address}</td>
                                                <td>
                                                    <span
                                                        class="badge badge-${plant.status == 'ACTIVE' ? 'active' : 'stopped'}">
                                                        ${plant.status}
                                                    </span>
                                                </td>
                                                <td>
                                                    <a href="/factory/plants/${plant.plantId}">상세보기</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- 가동 중인 라인 -->
                    <div class="section">
                        <h2>⚙️ 가동 중인 생산라인</h2>
                        <c:choose>
                            <c:when test="${empty runningLines}">
                                <div class="empty-state">
                                    <p>현재 가동 중인 생산라인이 없습니다</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>라인 ID</th>
                                            <th>라인명</th>
                                            <th>유형</th>
                                            <th>투입 인원</th>
                                            <th>가동률</th>
                                            <th>상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${runningLines}" var="line">
                                            <tr>
                                                <td><code>${line.lineId}</code></td>
                                                <td>
                                                    <a href="/factory/lines" style="color: #667eea; font-weight: 600;">
                                                        ${line.lineName}
                                                    </a>
                                                </td>
                                                <td>${line.lineType}</td>
                                                <td>${line.currentWorkers} / ${line.standardWorkers}명</td>
                                                <td><strong>${line.utilizationRate}%</strong></td>
                                                <td>
                                                    <span class="badge badge-running">RUNNING</span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- 빠른 링크 -->
                    <div style="display: flex; gap: 16px; justify-content: center; margin-top: 32px;">
                        <a href="/factory/plants" class="btn btn-primary">📍 사업장 관리</a>
                        <a href="/factory/factories" class="btn btn-primary">🏭 공장 관리</a>
                        <a href="/factory/lines" class="btn btn-primary">⚙️ 생산라인 관리</a>
                    </div>
                </div>

                <%@ include file="../include/footer.jspf" %>
        </body>

        </html>