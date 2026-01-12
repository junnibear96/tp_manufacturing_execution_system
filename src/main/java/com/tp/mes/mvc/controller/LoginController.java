package com.tp.mes.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 * Login Controller - Simple session-based authentication
 * TODO: Integrate with HRM system in future
 */
@Controller
public class LoginController {

    /**
     * Login page
     */
    @GetMapping("/login")
    public String login(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout,
            Model model) {

        if (error != null) {
            model.addAttribute("errorMessage", "사번 또는 비밀번호가 올바르지 않습니다.");
        }

        if (logout != null) {
            model.addAttribute("message", "로그아웃되었습니다.");
        }

        return "login";
    }

    /**
     * Handle login form submission
     */
    @PostMapping("/login")
    public String processLogin(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {

        // Simple credential check (hardcoded for now)
        if ("admin".equals(username) && "admin123".equals(password)) {
            session.setAttribute("loggedInUser", username);
            session.setAttribute("userName", "관리자");
            session.setAttribute("userRoles", List.of("ROLE_ADMIN", "ROLE_USER"));
            return "redirect:/dashboard";
        } else if ("prod001".equals(username) && "prod123".equals(password)) {
            session.setAttribute("loggedInUser", username);
            session.setAttribute("userName", "생산관리자");
            session.setAttribute("userRoles", List.of("ROLE_PRODUCTION", "ROLE_MANAGER", "ROLE_USER"));
            return "redirect:/dashboard";
        } else if ("worker001".equals(username) && "work123".equals(password)) {
            session.setAttribute("loggedInUser", username);
            session.setAttribute("userName", "작업자");
            session.setAttribute("userRoles", List.of("ROLE_WORKER", "ROLE_USER"));
            return "redirect:/dashboard";
        }

        // Login failed
        model.addAttribute("errorMessage", "사번 또는 비밀번호가 올바르지 않습니다.");
        return "login";
    }

    /**
     * Logout
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login?logout";
    }

    /**
     * Dashboard - main page after login
     */
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        String username = (String) session.getAttribute("loggedInUser");
        String userName = (String) session.getAttribute("userName");
        @SuppressWarnings("unchecked")
        List<String> roles = (List<String>) session.getAttribute("userRoles");

        model.addAttribute("userName", userName != null ? userName : username);
        model.addAttribute("userRoles", roles);

        return "dashboard";
    }

    /**
     * Reports page
     */
    @GetMapping("/reports")
    public String reports() {
        return "reports";
    }
}
