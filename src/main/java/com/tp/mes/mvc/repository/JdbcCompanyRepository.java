package com.tp.mes.mvc.repository;

import com.tp.mes.mvc.model.CompanySection;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class JdbcCompanyRepository implements CompanyRepository {

  private static final Logger log = LoggerFactory.getLogger(JdbcCompanyRepository.class);

  private final JdbcTemplate jdbcTemplate;

  public JdbcCompanyRepository(JdbcTemplate jdbcTemplate) {
    this.jdbcTemplate = jdbcTemplate;
  }

  @Override
  public List<String> getKeywords() {
    try {
      return jdbcTemplate.query(
          "select keyword from tp_company_keyword order by sort_order nulls last, keyword",
          (rs, rowNum) -> rs.getString(1)
      );
    } catch (DataAccessException ex) {
      if (OracleRepositorySupport.isMissingTableOrView(ex)) {
        log.warn("tp_company_keyword table not found; returning fallback keywords. Run scripts/oracle-init.sql to create tables.");
        return List.of("Manufacturing", "MES", "Operations", "Quality", "Traceability");
      }
      throw ex;
    }
  }

  @Override
  public List<CompanySection> getSections() {
    try {
      return jdbcTemplate.query(
          "select category, title, anchor, body "
              + "from tp_company_section "
              + "order by category, sort_order nulls last, title",
          (rs, rowNum) -> new CompanySection(
              rs.getString("category"),
              rs.getString("title"),
              rs.getString("anchor"),
              rs.getString("body")
          )
      );
    } catch (DataAccessException ex) {
      if (OracleRepositorySupport.isMissingTableOrView(ex)) {
        log.warn("tp_company_section table not found; returning fallback sections. Run scripts/oracle-init.sql to create tables.");
        return List.of(
          new CompanySection("회사 소개", "우리가 하는 일", "what-we-do",
            "생산 실행(MES) 기능 개발 및 운영 · 현장 이슈 대응 및 안정적인 서비스 운영 · 기존 시스템 유지보수 및 개선"),
          new CompanySection("회사 소개", "강점(예시)", "strengths",
            "현장 프로세스에 맞춘 업무 설계 · 데이터 모델링/성능 최적화 · Spring 기반 확장성 있는 구조"),
            new CompanySection("TP 소개", "미션·비전", "mission-vision",
                "제조 현장의 흐름을 이해하고, 품질과 생산성을 동시에 높이는 운영 중심의 시스템을 제공합니다."),
            new CompanySection("사업부문", "MES / 생산", "business-mes",
                "생산실적/투입/공정/불량 등 핵심 데이터를 연결하고, 현장 사용성을 고려해 화면과 업무 흐름을 설계합니다."),
            new CompanySection("채용", "채용 안내", "careers",
                "문제를 끝까지 파고들고, 팀과 함께 개선을 만들어가는 개발 문화를 지향합니다.")
        );
      }
      throw ex;
    }
  }
}
