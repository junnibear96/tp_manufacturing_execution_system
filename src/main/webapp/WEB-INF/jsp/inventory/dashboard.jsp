<%@ page pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="ko">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>재고 관리 대시보드 - TP MES</title>
                <link rel="stylesheet" href="/assets/css/common.css">
                <style>
                    body {
                        font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        margin: 0;
                        padding: 0;
                        min-height: 100vh;
                    }

                    .container {
                        max-width: 1400px;
                        margin: 0 auto;
                        padding: 20px;
                    }

                    .header {
                        background: white;
                        padding: 24px 32px;
                        border-radius: 16px;
                        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
                        margin-bottom: 24px;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                    }

                    .header h1 {
                        margin: 0;
                        color: #2d3748;
                        font-size: 28px;
                        font-weight: 700;
                    }

                    .header-actions {
                        display: flex;
                        gap: 12px;
                    }

                    .btn {
                        padding: 10px 20px;
                        border-radius: 8px;
                        text-decoration: none;
                        font-weight: 600;
                        transition: all 0.3s;
                        border: none;
                        cursor: pointer;
                        font-size: 14px;
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
                        color: #2d3748;
                    }

                    .btn-secondary:hover {
                        background: #cbd5e0;
                    }

                    .stats-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                        gap: 20px;
                        margin-bottom: 28px;
                    }

                    .stat-card {
                        background: white;
                        padding: 24px;
                        border-radius: 16px;
                        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
                        transition: transform 0.3s;
                    }

                    .stat-card:hover {
                        transform: translateY(-4px);
                    }

                    .stat-header {
                        display: flex;
                        align-items: center;
                        gap: 12px;
                        margin-bottom: 16px;
                    }

                    .stat-icon {
                        font-size: 32px;
                    }

                    .stat-title {
                        color: #718096;
                        font-size: 14px;
                        font-weight: 600;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                    }

                    .stat-value {
                        font-size: 38px;
                        font-weight: 700;
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        -webkit-background-clip: text;
                        -webkit-text-fill-color: transparent;
                        margin: 0;
                    }

                    .content-grid {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 24px;
                    }

                    .card {
                        background: white;
                        border-radius: 16px;
                        padding: 28px;
                        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
                    }

                    .card h2 {
                        margin: 0 0 20px 0;
                        color: #2d3748;
                        font-size: 20px;
                        font-weight: 700;
                    }

                    .list-item {
                        padding: 16px;
                        border-bottom: 1px solid #e2e8f0;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        transition: background 0.2s;
                    }

                    .list-item:last-child {
                        border-bottom: none;
                    }

                    .list-item:hover {
                        background: #f7fafc;
                    }

                    .item-info h3 {
                        margin: 0 0 4px 0;
                        color: #2d3748;
                        font-size: 16px;
                        font-weight: 600;
                    }

                    .item-code {
                        color: #718096;
                        font-size: 13px;
                    }

                    .badge {
                        padding: 6px 12px;
                        border-radius: 20px;
                        font-size: 12px;
                        font-weight: 600;
                    }

                    .badge-warning {
                        background: #fed7d7;
                        color: #c53030;
                    }

                    .badge-success {
                        background: #c6f6d5;
                        color: #2f855a;
                    }

                    .transaction-item {
                        padding: 12px 16px;
                        border-left: 4px solid #e2e8f0;
                        margin-bottom: 12px;
                        background: #f7fafc;
                        border-radius: 8px;
                    }

                    .transaction-item.in {
                        border-left-color: #48bb78;
                    }

                    .transaction-item.out {
                        border-left-color: #f56565;
                    }

                    .transaction-item.adjust {
                        border-left-color: #ed8936;
                    }

                    .transaction-header {
                        display: flex;
                        justify-content: space-between;
                        margin-bottom: 4px;
                    }

                    .transaction-type {
                        font-weight: 600;
                        font-size: 14px;
                    }

                    .transaction-date {
                        color: #718096;
                        font-size: 12px;
                    }

                    .transaction-details {
                        color: #4a5568;
                        font-size: 13px;
                    }

                    .empty-state {
                        text-align: center;
                        padding: 40px;
                        color: #a0aec0;
                    }

                    @media (max-width: 1024px) {
                        .content-grid {
                            grid-template-columns: 1fr;
                        }
                    }

                    @media (max-width: 768px) {
                        .stats-grid {
                            grid-template-columns: 1fr;
                        }
                    }
                </style>
            </head>

            <body>
                <%@ include file="/WEB-INF/jsp/app/_appHeader.jspf" %>

                    <div class="container">
                        <div class="header">
                            <h1>📦 재고 관리 대시보드</h1>
                            <div class="header-actions">
                                <a href="/inventory/list" class="btn btn-primary">전체 재고 목록</a>
                                <a href="/dashboard" class="btn btn-secondary">홈으로</a>
                            </div>
                        </div>

                        <!-- Statistics Cards -->
                        <div class="stats-grid">
                            <div class="stat-card">
                                <div class="stat-header">
                                    <span class="stat-icon">📦</span>
                                    <span class="stat-title">전체 품목</span>
                                </div>
                                <p class="stat-value">${stats.totalItems}</p>
                            </div>

                            <div class="stat-card">
                                <div class="stat-header">
                                    <span class="stat-icon">💰</span>
                                    <span class="stat-title">총 재고 가치</span>
                                </div>
                                <p class="stat-value">
                                    <fmt:formatNumber value="${stats.totalValue}" pattern="#,##0" />원
                                </p>
                            </div>

                            <div class="stat-card">
                                <div class="stat-header">
                                    <span class="stat-icon">⚠️</span>
                                    <span class="stat-title">재고 부족 품목</span>
                                </div>
                                <p class="stat-value">${stats.lowStockItems}</p>
                            </div>

                            <div class="stat-card">
                                <div class="stat-header">
                                    <span class="stat-icon">📊</span>
                                    <span class="stat-title">최근 거래 (7일)</span>
                                </div>
                                <p class="stat-value">${stats.recentTransactions}</p>
                            </div>
                        </div>

                        <!-- Content Grid -->
                        <div class="content-grid">
                            <!-- Low Stock Alerts -->
                            <div class="card">
                                <h2>⚠️ 재고 부족 알림</h2>
                                <c:choose>
                                    <c:when test="${not empty lowStockItems}">
                                        <c:forEach items="${lowStockItems}" var="item">
                                            <div class="list-item">
                                                <div class="item-info">
                                                    <h3>${item.itemName}</h3>
                                                    <span class="item-code">${item.itemCode}</span>
                                                </div>
                                                <div style="text-align: right;">
                                                    <div style="font-weight: 600; color: #c53030;">
                                                        ${item.currentQuantity} ${item.unit}
                                                    </div>
                                                    <div style="font-size: 12px; color: #718096;">
                                                        최소: ${item.minQuantity} ${item.unit}
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="empty-state">
                                            <p>✅ 모든 재고가 안전 수준입니다</p>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <!-- Recent Transactions -->
                            <div class="card">
                                <h2>📋 최근 거래 내역</h2>
                                <c:choose>
                                    <c:when test="${not empty recentTransactions}">
                                        <c:forEach items="${recentTransactions}" var="trans">
                                            <div class="transaction-item ${trans.transactionType.toLowerCase()}">
                                                <div class="transaction-header">
                                                    <span class="transaction-type">
                                                        <c:choose>
                                                            <c:when test="${trans.transactionType == 'IN'}">📥 입고
                                                            </c:when>
                                                            <c:when test="${trans.transactionType == 'OUT'}">📤 출고
                                                            </c:when>
                                                            <c:otherwise>🔄 조정</c:otherwise>
                                                        </c:choose>
                                                    </span>
                                                    <span class="transaction-date">
                                                        ${trans.transactionDate}
                                                    </span>
                                                </div>
                                                <div class="transaction-details">
                                                    ${trans.itemName} - ${trans.quantity} 단위
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="empty-state">
                                            <p>최근 거래 내역이 없습니다</p>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
            </body>

            </html>