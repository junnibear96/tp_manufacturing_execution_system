<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TP 포트폴리오 (JSP)</title>
  <link rel="stylesheet" href="assets/styles.css" />
</head>
<body>
  <%@ include file="partials/header.jspf" %>

  <main id="content" class="container" role="main">
    <section class="hero" id="about" aria-label="소개">
      <div class="hero-grid">
        <div class="card card-strong">
          <div class="kicker">
            <span class="badge">Portfolio</span>
            <span class="small">JSP · Spring · Oracle 중심</span>
          </div>
          <h1>TP Manufacturing Execution System</h1>
          <p>
            TP의 그룹사/자체 생산 시스템(MES) 개발 및 운영 경험을 중심으로 정리한 포트폴리오 페이지입니다.
            기존 시스템 유지보수와 개선, 안정적인 운영을 목표로 합니다.
          </p>
          <p class="small">
            이 페이지는 단일 JSP로 구성된 시작 템플릿입니다. 실제 회사 소개/성과/프로젝트 내용은 이후 단계에서 추가하면 됩니다.
          </p>
        </div>

        <aside class="card" aria-label="요약">
          <h2 style="margin-top:0;">요약</h2>
          <div class="keyval">
            <div class="key">도메인</div>
            <div class="value">제조 · 생산 · MES</div>
          </div>
          <div class="keyval">
            <div class="key">개발</div>
            <div class="value">JSP/Java · Spring</div>
          </div>
          <div class="keyval">
            <div class="key">DB</div>
            <div class="value">Oracle · PL/SQL</div>
          </div>
          <div class="keyval">
            <div class="key">프론트</div>
            <div class="value">HTML · JavaScript</div>
          </div>
          <div class="keyval">
            <div class="key">서버 렌더</div>
            <div class="value"><%= java.time.LocalDateTime.now() %></div>
          </div>
        </aside>
      </div>
    </section>

    <section class="section" id="work" aria-label="업무">
      <div class="grid-2">
        <div class="card">
          <h2>이런 업무를 해요</h2>
          <ul class="list">
            <li>그룹사 및 자체 생산 시스템 개발 및 관리</li>
            <li>기존 시스템 유지보수 및 개선</li>
          </ul>
        </div>

        <div class="card">
          <h2>운영 관점</h2>
          <ul class="list">
            <li>장애/이슈 대응과 원인 분석(RCA)</li>
            <li>배포/운영 절차 정립 및 문서화</li>
            <li>성능 개선(쿼리/인덱스/배치)</li>
          </ul>
          <p class="small">※ 위 항목은 템플릿 문구이며 필요 시 삭제/수정하세요.</p>
        </div>
      </div>
    </section>

    <section class="section" id="profile" aria-label="인재상">
      <div class="grid-2">
        <div class="card">
          <h2>이런 분들을 찾고 있어요</h2>
          <ul class="list">
            <li>학력: 초대졸 이상</li>
            <li>유관 업무 경력자</li>
            <li>사용 기술: HTML, Java, JSP, JavaScript</li>
            <li>Framework: Spring</li>
            <li>DBMS: Oracle</li>
          </ul>
        </div>

        <div class="card">
          <h2>이런 분이면 더 좋아요</h2>
          <ul class="list">
            <li>PL/SQL 활용 능숙자</li>
            <li>그룹웨어 운영 경험자</li>
          </ul>
        </div>
      </div>
    </section>

    <section class="section" id="skills" aria-label="필요 기술">
      <div class="card">
        <h2>이런 기술이 필요해요</h2>
        <div class="chips" role="list" aria-label="기술 목록">
          <span class="chip" role="listitem">HTML</span>
          <span class="chip" role="listitem">JAVA</span>
          <span class="chip" role="listitem">Javascript</span>
          <span class="chip" role="listitem">JSP</span>
          <span class="chip" role="listitem">Oracle</span>
          <span class="chip" role="listitem">Spring</span>
          <span class="chip" role="listitem">PL/SQL</span>
        </div>
      </div>
    </section>

    <section class="section" id="projects" aria-label="프로젝트">
      <div class="card">
        <h2>프로젝트 경험(지원용)</h2>
        <p class="small">아래는 포맷 예시입니다. 실제 프로젝트명/기간/성과로 교체하세요.</p>
        <div class="cards" style="margin-top:12px;">
          <div class="card">
            <h3>MES 생산실적/추적성 기능 개선</h3>
            <div class="meta">Stack: Java · JSP · Spring · Oracle(PL/SQL)</div>
            <ul class="list">
              <li>현장 프로세스 기반 화면/업무 흐름 정리 및 개선</li>
              <li>대용량 조회 성능 개선(쿼리 튜닝, 인덱스 점검)</li>
              <li>장애 재발 방지(로그/모니터링 기준 정비)</li>
            </ul>
          </div>
          <div class="card">
            <h3>기존 시스템 유지보수 & 운영 안정화</h3>
            <div class="meta">Keyword: 운영 · 배포 · RCA · 성능</div>
            <ul class="list">
              <li>반복 이슈에 대한 원인 분석 및 조치 표준화</li>
              <li>배치/인터페이스 점검 및 오류 케이스 보강</li>
              <li>운영 문서화(장애 대응/릴리즈 체크리스트)</li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <section class="section" aria-label="기술 데모">
      <div class="grid-2">
        <div class="card">
          <h2>Spring 코드 스니펫(예시)</h2>
          <div class="toolbar">
            <div class="meta">Controller · Health Check</div>
            <button class="btn" type="button" data-copy="#code-spring">복사</button>
          </div>
          <div class="codeblock">
            <pre id="code-spring"><code>@RestController
