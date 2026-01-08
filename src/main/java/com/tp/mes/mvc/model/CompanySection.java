package com.tp.mes.mvc.model;

public class CompanySection {

  private final String category;
  private final String title;
  private final String anchor;
  private final String body;

  public CompanySection(String category, String title, String anchor, String body) {
    this.category = category;
    this.title = title;
    this.anchor = anchor;
    this.body = body;
  }

  public String getCategory() {
    return category;
  }

  public String getTitle() {
    return title;
  }

  public String getAnchor() {
    return anchor;
  }

  public String getBody() {
    return body;
  }
}
