package com.tp.mes.app.notice.web;

import com.tp.mes.app.auth.model.AuthUser;
import com.tp.mes.app.notice.model.Notice;
import com.tp.mes.app.notice.service.NoticeService;
import java.util.Optional;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.access.prepost.PreAuthorize;
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

  // New root path + Legacy /app path
  @GetMapping({ "/notices" })
  public String list(Model model) {
    model.addAttribute("notices", service.listNotices());
    return "notices/list";
  }

  @GetMapping({ "/notices/{noticeId}" })
  public String view(@PathVariable("noticeId") long noticeId, Model model) {
    Optional<Notice> found = service.findNotice(noticeId);
    if (found.isEmpty()) {
      return "redirect:/notices";
    }
    model.addAttribute("notice", found.get());
    return "notices/view";
  }

  @GetMapping("/admin/notices/new")
  public String newForm(Model model) {
    model.addAttribute("title", "");
    model.addAttribute("body", "");
    return "admin/notice-form";
  }

  @PreAuthorize("hasRole('ADMIN')")
  @PostMapping("/admin/notices/new")
  public String create(
      @RequestParam("title") String title,
      @RequestParam("body") String body,
      HttpSession session) {
    AuthUser user = (AuthUser) session.getAttribute(AuthUser.SESSION_KEY);
    Long createdBy = user == null ? null : user.getUserId();
    service.createNotice(title, body, createdBy);
    return "redirect:/notices";
  }
}