public class HealthController {

  @GetMapping("/api/health")
  public ResponseEntity&lt;Map&lt;String, Object&gt;&gt; health() {
    Map&lt;String, Object&gt; body = new HashMap&lt;&gt;();
    body.put("status", "UP");
    body.put("time", Instant.now().toString());
    return ResponseEntity.ok(body);
  }
}</code></pre>
          </div>
          <p class="small">실제 프로젝트에서는 인증/로깅/예외 처리 기준을 함께 정리하면 좋아요.</p>
        </div>

        <div class="card">
          <h2>Oracle PL/SQL 스니펫(예시)</h2>
          <div class="toolbar">
            <div class="meta">MERGE 기반 UPSERT</div>
            <button class="btn" type="button" data-copy="#code-plsql">복사</button>
          </div>
          <div class="codeblock">
            <pre id="code-plsql"><code>MERGE INTO MES_WORK_RESULT t
USING (SELECT :work_order_id AS work_order_id,
              :qty AS qty
       FROM dual) s
ON (t.work_order_id = s.work_order_id)
WHEN MATCHED THEN
  UPDATE SET t.qty = s.qty,
             t.updated_at = SYSTIMESTAMP
WHEN NOT MATCHED THEN
  INSERT (work_order_id, qty, created_at, updated_at)
  VALUES (s.work_order_id, s.qty, SYSTIMESTAMP, SYSTIMESTAMP);</code></pre>
          </div>
          <p class="small">성능/락/트랜잭션 범위를 같이 적어두면 설득력이 올라갑니다.</p>
        </div>
      </div>
    </section>

    <section class="section" id="contact" aria-label="연락처">
      <div class="card">
        <h2>연락처 / 링크</h2>
        <div class="grid-2" style="margin-top:12px;">
          <div class="card">
            <h3>연락처</h3>
            <ul class="list">
              <li>Email: your.email@example.com</li>
              <li>Phone: 010-0000-0000</li>
              <li>Location: Seoul (예시)</li>
            </ul>
          </div>
          <div class="card">
            <h3>링크</h3>
            <ul class="list">
              <li><a href="#" aria-label="GitHub">GitHub</a></li>
              <li><a href="#" aria-label="Blog">Blog</a></li>
              <li><a href="#" aria-label="Resume">PDF Resume</a></li>
            </ul>
            <p class="small">실제 URL로 교체하세요.</p>
          </div>
        </div>
      </div>
    </section>

    <section class="section" aria-label="다음 단계">
      <div class="card">
        <h2>다음 단계(원하시면 제가 이어서 해드릴게요)</h2>
        <ul class="list">
          <li>프로젝트 경험(기간/역할/성과) 섹션 추가</li>
          <li>Spring/Oracle 기반으로 수행한 작업을 케이스 스터디 형태로 정리</li>
          <li>연락처/링크(깃헙, 블로그 등) 추가</li>
        </ul>
      </div>
    </section>
  </main>

  <%@ include file="partials/footer.jspf" %>
  <script src="assets/app.js" defer></script>
</body>
</html>
