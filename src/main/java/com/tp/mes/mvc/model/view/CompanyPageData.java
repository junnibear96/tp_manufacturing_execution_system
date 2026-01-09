package com.tp.mes.mvc.model.view;

import java.time.Instant;
import java.util.List;

public class CompanyPageData {

  private final Instant now;
  private final List<String> keywords;
  private final List<CompanyMenuGroup> menuGroups;

  public CompanyPageData(Instant now, List<String> keywords, List<CompanyMenuGroup> menuGroups) {
    this.now = now;
    this.keywords = keywords;
    this.menuGroups = menuGroups;
  }

  public Instant getNow() {
    return now;
  }

  public List<String> getKeywords() {
    return keywords;
  }

  public List<CompanyMenuGroup> getMenuGroups() {
    return menuGroups;
  }
}
