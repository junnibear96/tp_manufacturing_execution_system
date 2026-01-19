<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
      <!doctype html>
      <html lang="ko">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>TP · Intro</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css" />
        <style>
          /* Mobile Menu Dropdown */
          .mobile-menu-dropdown {
            display: none;
            position: fixed;
            top: 60px;
            right: 0;
            background: rgba(26, 32, 44, 0.98);
            backdrop-filter: blur(20px);
            min-width: 200px;
            border-radius: 0 0 0 12px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            z-index: 999;
            transform: translateY(-10px);
            opacity: 0;
            transition: all 0.3s ease;
          }

          .mobile-menu-dropdown.active {
            display: block;
            transform: translateY(0);
            opacity: 1;
          }

          .mobile-menu-dropdown a {
            display: block;
            padding: 16px 24px;
            color: white;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.2s;
          }

          .mobile-menu-dropdown a:last-child {
            border-bottom: none;
          }

          .mobile-menu-dropdown a:hover {
            background: rgba(255, 255, 255, 0.1);
            padding-left: 32px;
          }

          .landing-menu {
            cursor: pointer;
          }

          .landing-menu.active .bar:nth-child(1) {
            transform: rotate(45deg) translate(5px, 5px);
          }

          .landing-menu.active .bar:nth-child(2) {
            opacity: 0;
          }

          .landing-menu.active .bar:nth-child(3) {
            transform: rotate(-45deg) translate(6px, -6px);
          }

          @media (min-width: 769px) {
            .mobile-menu-dropdown {
              display: none !important;
            }
          }
        </style>
      </head>

      <body>
        <a class="skip" href="#content">
          <spring:message code="intro.skip" text="본문으로 바로가기" />
        </a>

        <header class="landing-top" role="banner">
          <div class="landing-top-inner">
            <a class="landing-logo" href="${pageContext.request.contextPath}/app/home" aria-label="TP Home">TP</a>
            <nav class="landing-actions" aria-label="Language and menu">
              <a class="landing-action" href="#" aria-disabled="true">KOR</a>
              <span class="landing-sep" aria-hidden="true">·</span>
              <a class="landing-action" href="#" aria-disabled="true">ENG</a>
              <button class="landing-menu" type="button" aria-label="Menu" id="mobileMenuButton">
                <span class="bar" aria-hidden="true"></span>
                <span class="bar" aria-hidden="true"></span>
                <span class="bar" aria-hidden="true"></span>
              </button>
            </nav>
          </div>

          <!-- Mobile Menu Dropdown -->
          <div class="mobile-menu-dropdown" id="mobileMenuDropdown">
            <a href="${pageContext.request.contextPath}/company">
              <spring:message code="app.intro.company" text="회사 소개" />
            </a>
            <a href="${pageContext.request.contextPath}/portfolio">
              <spring:message code="app.intro.portfolio" text="포트폴리오" />
            </a>
            <a href="${pageContext.request.contextPath}/login">
              <spring:message code="app.header.login" text="로그인" />
            </a>
            <a href="${pageContext.request.contextPath}/dashboard">
              <spring:message code="app.header.dashboard" text="대시보드" />
            </a>
          </div>
        </header>

        <main id="content" class="landing" role="main">
          <div class="landing-overlay" aria-hidden="true"></div>

          <section class="landing-center" aria-label="Intro">
            <h1>
              <spring:message code="intro.title" text="현장을 위한 실행 가능한 시스템" />
            </h1>
            <p class="landing-sub">
              <spring:message code="intro.subtitle" text="Your Trusted Partner · TP" />
            </p>
            <p class="small" style="margin-top:18px;">
              <spring:message code="app.login.serverTime" arguments="${now}" text="서버 시간: ${now}" />
            </p>

            <div class="landing-chips" role="list" aria-label="Quick links">
              <a class="chip" role="listitem" href="${pageContext.request.contextPath}/company">
                <spring:message code="app.intro.company" text="회사 소개" />
              </a>
              <a class="chip" role="listitem" href="${pageContext.request.contextPath}/portfolio">
                <spring:message code="app.intro.portfolio" text="포트폴리오" />
              </a>
              <a class="chip" role="listitem" href="${pageContext.request.contextPath}/api/health">Health</a>
            </div>

            <div class="landing-keywords" aria-label="Keywords">
              <div class="chips" role="list" aria-label="<spring:message code='intro.keywords' default='키워드'/>">
                <c:forEach var="k" items="${keywords}">
                  <span class="chip" role="listitem">
                    <c:out value="${k}" />
                  </span>
                </c:forEach>
              </div>
            </div>
          </section>

          <section class="landing-bottom" aria-label="Brands">
            <div class="brand-strip" role="list">
              <div class="brand-item" role="listitem"><span class="dot" aria-hidden="true"></span><span>TP</span></div>
              <div class="brand-item" role="listitem"><span class="dot" aria-hidden="true"></span><span>TP Nadia</span>
              </div>
              <div class="brand-item" role="listitem"><span class="dot" aria-hidden="true"></span><span>EO</span></div>
              <div class="brand-item" role="listitem"><span class="dot" aria-hidden="true"></span><span>TP Living</span>
              </div>
              <div class="brand-item" role="listitem"><span class="dot" aria-hidden="true"></span><span>TP
                  F&amp;B</span></div>
              <div class="brand-item" role="listitem"><span class="dot" aria-hidden="true"></span><span>TP Square</span>
              </div>
            </div>
          </section>
        </main>

        <script>
          // Mobile Menu Toggle
          document.addEventListener('DOMContentLoaded', function () {
            const menuButton = document.getElementById('mobileMenuButton');
            const menuDropdown = document.getElementById('mobileMenuDropdown');

            if (menuButton && menuDropdown) {
              menuButton.addEventListener('click', function () {
                this.classList.toggle('active');
                menuDropdown.classList.toggle('active');
              });

              // Close menu when clicking outside
              document.addEventListener('click', function (event) {
                if (!menuButton.contains(event.target) && !menuDropdown.contains(event.target)) {
                  menuButton.classList.remove('active');
                  menuDropdown.classList.remove('active');
                }
              });

              // Close menu when clicking a link
              const menuLinks = menuDropdown.querySelectorAll('a');
              menuLinks.forEach(link => {
                link.addEventListener('click', function () {
                  menuButton.classList.remove('active');
                  menuDropdown.classList.remove('active');
                });
              });
            }
          });
        </script>
        <script src="${pageContext.request.contextPath}/assets/app.js" defer></script>
      </body>

      </html>