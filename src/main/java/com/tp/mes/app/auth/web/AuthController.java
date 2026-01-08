package com.tp.mes.app.auth.web;

import com.tp.mes.app.auth.model.AuthUser;
import com.tp.mes.app.auth.service.AuthService;
import java.time.Instant;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/app")
public class AuthController {

  private final AuthService authService;

  public AuthController(AuthService authService) {
    this.authService = authService;
  }

  @GetMapping("/login")
  public String loginForm(Model model, @RequestParam(value = "error", required = false) String error) {
    model.addAttribute("now", Instant.now().toString());
    model.addAttribute("error", error);
    return "app/login";
  }

  @PostMapping("/login")
  public String login(
      @RequestParam("username") String username,
      @RequestParam("password") String password,
      HttpSession session
  ) {
    return authService.authenticate(username, password)
        .map(user -> {
          session.setAttribute(AuthUser.SESSION_KEY, user);
          return "redirect:/app/home";
        })
        .orElse("redirect:/app/login?error=1");
  }

  @PostMapping("/logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:/";
  }

  @GetMapping("/home")
  public String home(Model model, HttpSession session) {
    AuthUser user = (AuthUser) session.getAttribute(AuthUser.SESSION_KEY);
    model.addAttribute("now", Instant.now().toString());
    model.addAttribute("user", user);
    return "app/home";
  }
}
