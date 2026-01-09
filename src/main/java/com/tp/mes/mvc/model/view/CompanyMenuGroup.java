package com.tp.mes.mvc.model.view;

import com.tp.mes.mvc.model.CompanySection;
import java.util.List;

public class CompanyMenuGroup {

  private final String title;
  private final List<CompanySection> sections;

  public CompanyMenuGroup(String title, List<CompanySection> sections) {
    this.title = title;
    this.sections = sections;
  }

  public String getTitle() {
    return title;
  }

  public List<CompanySection> getSections() {
    return sections;
  }
}
