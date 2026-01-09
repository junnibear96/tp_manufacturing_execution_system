package com.tp.mes.app.notice.web;

import com.tp.mes.app.auth.model.AuthUser;
import com.tp.mes.app.notice.model.Notice;
import com.tp.mes.app.notice.service.NoticeService;
import java.util.Optional;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NoticeController {

  private final NoticeService service;

  public NoticeController(NoticeService service) {
    this.service = service;
  }

  @GetMapping("/app/notices")
  public String list(Model model) {
    model.addAttribute("notices", service.listNotices());
    return "app/notices";
  }

  @GetMapping("/app/notices/{noticeId}")
  public String view(@PathVariable("noticeId") long noticeId, Model model) {
    Optional<Notice> found = service.findNotice(noticeId);
    if (found.isEmpty()) {
      return "redirect:/app/notices";
    }
    model.addAttribute("notice", found.get());
    return "app/notice-view";
  }

  @GetMapping("/admin/notices/new")
  public String newForm(Model model) {
    model.addAttribute("title", "");
    model.addAttribute("body", "");
    return "admin/notice-form";
  }

  @PostMapping("/admin/notices/new")
  public String create(
      @RequestParam("title") String title,
      @RequestParam("body") String body,
      HttpSession session
  ) {
    AuthUser user = (AuthUser) session.getAttribute(AuthUser.SESSION_KEY);
    Long createdBy = user == null ? null : user.getUserId();
    service.createNotice(title, body, createdBy);
    return "redirect:/app/notices";
  }
}
