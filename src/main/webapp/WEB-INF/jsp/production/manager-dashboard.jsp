<%@ page pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="ko">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>생산관리 대시보드 - TP MES</title>
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
                        padding: 0;
                        padding-top: 0;
                    }

                    .container {
                        max-width: 1600px;
                        margin: 0 auto;
                        padding: 20px;
                    }

                    .page-header {
                        background: white;
                        border-radius: 16px;
                        padding: 32px;
                        margin-bottom: 24px;
                        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
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

                    .kpi-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                        gap: 20px;
                        margin-bottom: 24px;
                    }

                    .kpi-card {
                        background: white;
                        border-radius: 16px;
                        padding: 24px;
                        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
                        transition: transform 0.2s;
                    }

                    .kpi-card:hover {
                        transform: translateY(-2px);
                    }

                    .kpi-card .icon {
                        font-size: 32px;
                        margin-bottom: 12px;
                    }

                    .kpi-card .label {
                        color: #718096;
                        font-size: 13px;
                        font-weight: 600;
                        text-transform: uppercase;
                        margin-bottom: 8px;
                    }

                    .kpi-card .value {
                        font-size: 36px;
                        font-weight: 700;
                        color: #1a202c;
                        margin-bottom: 8px;
                    }

                    .kpi-card .change {
                        font-size: 14px;
                        font-weight: 600;
                    }

                    .change.positive {
                        color: #48bb78;
                    }

                    .change.negative {
                        color: #f56565;
                    }

                    .section {
                        background: white;
                        border-radius: 16px;
                        padding: 24px;
                        margin-bottom: 24px;
                        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
                    }

                    .section-title {
                        font-size: 20px;
                        font-weight: 700;
                        color: #1a202c;
                        margin-bottom: 20px;
                        padding-bottom: 12px;
                        border-bottom: 2px solid #e2e8f0;
                    }

                    .equipment-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                        gap: 16px;
                    }

                    .equipment-item {
                        border: 2px solid #e2e8f0;
                        border-radius: 12px;
                        padding: 16px;
                        text-align: center;
                        transition: all 0.2s;
                    }

                    .equipment-item:hover {
                        border-color: #667eea;
                    }

                    .equipment-item.running {
                        border-color: #48bb78;
                        background: #f0fff4;
                    }

                    .equipment-item.maintenance {
                        border-color: #ed8936;
                        background: #fffaf0;
                    }

                    .equipment-item.error {
                        border-color: #f56565;
                        background: #fff5f5;
                    }

                    .equipment-name {
                        font-weight: 600;
                        color: #1a202c;
                        margin-bottom: 8px;
                    }

                    .equipment-status {
                        display: inline-block;
                        padding: 4px 12px;
                        border-radius: 20px;
                        font-size: 12px;
                        font-weight: 600;
                        margin-top: 8px;
                    }

                    .status-running {
                        background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
                        color: white;
                    }

                    .status-idle {
                        background: #cbd5e0;
                        color: #4a5568;
                    }

                    .status-maintenance {
                        background: linear-gradient(135deg, #ed8936 0%, #dd6b20 100%);
                        color: white;
                    }

                    .status-error {
                        background: linear-gradient(135deg, #f56565 0%, #e53e3e 100%);
                        color: white;
                    }

                    .status-stopped {
                        background: #e2e8f0;
                        color: #718096;
                    }

                    .alert {
                        background: linear-gradient(135deg, #f56565 0%, #e53e3e 100%);
                        color: white;
                        padding: 16px 20px;
                        border-radius: 12px;
                        margin-bottom: 24px;
                        font-weight: 600;
                    }

                    .btn {
                        display: inline-block;
                        padding: 12px 24px;
                        border: none;
                        border-radius: 10px;
                        font-size: 14px;
                        font-weight: 600;
                        cursor: pointer;
                        text-decoration: none;
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

                    .nav-links {
                        display: flex;
                        gap: 12px;
                        margin-bottom: 16px;
                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }

                    th {
                        padding: 12px;
                        text-align: left;
                        font-weight: 600;
                        color: #4a5568;
                        font-size: 12px;
                        text-transform: uppercase;
                        border-bottom: 2px solid #e2e8f0;
                    }

                    td {
                        padding: 12px;
                        border-bottom: 1px solid #f0f4f8;
                    }

                    tbody tr:hover {
                        background: #f7fafc;
                    }
                </style>
            </head>

            <body>
                <%@ include file="/WEB-INF/jsp/app/_appHeader.jspf" %>

                    <div class="container">
                        <div class="page-header">
                            <h1>⚙️ 생산관리 대시보드</h1>
                            <p class="subtitle">실시간 생산 현황 및 KPI를 모니터링합니다</p>
                        </div>

                        <div class="nav-links">
                            <a href="/production/dashboard" class="btn btn-primary">대시보드</a>
                            <a href="/production/equipment" class="btn btn-primary">장비 관리</a>
                            <a href="/production/analytics" class="btn btn-primary">분석 리포트</a>
                            <a href="/app/production/plans" class="btn btn-primary">계획 관리</a>
                        </div>

                        <!-- 점검 필요 알림 -->
                        <c:if test="${not empty maintenanceDue}">
                            <div class="alert">
                                ⚠️ ${maintenanceDue.size()}개의 장비가 점검이 필요합니다!
                            </div>
                        </c:if>

                        <!-- KPI 카드 -->
                        <div class="kpi-grid">
                            <div class="kpi-card">
                                <div class="icon">📊</div>
                                <div class="label">금일 목표 수량</div>
                                <div class="value">
                                    <fmt:formatNumber value="${kpi.todayTargetQuantity}" pattern="#,##0" />
                                </div>
                                <div class="change">계획 ${kpi.totalPlans}건</div>
                            </div>

                            <div class="kpi-card">
                                <div class="icon">✅</div>
                                <div class="label">금일 실적</div>
                                <div class="value">
                                    <fmt:formatNumber value="${kpi.todayActualQuantity}" pattern="#,##0" />
                                </div>
                                <div class="change ${kpi.todayAchievementRate >= 100 ? 'positive' : 'negative'}">
                                    달성률
                                    <fmt:formatNumber value="${kpi.todayAchievementRate}" pattern="#,##0.0" />%
                                </div>
                            </div>

                            <div class="kpi-card">
                                <div class="icon">📉</div>
                                <div class="label">금일 불량률</div>
                                <div class="value">
                                    <fmt:formatNumber value="${kpi.todayDefectRate}" pattern="#,##0.0" />%
                                </div>
                                <div class="change">불량
                                    <fmt:formatNumber value="${kpi.todayTotalDefect}" pattern="#,##0" />개
                                </div>
                            </div>

                            <div class="kpi-card">
                                <div class="icon">🔧</div>
                                <div class="label">장비 가동률</div>
                                <div class="value">
                                    <fmt:formatNumber value="${kpi.equipmentUtilizationRate}" pattern="#,##0.0" />%
                                </div>
                                <div class="change">가동 ${kpi.runningEquipment}/${kpi.totalEquipment}</div>
                            </div>
                        </div>

                        <!-- 장비 현황 -->
                        <div class="section">
                            <div class="section-title">🏭 장비 현황</div>
                            <div class="equipment-grid">
                                <c:forEach items="${equipment}" var="equip">
                                    <div class="equipment-item ${equip.status.name().toLowerCase()}">
                                        <div class="equipment-name">${equip.equipmentName}</div>
                                        <div style="font-size: 12px; color: #718096;">${equip.equipmentCode}</div>
                                        <div>
                                            <span class="equipment-status status-${equip.status.name().toLowerCase()}">
                                                ${equip.status.description}
                                            </span>
                                        </div>
                                        <c:if test="${equip.utilizationRate != null}">
                                            <div style="margin-top: 8px; font-size: 13px; font-weight: 600;">
                                                가동률:
                                                <fmt:formatNumber value="${equip.utilizationRate}" pattern="#,##0.0" />%
                                            </div>
                                        </c:if>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <!-- 최근 7일 달성률 -->
                        <div class="section">
                            <div class="section-title">📈 최근 7일 달성률</div>
                            <table>
                                <thead>
                                    <tr>
                                        <th>날짜</th>
                                        <th>라인</th>
                                        <th>목표</th>
                                        <th>실적</th>
                                        <th>달성률</th>
                                        <th>계획 건수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${dailyAchievement}" var="daily">
                                        <tr>
                                            <td>
                                                ${daily.workDate}
                                            </td>
                                            <td>${daily.lineName}</td>
                                            <td>
                                                <fmt:formatNumber value="${daily.totalTarget}" pattern="#,##0" />
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${daily.totalActual}" pattern="#,##0" />
                                            </td>
                                            <td>
                                                <span
                                                    style="font-weight: 600; color: ${daily.achievementRate >= 100 ? '#48bb78' : '#f56565'}">
                                                    <fmt:formatNumber value="${daily.achievementRate}"
                                                        pattern="#,##0.0" />%
                                                </span>
                                            </td>
                                            <td>${daily.completedPlanCount}/${daily.planCount}</td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty dailyAchievement}">
                                        <tr>
                                            <td colspan="6" style="text-align: center; color: #718096; padding: 40px;">
                                                최근 데이터가 없습니다
                                            </td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <%@ include file="../include/footer.jspf" %>
            </body>

            </html>