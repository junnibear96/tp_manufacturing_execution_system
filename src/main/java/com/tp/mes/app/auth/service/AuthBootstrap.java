package com.tp.mes.app.auth.service;

import com.tp.mes.app.auth.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class AuthBootstrap implements ApplicationRunner {

  private static final Logger log = LoggerFactory.getLogger(AuthBootstrap.class);

  private final UserRepository userRepository;

  public AuthBootstrap(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  @Override
  public void run(ApplicationArguments args) {
    // If tables are missing, repository logs a warning and no-ops.
    userRepository.ensureRoleExists(AuthService.ROLE_ADMIN);
    userRepository.ensureRoleExists(AuthService.ROLE_USER);

    if (!userRepository.hasAnyUser()) {
      String username = "admin";
      String rawPassword = "admin123!";
      String hash = new BCryptPasswordEncoder().encode(rawPassword);
      long userId = userRepository.insertUser(username, hash, "Administrator");
      userRepository.ensureUserRole(userId, AuthService.ROLE_ADMIN);
      userRepository.ensureUserRole(userId, AuthService.ROLE_USER);
      log.warn("Created default admin account: username='{}' password='{}' (change it in DB)", username, rawPassword);
    }
  }
}
