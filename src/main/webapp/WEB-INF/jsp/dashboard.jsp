<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>대시보드 - TP MES</title>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { font-family: 'Noto Sans KR', sans-serif; background: #f5f7fa; }
.header { background: white; box-shadow: 0 2px 4px rgba(0,0,0,0.1); padding: 16px 32px; display: flex; justify-content: space-between; align-items: center; }
.header h1 { font-size: 24px; color: #667eea; }
.user-info { display: flex; align-items: center; gap: 16px; }
.user-name { font-weight: 500; color: #333; }
.btn-logout { padding: 8px 16px; background: #dc3545; color: white; border: none; border-radius: 6px; cursor: pointer; font-size: 14px; text-decoration: none; }
.btn-logout:hover { background: #c82333; }
.container { max-width: 1200px; margin: 0 auto; padding: 32px 16px; }
.dashboard-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 24px; margin-bottom: 32px; }
.card { background: white; border-radius: 12px; padding: 24px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
.card h2 { font-size: 18px; color: #333; margin-bottom: 16px; }
.card p { color: #666; line-height: 1.6; }
.stats { display: flex; justify-content: space-between; margin-top: 16px; }
.stat-item { text-align: center; }
.stat-value { font-size: 28px; font-weight: 700; color: #667eea; }
.stat-label { font-size: 13px; color: #999; margin-top: 4px; }
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
<div class="stat-item"><div class="stat-value">324</div><div class="stat-label">생산량</div></div>
<div class="stat-item"><div class="stat-value">98%</div><div class="stat-label">가동률</div></div>
</div>
</div>
<div class="card">
<h2>📦 재고 현황</h2>
<p>현재 재고 상태를 한눈에 파악합니다.</p>
<div class="stats">
<div class="stat-item"><div class="stat-value">1,248</div><div class="stat-label">총 재고</div></div>
<div class="stat-item"><div class="stat-value">12</div><div class="stat-label">알림</div></div>
</div>
</div>
<div class="card">
<h2>🚚 배송 관리</h2>
<p>금일 배송 건수 및 진행 상황</p>
<div class="stats">
<div class="stat-item"><div class="stat-value">45</div><div class="stat-label">배송 중</div></div>
<div class="stat-item"><div class="stat-value">128</div><div class="stat-label">완료</div></div>
</div>
</div>
</div>
<div class="card">
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
