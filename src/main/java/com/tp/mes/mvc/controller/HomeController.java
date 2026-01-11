package com.tp.mes.mvc.controller;

import com.tp.mes.mvc.service.CompanyPageService;
import java.time.Instant;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

  private final CompanyPageService companyPageService;

  public HomeController(CompanyPageService companyPageService) {
    this.companyPageService = companyPageService;
  }

  @GetMapping("/")
  public String home(Model model) {
    model.addAttribute("now", Instant.now().toString());
    model.addAttribute("keywords", companyPageService.getPageData().getKeywords());
    return "index";
  }

  @GetMapping("/cover-letter")
  public String coverLetter(Model model) {
    model.addAttribute("name", "최준석");
    model.addAttribute("title", "Backend Developer");
    return "cover-letter";
  }
}
