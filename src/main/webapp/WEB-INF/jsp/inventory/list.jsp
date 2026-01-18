<%@ page pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="ko">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>재고 목록 - TP MES</title>
                <style>
                    body {
                        font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        margin: 0;
                        padding: 20px;
                        min-height: 100vh;
                    }

                    .container {
                        max-width: 1600px;
                        margin: 0 auto;
                    }

                    .header {
                        background: white;
                        padding: 24px 32px;
                        border-radius: 16px;
                        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
                        margin-bottom: 24px;
                    }

                    .header-top {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 20px;
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

                    .filters {
                        display: flex;
                        gap: 12px;
                        align-items: center;
                    }

                    .search-box {
                        flex: 1;
                        max-width: 400px;
                    }

                    .search-box input {
                        width: 100%;
                        padding: 10px 16px;
                        border: 2px solid #e2e8f0;
                        border-radius: 8px;
                        font-size: 14px;
                    }

                    .search-box input:focus {
                        outline: none;
                        border-color: #667eea;
                    }

                    select {
                        padding: 10px 16px;
                        border: 2px solid #e2e8f0;
                        border-radius: 8px;
                        font-size: 14px;
                        background: white;
                        cursor: pointer;
                    }

                    select:focus {
                        outline: none;
                        border-color: #667eea;
                    }

                    .card {
                        background: white;
                        border-radius: 16px;
                        padding: 28px;
                        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
                    }

                    .table-wrapper {
                        overflow-x: auto;
                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }

                    thead {
                        background: #f7fafc;
                    }

                    th {
                        padding: 16px;
                        text-align: left;
                        font-weight: 700;
                        color: #2d3748;
                        font-size: 13px;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                    }

                    td {
                        padding: 16px;
                        border-top: 1px solid #e2e8f0;
                    }

                    tbody tr {
                        transition: background 0.2s;
                    }

                    tbody tr:hover {
                        background: #f7fafc;
                    }

                    .badge {
                        display: inline-block;
                        padding: 4px 12px;
                        border-radius: 12px;
                        font-size: 11px;
                        font-weight: 700;
                        text-transform: uppercase;
                    }

                    .badge-low {
                        background: #fed7d7;
                        color: #c53030;
                    }

                    .badge-ok {
                        background: #c6f6d5;
                        color: #2f855a;
                    }

                    .badge-warning {
                        background: #feebc8;
                        color: #c05621;
                    }

                    .item-code {
                        font-family: 'Courier New', monospace;
                        font-weight: 600;
                        color: #667eea;
                    }

                    .btn-sm {
                        padding: 6px 12px;
                        font-size: 12px;
                    }

                    .empty-state {
                        text-align: center;
                        padding: 60px 20px;
                        color: #a0aec0;
                    }

                    .empty-state p {
                        font-size: 18px;
                        margin: 12px 0;
                    }

                    /* Responsive Design */
                    @media (max-width: 1024px) {
                        .container {
                            max-width: 100%;
                        }

                        table {
                            font-size: 13px;
                        }
                    }

                    @media (max-width: 768px) {
                        body {
                            padding: 12px;
                        }

                        .header {
                            padding: 16px 20px;
                        }

                        .header-top {
                            flex-direction: column;
                            align-items: flex-start;
                        }

                        .header h1 {
                            font-size: 22px;
                            margin-bottom: 12px;
                        }

                        .header-actions {
                            width: 100%;
                            flex-direction: column;
                        }

                        .header-actions .btn {
                            width: 100%;
                            text-align: center;
                        }

                        /* Filters responsive */
                        .filters {
                            flex-direction: column;
                            width: 100%;
                        }

                        .search-box {
                            max-width: 100%;
                            width: 100%;
                        }

                        .filters select,
                        .filters button {
                            width: 100%;
                        }

                        /* Card and table */
                        .card {
                            padding: 16px;
                        }

                        .table-wrapper {
                            overflow-x: auto;
                            -webkit-overflow-scrolling: touch;
                        }

                        table {
                            min-width: 900px;
                            /* Prevent table collapse */
                            font-size: 12px;
                        }

                        th,
                        td {
                            padding: 12px 8px;
                            white-space: nowrap;
                        }
                    }

                    @media (max-width: 480px) {
                        .header h1 {
                            font-size: 20px;
                        }

                        .btn:not(table .btn) {
                            padding: 8px 16px;
                            font-size: 13px;
                        }

                        .card {
                            padding: 12px;
                        }

                        table {
                            font-size: 11px;
                        }

                        th,
                        td {
                            padding: 10px 6px;
                        }

                        .badge {
                            font-size: 10px;
                            padding: 3px 8px;
                        }

                        .btn-sm {
                            padding: 4px 10px;
                            font-size: 11px;
                        }
                    }
                </style>
            </head>

            <body>
                <div class="container">
                    <div class="header">
                        <div class="header-top">
                            <h1>📦 재고 목록</h1>
                            <div class="header-actions">
                                <a href="/inventory/new" class="btn btn-primary">+ 새 재고 등록</a>
                                <a href="/inventory" class="btn btn-secondary">재고관리</a>
                                <a href="/dashboard" class="btn btn-secondary">홈으로</a>
                            </div>
                        </div>

                        <form method="get" action="/inventory/list">
                            <div class="filters">
                                <div class="search-box">
                                    <input type="text" name="keyword" placeholder="품목코드 또는 품명으로 검색..."
                                        value="${keyword}">
                                </div>
                                <select name="type" onchange="this.form.submit()">
                                    <option value="">전체 타입</option>
                                    <option value="RAW_MATERIAL" ${selectedType=='RAW_MATERIAL' ? 'selected' : '' }>원자재
                                    </option>
                                    <option value="COMPONENT" ${selectedType=='COMPONENT' ? 'selected' : '' }>부품
                                    </option>
                                    <option value="FINISHED_PRODUCT" ${selectedType=='FINISHED_PRODUCT' ? 'selected'
                                        : '' }>완제품</option>
                                </select>
                                <button type="submit" class="btn btn-primary">검색</button>
                            </div>
                        </form>
                    </div>

                    <div class="card">
                        <div class="table-wrapper">
                            <c:choose>
                                <c:when test="${not empty items}">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>품목코드</th>
                                                <th>품명</th>
                                                <th>타입</th>
                                                <th>현재재고</th>
                                                <th>최소재고</th>
                                                <th>상태</th>
                                                <th>위치</th>
                                                <th>가치</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${items}" var="item">
                                                <tr>
                                                    <td>
                                                        <span class="item-code">${item.itemCode}</span>
                                                    </td>
                                                    <td>
                                                        <strong>${item.itemName}</strong>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${item.itemType == 'RAW_MATERIAL'}">원자재
                                                            </c:when>
                                                            <c:when test="${item.itemType == 'COMPONENT'}">부품</c:when>
                                                            <c:otherwise>완제품</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <strong>${item.currentQuantity}</strong> ${item.unit}
                                                    </td>
                                                    <td>${item.minQuantity} ${item.unit}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${item.currentQuantity < item.minQuantity}">
                                                                <span class="badge badge-low">재고부족</span>
                                                            </c:when>
                                                            <c:when
                                                                test="${item.currentQuantity < item.minQuantity * 1.2}">
                                                                <span class="badge badge-warning">주의</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge badge-ok">정상</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>${item.warehouseLocation}</td>
                                                    <td>
                                                        <fmt:formatNumber
                                                            value="${item.currentQuantity * item.unitPrice}"
                                                            pattern="#,##0" />원
                                                    </td>
                                                    <td>
                                                        <a href="/inventory/${item.inventoryId}"
                                                            class="btn btn-sm btn-primary">
                                                            상세보기
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <div class="empty-state">
                                        <p>📭</p>
                                        <p>등록된 재고가 없습니다</p>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </body>

            </html>