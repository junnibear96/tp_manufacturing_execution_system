package com.tp.mes.mvc.controller;

import com.tp.mes.mvc.model.view.CompanyPageData;
import com.tp.mes.mvc.model.view.PortfolioPageData;
import com.tp.mes.mvc.service.CompanyPageService;
import com.tp.mes.mvc.service.PortfolioPageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app")
public class PageController {

  private final PortfolioPageService portfolioPageService;
  private final CompanyPageService companyPageService;

  public PageController(PortfolioPageService portfolioPageService, CompanyPageService companyPageService) {
    this.portfolioPageService = portfolioPageService;
    this.companyPageService = companyPageService;
  }

  @GetMapping("/portfolio")
  public String portfolio(Model model) {
    PortfolioPageData data = portfolioPageService.getPageData();

    model.addAttribute("now", data.getNow().toString());
    model.addAttribute("skills", data.getSkills());
    model.addAttribute("projects", data.getProjects());
    return "app/portfolio";
  }

  @GetMapping("/company")
  public String companyIntro(Model model) {
    CompanyPageData data = companyPageService.getPageData();

    model.addAttribute("now", data.getNow().toString());
    model.addAttribute("keywords", data.getKeywords());
    model.addAttribute("menuGroupCount", data.getMenuGroups() == null ? 0 : data.getMenuGroups().size());
    return "app/company-intro";
  }

  @GetMapping("/company/sections")
  public String companySections(Model model) {
    CompanyPageData data = companyPageService.getPageData();

    model.addAttribute("now", data.getNow().toString());
    model.addAttribute("keywords", data.getKeywords());
    model.addAttribute("menuGroups", data.getMenuGroups());
    return "app/company-sections";
  }
}
