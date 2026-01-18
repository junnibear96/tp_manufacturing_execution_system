<%@ page pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
            <!DOCTYPE html>
            <html lang="ko">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>대시보드 - TP MES</title>
                <style>
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }

                    body {
                        font-family: 'Noto Sans KR', sans-serif;
                        background: #f5f7fa;
                    }

                    .header {
                        background: white;
                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                        padding: 16px 32px;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                    }

                    .header h1 {
                        font-size: 24px;
                        color: #667eea;
                    }

                    .user-info {
                        display: flex;
                        align-items: center;
                        gap: 16px;
                    }

                    .user-name {
                        font-weight: 500;
                        color: #333;
                    }

                    .btn-logout {
                        padding: 8px 16px;
                        background: #dc3545;
                        color: white;
                        border: none;
                        border-radius: 6px;
                        cursor: pointer;
                        font-size: 14px;
                        text-decoration: none;
                    }

                    .btn-logout:hover {
                        background: #c82333;
                    }

                    .container {
                        max-width: 1200px;
                        margin: 0 auto;
                        padding: 32px 16px;
                    }

                    .dashboard-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                        gap: 24px;
                        margin-bottom: 32px;
                    }

                    .card {
                        background: white;
                        border-radius: 12px;
                        padding: 24px;
                        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
                        height: 100%;
                        display: flex;
                        flex-direction: column;
                    }

                    .card h2 {
                        font-size: 18px;
                        color: #333;
                        margin-bottom: 16px;
                    }

                    .card p {
                        color: #666;
                        line-height: 1.6;
                        flex: 1;
                        /* This pushes the footer content to the bottom if needed, or just fills space */
                    }

                    .stats {
                        display: flex;
                        justify-content: space-between;
                        margin-top: 16px;
                    }

                    .stat-item {
                        text-align: center;
                    }

                    .stat-value {
                        font-size: 28px;
                        font-weight: 700;
                        color: #667eea;
                    }

                    .stat-label {
                        font-size: 13px;
                        color: #999;
                        margin-top: 4px;
                    }

                    .card-link {
                        text-decoration: none;
                        color: inherit;
                        display: flex;
                        flex-direction: column;
                        height: 100%;
                        transition: transform 0.2s, box-shadow 0.2s;
                    }

                    .card-link:hover {
                        transform: translateY(-4px);
                        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
                    }

                    .card-link .card {
                        cursor: pointer;
                    }

                    .btn-primary {
                        display: inline-block;
                        padding: 10px 20px;
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                        text-decoration: none;
                        border-radius: 6px;
                        font-weight: 600;
                        margin-top: auto;
                        /* Push to bottom if inside flex column */
                        align-self: flex-start;
                        /* Prevent full width stretch if parent is flex column */
                        transition: transform 0.2s;
                    }

                    .btn-primary:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
                    }

                    /* Notice Board Section */
                    .notice-section {
                        margin-top: 32px;
                    }

                    .notice-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 20px;
                    }

                    .notice-title {
                        font-size: 20px;
                        font-weight: 700;
                        color: #2d3748;
                        display: flex;
                        align-items: center;
                        gap: 8px;
                    }

                    .btn-create-notice {
                        padding: 10px 20px;
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                        text-decoration: none;
                        border-radius: 8px;
                        font-size: 14px;
                        font-weight: 600;
                        transition: all 0.3s;
                        box-shadow: 0 2px 8px rgba(102, 126, 234, 0.3);
                    }

                    .btn-create-notice:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 4px 16px rgba(102, 126, 234, 0.4);
                    }

                    .notice-table {
                        width: 100%;
                        border-collapse: collapse;
                    }

                    .notice-table thead tr {
                        background: linear-gradient(135deg, #f7fafc 0%, #edf2f7 100%);
                        border-bottom: 2px solid #667eea;
                    }

                    .notice-table th {
                        padding: 14px 16px;
                        text-align: left;
                        color: #2d3748;
                        font-weight: 700;
                        font-size: 13px;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                    }

                    .notice-table th.date-column {
                        text-align: center;
                        width: 160px;
                    }

                    .notice-table tbody tr {
                        border-bottom: 1px solid #e2e8f0;
                        transition: background 0.2s;
                    }

                    .notice-table tbody tr:hover {
                        background: #f7fafc;
                    }

                    .notice-table tbody tr:last-child {
                        border-bottom: none;
                    }

                    .notice-table td {
                        padding: 14px 16px;
                    }

                    .notice-link {
                        color: #667eea;
                        text-decoration: none;
                        font-weight: 500;
                        transition: color 0.2s;
                        display: inline-block;
                    }

                    .notice-link:hover {
                        color: #764ba2;
                        text-decoration: underline;
                    }

                    .notice-date {
                        text-align: center;
                        color: #718096;
                        font-size: 13px;
                    }

                    .notice-empty {
                        text-align: center;
                        color: #a0aec0;
                        padding: 60px 24px;
                        font-size: 15px;
                    }

                    .notice-footer {
                        text-align: center;
                        margin-top: 20px;
                        padding-top: 20px;
                        border-top: 1px solid #e2e8f0;
                    }

                    .notice-view-all {
                        color: #667eea;
                        text-decoration: none;
                        font-size: 14px;
                        font-weight: 600;
                        transition: all 0.2s;
                        display: inline-flex;
                        align-items: center;
                        gap: 4px;
                    }

                    .notice-view-all:hover {
                        color: #764ba2;
                        gap: 8px;
                    }

                    /* Permissions Section */
                    .permissions-card {
                        margin-top: 32px;
                    }

                    .permissions-card h2 {
                        display: flex;
                        align-items: center;
                        gap: 8px;
                        font-size: 18px;
                        margin-bottom: 12px;
                    }

                    .permissions-card ul {
                        margin-top: 16px;
                        padding-left: 24px;
                    }

                    .permissions-card li {
                        margin-bottom: 10px;
                        color: #667eea;
                        font-weight: 600;
                        font-size: 14px;
                    }
                </style>
            </head>

            <body>
                <div class="header">
                    <h1>TP Manufacturing System</h1>
                    <div class="user-info">
                        <span class="user-name">${not empty userName ? userName : '사용자'}님</span>
                        <a href="/logout" class="btn-logout">로그아웃</a>
                    </div>
                </div>
                <div class="container">
                    <h1 style="margin-bottom: 24px; color: #333;">대시보드</h1>
                    <div class="dashboard-grid">
                        <div class="card">
                            <h2>📊 실시간 생산 현황</h2>
                            <p>오늘의 생산 실적을 확인하세요.</p>
                            <div class="stats">
                                <div class="stat-item">
                                    <div class="stat-value">324</div>
                                    <div class="stat-label">생산량</div>
                                </div>
                                <div class="stat-item">
                                    <div class="stat-value">98%</div>
                                    <div class="stat-label">가동률</div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <h2>📦 재고 현황</h2>
                            <p>현재 재고 상태를 한눈에 파악합니다.</p>
                            <div class="stats">
                                <div class="stat-item">
                                    <div class="stat-value">1,248</div>
                                    <div class="stat-label">총 재고</div>
                                </div>
                                <div class="stat-item">
                                    <div class="stat-value">12</div>
                                    <div class="stat-label">알림</div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <h2>🚚 배송 관리</h2>
                            <p>금일 배송 건수 및 진행 상황</p>
                            <div class="stats">
                                <div class="stat-item">
                                    <div class="stat-value">45</div>
                                    <div class="stat-label">배송 중</div>
                                </div>
                                <div class="stat-item">
                                    <div class="stat-value">128</div>
                                    <div class="stat-label">완료</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 관리 모듈 카드 -->
                    <div class="dashboard-grid">
                        <!-- 인사 관리 -->
                        <a href="/hr/employees" class="card-link">
                            <div class="card">
                                <h2>👥 인사 관리</h2>
                                <p>직원 정보를 관리하고 조직 구성원을 확인합니다.</p>
                                <div class="btn-primary" style="display: inline-block; margin-top: 16px;">직원 목록 보기 →
                                </div>
                            </div>
                        </a>

                        <!-- 공장 관리 -->
                        <a href="/factory" class="card-link">
                            <div class="card">
                                <h2>🏭 공장 관리</h2>
                                <p>사업장, 공장, 생산라인을 관리하고 운영 현황을 확인합니다.</p>
                                <div class="btn-primary" style="display: inline-block; margin-top: 16px;">공장 현황 보기 →
                                </div>
                            </div>
                        </a>

                        <!-- 재고 관리 -->
                        <a href="/inventory" class="card-link">
                            <div class="card">
                                <h2>📦 재고 관리</h2>
                                <p>원자재, 부품, 완제품 재고를 추적하고 관리합니다.</p>
                                <div class="btn-primary" style="display: inline-block; margin-top: 16px;">재고 현황 보기 →
                                </div>
                            </div>
                        </a>
                    </div>

                    <!-- 공지사항 / 게시판 -->
                    <div class="notice-section">
                        <div class="notice-header">
                            <h2 class="notice-title">📢 공지사항</h2>
                            <sec:authorize access="hasRole('ADMIN')">
                                <a href="/admin/notices/new" class="btn-create-notice">+ 새 공지 작성</a>
                            </sec:authorize>
                        </div>

                        <div class="card">
                            <c:choose>
                                <c:when test="${empty recentNotices}">
                                    <p class="notice-empty">등록된 공지사항이 없습니다.</p>
                                </c:when>
                                <c:otherwise>
                                    <table class="notice-table">
                                        <thead>
                                            <tr>
                                                <th>제목</th>
                                                <th class="date-column">작성일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${recentNotices}" var="notice" varStatus="status">
                                                <c:if test="${status.index < 5}">
                                                    <tr>
                                                        <td>
                                                            <a href="/notices/${notice.noticeId}" class="notice-link">
                                                                ${notice.title}
                                                            </a>
                                                        </td>
                                                        <td class="notice-date">
                                                            ${notice.createdAt}
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="notice-footer">
                                        <a href="/notices" class="notice-view-all">전체 공지사항 보기 →</a>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <div class="card permissions-card">
                        <h2>🔐 부여된 권한</h2>
                        <p>귀하의 계정에 부여된 시스템 권한:</p>
                        <ul style="margin-top: 16px; padding-left: 20px;">
                            <c:choose>
                                <c:when test="${not empty userRoles}">
                                    <c:forEach items="${userRoles}" var="role">
                                        <li style="margin-bottom: 8px; color: #667eea; font-weight: 600;">${role}</li>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <li style="margin-bottom: 8px; color: #999;">권한 없음</li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </body>

            </html>