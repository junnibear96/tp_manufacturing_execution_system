package com.tp.mes.mvc.service;

import com.tp.mes.mvc.model.CompanySection;
import com.tp.mes.mvc.model.view.CompanyMenuGroup;
import com.tp.mes.mvc.model.view.CompanyPageData;
import com.tp.mes.mvc.repository.CompanyRepository;
import java.time.Instant;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

@Service
public class DefaultCompanyPageService implements CompanyPageService {

  private static final Logger log = LoggerFactory.getLogger(DefaultCompanyPageService.class);

  private final CompanyRepository companyRepository;

  public DefaultCompanyPageService(CompanyRepository companyRepository) {
    this.companyRepository = companyRepository;
  }

  @Override
  public CompanyPageData getPageData() {
    List<CompanySection> sections = Collections.emptyList();
    List<String> keywords = Collections.emptyList();

    try {
      sections = companyRepository.getSections();
    } catch (DataAccessException e) {
      log.warn("Failed to load company sections from DB: {}", e.getMessage());
      // sections remains empty list
    }

    try {
      keywords = companyRepository.getKeywords();
    } catch (DataAccessException e) {
      log.warn("Failed to load company keywords from DB: {}", e.getMessage());
      // keywords remains empty list
    }

    Map<String, List<CompanySection>> byCategory = new LinkedHashMap<>();
    for (CompanySection section : sections) {
      String category = section.getCategory() == null ? "기타" : section.getCategory();
      byCategory.computeIfAbsent(category, k -> new ArrayList<>()).add(section);
    }

    List<CompanyMenuGroup> menuGroups = new ArrayList<>();
    for (Map.Entry<String, List<CompanySection>> entry : byCategory.entrySet()) {
      menuGroups.add(new CompanyMenuGroup(entry.getKey(), entry.getValue()));
    }

    return new CompanyPageData(Instant.now(), keywords, menuGroups);
  }
}
