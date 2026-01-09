<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TP 회사 소개</title>
  <link rel="stylesheet" href="assets/styles.css" />
</head>
<body>
  <%@ include file="partials/header.jspf" %>

  <main id="content" class="container" role="main">
    <section class="hero" aria-label="TP 소개">
      <div class="hero-grid">
        <div class="card card-strong">
          <div class="kicker">
            <span class="badge">Company</span>
            <span class="small">TP 소개 페이지 (JSP)</span>
          </div>
          <h1>TP</h1>
          <p>
            TP는 제조 현장의 운영 효율과 품질 향상을 목표로,
            그룹사 및 자체 생산 시스템(MES)의 개발·운영을 수행합니다.
          </p>
          <p class="small">
            ※ 회사 소개 문구/연혁/실적은 실제 정보로 교체해서 사용하세요.
          </p>
        </div>

        <aside class="card" aria-label="핵심 키워드">
          <h2 style="margin-top:0;">핵심 키워드</h2>
          <div class="chips" role="list" aria-label="키워드">
            <span class="chip" role="listitem">Manufacturing</span>
            <span class="chip" role="listitem">MES</span>
            <span class="chip" role="listitem">Operations</span>
            <span class="chip" role="listitem">Quality</span>
            <span class="chip" role="listitem">Traceability</span>
          </div>
        </aside>
      </div>
    </section>

    <section class="section" aria-label="무엇을 하는가">
      <div class="grid-2">
        <div class="card">
          <h2>우리가 하는 일</h2>
          <ul class="list">
            <li>생산 실행(MES) 기능 개발 및 운영</li>
            <li>현장 이슈 대응 및 안정적인 서비스 운영</li>
            <li>기존 시스템 유지보수 및 개선</li>
          </ul>
        </div>
        <div class="card">
          <h2>강점(예시)</h2>
          <ul class="list">
            <li>현장 프로세스에 맞춘 업무 설계</li>
            <li>Oracle 기반 데이터 모델링/성능 최적화</li>
            <li>Spring 기반 백엔드 확장성</li>
          </ul>
          <p class="small">※ 템플릿 예시입니다.</p>
        </div>
      </div>
    </section>

    <section class="section" aria-label="기술 스택">
      <div class="card">
        <h2>기술 스택(예시)</h2>
        <div class="chips" role="list" aria-label="기술 목록">
          <span class="chip" role="listitem">Java</span>
          <span class="chip" role="listitem">JSP</span>
          <span class="chip" role="listitem">JavaScript</span>
          <span class="chip" role="listitem">Spring</span>
          <span class="chip" role="listitem">Oracle</span>
          <span class="chip" role="listitem">PL/SQL</span>
        </div>
      </div>
    </section>

    <section class="section" aria-label="문의">
      <div class="card">
        <h2>문의</h2>
        <p class="small">지원용 포트폴리오에서는 연락처/링크를 넣어 두 페이지에서 함께 노출되게 구성할 수도 있어요.</p>
      </div>
    </section>
  </main>

  <%@ include file="partials/footer.jspf" %>
  <script src="assets/app.js" defer></script>
</body>
</html>
