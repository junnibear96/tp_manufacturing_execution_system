package com.tp.mes.mvc.service;

import com.tp.mes.mvc.model.CompanySection;
import com.tp.mes.mvc.model.view.CompanyMenuGroup;
import com.tp.mes.mvc.model.view.CompanyPageData;
import com.tp.mes.mvc.repository.CompanyRepository;
import java.time.Instant;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

@Service
public class DefaultCompanyPageService implements CompanyPageService {

  private final CompanyRepository companyRepository;

  public DefaultCompanyPageService(CompanyRepository companyRepository) {
    this.companyRepository = companyRepository;
  }

  @Override
  public CompanyPageData getPageData() {
    List<CompanySection> sections = companyRepository.getSections();

    Map<String, List<CompanySection>> byCategory = new LinkedHashMap<>();
    for (CompanySection section : sections) {
      String category = section.getCategory() == null ? "기타" : section.getCategory();
      byCategory.computeIfAbsent(category, k -> new ArrayList<>()).add(section);
    }

    List<CompanyMenuGroup> menuGroups = new ArrayList<>();
    for (Map.Entry<String, List<CompanySection>> entry : byCategory.entrySet()) {
      menuGroups.add(new CompanyMenuGroup(entry.getKey(), entry.getValue()));
    }

    return new CompanyPageData(Instant.now(), companyRepository.getKeywords(), menuGroups);
  }
}
