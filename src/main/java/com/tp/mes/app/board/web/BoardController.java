package com.tp.mes.app.board.web;

import com.tp.mes.app.board.model.BoardPost;
import com.tp.mes.app.board.service.BoardService;
import java.util.Optional;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class BoardController {

  private final BoardService service;

  public BoardController(BoardService service) {
    this.service = service;
  }

  @GetMapping("/app/board")
  public String list(Model model) {
    model.addAttribute("posts", service.listPosts());
    return "app/board";
  }

  @GetMapping("/app/board/{postId}")
  public String view(@PathVariable("postId") long postId, Model model) {
    Optional<BoardPost> found = service.findPost(postId);
    if (found.isEmpty()) {
      return "redirect:/app/board";
    }
    model.addAttribute("post", found.get());
    return "app/board-view";
  }
}
