package com.tp.mes.mvc.controller;

import java.time.Instant;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

  @GetMapping("/")
  public String home(Model model, java.security.Principal principal) {
    System.out.println("DEBUG: HomeController / requested. Principal: " + principal);
    // Check if user is logged in
    if (principal != null) {
      System.out.println("DEBUG: User logged in, redirecting to dashboard");
      // User is logged in, redirect to dashboard
      return "redirect:/dashboard";
    }

    // User is not logged in, show index page
    System.out.println("DEBUG: User NOT logged in, showing index");
    model.addAttribute("now", Instant.now().toString());
    return "index";
  }

  @GetMapping("/cover-letter")
  public String coverLetter(Model model) {
    model.addAttribute("name", "최준석");
    model.addAttribute("title", "Backend Developer");
    return "cover-letter";
  }
}
