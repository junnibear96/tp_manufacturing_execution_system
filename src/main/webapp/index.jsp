<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
        <meta name="viewport"
            content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
        <meta name="Keywords" content="TP, 티피, TP그룹, 티피그룹, 태평양물산">
        <meta name="Description" content="100년을 향한 새로운 도약. 태평양물산의 새로운 이름, TP 공식 홈페이지입니다.">
        <title>TP - Manufacturing Execution System</title>

        <!-- Local CSS Files -->
        <link rel="stylesheet" href="/assets/css/base.css">
        <link rel="stylesheet" href="/assets/css/common.css">
        <link rel="stylesheet" href="https://tp-inc.com/common/css/swiper.min.css">
        <link rel="stylesheet" href="/assets/css/main.css">
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

        <!-- Custom CSS Fixes for Layout Issues -->
        <style>
            /* Fix Swiper container height bug */
            .swiper-container-wrapper,
            .swiper-container {
                height: 100vh !important;
                max-height: 100vh !important;
            }

            .swiper-wrapper {
                height: 100% !important;
            }

            .swiper-slide {
                height: 100vh !important;
            }

            /* Constrain header positioning */
            #header {
                position: fixed !important;
                top: 0 !important;
                z-index: 1000 !important;
            }

            /* Fix sec-content positioning */
            .sec-content {
                position: relative !important;
                min-height: 100vh !important;
            }

            .sec01 {
                height: 100vh !important;
                width: 100% !important;
            }

            /* Ensure slider is visible and centered */
            .swiper-slide .title {
                position: absolute !important;
                top: 50% !important;
                left: 50% !important;
                transform: translate(-50%, -50%) !important;
                z-index: 10 !important;
                color: #fff !important;
                width: 90% !important;
                max-width: 1600px !important;
                text-align: left !important;
            }

            .swiper-slide .image {
                position: absolute !important;
                top: 0 !important;
                left: 0 !important;
                width: 100% !important;
                height: 100% !important;
                object-fit: cover !important;
            }

            .swiper-slide .image img {
                width: 100% !important;
                height: 100% !important;
                object-fit: cover !important;
            }

            /* Center all major sections */
            .sec03,
            .sec04 {
                margin: 0 auto !important;
                padding-left: 20px !important;
                padding-right: 20px !important;
            }

            /* Fix footer positioning */
            .sec-footer {
                position: relative !important;
                margin-top: 0 !important;
            }

            .sec-footer .inner {
                max-width: 1400px !important;
                margin: 0 auto !important;
                padding: 0 20px !important;
            }

            /* Fallback font */
            body {
                font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "Malgun Gothic", sans-serif !important;
            }

            /* Desktop Header Layout */
            #header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 0 50px;
                background: rgba(0, 0, 0, 0.5);
                backdrop-filter: blur(10px);
            }

            .hd-logo {
                order: 1;
            }

            .hd-menu {
                order: 2;
                flex: 1;
                display: flex;
                justify-content: center;
            }

            .hd-info {
                order: 3;
                display: flex;
                align-items: center;
                gap: 20px;
            }

            /* Desktop Navigation */
            .gnb-wrap {
                display: flex;
            }

            .gnb {
                display: flex;
                gap: 40px;
                list-style: none;
                margin: 0;
                padding: 0;
            }

            .gnb>li {
                position: relative;
            }

            .gnb>li>.menu-toggle {
                color: #fff;
                font-size: 16px;
                font-weight: 500;
                padding: 30px 0;
                display: block;
                transition: all 0.3s;
                text-decoration: none;
                cursor: pointer;
            }

            .gnb>li>.menu-toggle:hover {
                color: #5cb3e6;
            }

            /* Desktop Dropdown Submenu */
            .submenu {
                position: absolute;
                top: 100%;
                left: 50%;
                transform: translateX(-50%);
                background: rgba(0, 0, 0, 0.95);
                padding: 20px;
                min-width: 180px;
                opacity: 0;
                visibility: hidden;
                transition: all 0.3s ease;
                border-radius: 0 0 10px 10px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            }

            .gnb>li:hover .submenu {
                opacity: 1;
                visibility: visible;
            }

            .submenu li {
                list-style: none;
                margin: 0;
                padding: 0;
            }

            .submenu li a {
                color: rgba(255, 255, 255, 0.8);
                font-size: 14px;
                padding: 10px 15px;
                display: block;
                transition: all 0.3s;
                text-decoration: none;
                border-radius: 5px;
            }

            .submenu li a:hover {
                color: #fff;
                background: rgba(255, 255, 255, 0.1);
                padding-left: 20px;
            }

            /* Remove + / - icons on desktop */
            .menu-toggle::after {
                display: none;
            }

            /* Language Switcher Styling */
            .lang {
                display: flex;
                gap: 8px;
                align-items: center;
            }

            .lang a {
                color: rgba(255, 255, 255, 0.7);
                font-size: 14px;
                font-weight: 500;
                text-decoration: none;
                transition: color 0.3s;
                padding: 5px 10px;
            }

            .lang a.on {
                color: #fff;
                font-weight: 600;
            }

            .lang a:hover {
                color: #fff;
            }

            /* Hamburger Menu - Hidden on Desktop */
            .btn_all_menu {
                display: none;
            }

            /* Responsive Mobile Navigation */
            @media (max-width: 960px) {
                #header {
                    padding: 0 20px;
                }

                .btn_all_menu {
                    display: flex !important;
                    flex-direction: column;
                    justify-content: space-around;
                    width: 30px;
                    height: 30px;
                    background: transparent;
                    border: none;
                    cursor: pointer;
                    padding: 0;
                    z-index: 1001;
                    margin-left: 15px;
                }

                .btn_all_menu span {
                    width: 100%;
                    height: 2px;
                    background: #fff;
                    transition: all 0.3s ease;
                    display: block;
                }

                .btn_all_menu.active span:nth-child(1) {
                    transform: translateY(8px) rotate(45deg);
                }

                .btn_all_menu.active span:nth-child(2) {
                    opacity: 0;
                }

                .btn_all_menu.active span:nth-child(3) {
                    transform: translateY(-8px) rotate(-45deg);
                }

                .hd-menu {
                    position: fixed;
                    top: 0;
                    right: -100%;
                    width: 280px;
                    height: 100vh;
                    background: rgba(0, 0, 0, 0.95);
                    transition: right 0.3s ease;
                    z-index: 999;
                    padding-top: 80px;
                    overflow-y: auto;
                    visibility: hidden;
                }

                /* Higher specificity to override common.css */
                #header .hd-menu.active {
                    right: 0 !important;
                    visibility: visible !important;
                    opacity: 1 !important;
                }

                .hd-menu .gnb-wrap {
                    width: 100%;
                }

                .hd-menu .gnb {
                    flex-direction: column;
                    gap: 0;
                    padding: 20px;
                }

                .hd-menu .gnb li {
                    width: 100%;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
                    position: relative;
                }

                .hd-menu .gnb li .menu-toggle {
                    padding: 15px 0;
                    font-size: 16px;
                }

                /* Mobile Submenu Styles */
                .submenu {
                    position: static;
                    transform: none;
                    display: none;
                    padding-left: 20px;
                    background: rgba(0, 0, 0, 0.3);
                    margin-top: 10px;
                    border-radius: 5px;
                    opacity: 1;
                    visibility: visible;
                    box-shadow: none;
                    min-width: auto;
                }

                .submenu.active {
                    display: block;
                }

                .submenu li {
                    border-bottom: none !important;
                }

                .submenu li a {
                    font-size: 14px !important;
                    padding: 12px 15px !important;
                    color: rgba(255, 255, 255, 0.8) !important;
                }

                .submenu li a:hover {
                    color: #fff !important;
                    padding-left: 20px !important;
                }

                /* Show + / - on mobile */
                .menu-toggle::after {
                    display: inline-block;
                    content: '+';
                    font-size: 20px;
                    font-weight: 300;
                    float: right;
                    transition: transform 0.3s ease;
                }

                .menu-toggle.active::after {
                    content: '−';
                }

                .hd-logo {
                    z-index: 1001;
                }
            }
        </style>

        <script src="https://tp-inc.com/common/js/jquery-1.11.2.min.js"></script>
        <script src="https://tp-inc.com/common/js/jquery.easing.1.3.js"></script>
        <script src="https://tp-inc.com/common/js/swiper.min.js"></script>
        <script src="https://tp-inc.com/common/js/common.js?ver=240604"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollTrigger.min.js"></script>
        <script src="https://unpkg.com/@studio-freight/lenis@1.0.33/dist/lenis.min.js"></script>
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.5/ScrollMagic.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.5/plugins/animation.gsap.min.js"></script>
    </head>

    <body>
        <div class="wrap main">
            <section class="sec-wrap">
                <section class="sec-header">
                    <header id="header" class="up">
                        <h1 class="hd-logo"><a href="/"><span class="hide">TP</span></a></h1>
                        <div class="hd-menu">
                            <nav class="gnb-wrap">
                                <ul class="gnb">
                                    <li class="has-submenu">
                                        <a href="#" class="menu-toggle">TP 소개</a>
                                        <ul class="submenu">
                                            <li><a href="/company/ceo">CEO 인사말</a></li>
                                            <li><a href="/company/history">연혁</a></li>
                                            <li><a href="/company/mission">미션·비전</a></li>
                                            <li><a href="/company/ci">CI</a></li>
                                            <li><a href="/company/affiliates">계열사</a></li>
                                            <li><a href="/company/global">글로벌 사업장</a></li>
                                        </ul>
                                    </li>
                                    <li class="has-submenu">
                                        <a href="#" class="menu-toggle">사업부문</a>
                                        <ul class="submenu">
                                            <li><a href="/business/apparel">의류 사업</a></li>
                                            <li><a href="/business/insulation">인슐레이션 사업</a></li>
                                            <li><a href="/business/fashion">패션브랜드 사업</a></li>
                                            <li><a href="/business/realestate">부동산 사업</a></li>
                                        </ul>
                                    </li>
                                    <li class="has-submenu">
                                        <a href="#" class="menu-toggle">지속가능경영</a>
                                        <ul class="submenu">
                                            <li><a href="/sustainability/environment">환경경영</a></li>
                                            <li><a href="/sustainability/social">사회적 책임</a></li>
                                            <li><a href="/sustainability/ethics">윤리경영</a></li>
                                        </ul>
                                    </li>
                                    <li class="has-submenu">
                                        <a href="#" class="menu-toggle">투자정보</a>
                                        <ul class="submenu">
                                            <li><a href="/investor/financial">재무정보</a></li>
                                            <li><a href="/investor/disclosure">공시·공고</a></li>
                                        </ul>
                                    </li>
                                    <li class="has-submenu">
                                        <a href="#" class="menu-toggle">미디어</a>
                                        <ul class="submenu">
                                            <li><a href="/media/news">회사소식</a></li>
                                            <li><a href="/media/press">언론보도</a></li>
                                        </ul>
                                    </li>
                                    <li class="has-submenu">
                                        <a href="#" class="menu-toggle">채용</a>
                                        <ul class="submenu">
                                            <li><a href="/careers/talent">인재상</a></li>
                                            <li><a href="/careers/culture">TP 문화</a></li>
                                            <li><a href="/careers/jobs">채용공고</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="hd-info">
                            <div class="lang">
                                <a href="#" class="on">KOR</a>
                                <a href="#">ENG</a>
                            </div>
                            <button class="btn_all_menu" id="hamburger" aria-label="Toggle menu">
                                <span></span>
                                <span></span>
                                <span></span>
                            </button>
                        </div>
                    </header>
                </section>
                <section class="sec-content">
                    <div class="index">
                        <div class="sec01">
                            <div class="swiper-container-wrapper swiper-container-wrapper--timeline">
                                <div class="swiper swiper-container swiper-container--timeline">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            <div class="title mo-none">
                                                <h2>TP<small>,</small> 100년을 향한 <br class="only-mo">새로운 도약</h2>
                                                <p>Your Trusted Partner <b>TP</b></p>
                                            </div>
                                            <div class="image mo-none"><img
                                                    src="/assets/images/hero_slide_1_vision_1767942773232.png"
                                                    alt="TP 비전"></div>
                                        </div>
                                        <div class="swiper-slide">
                                            <div class="title mo-none">
                                                <h2>국내 브랜드 만족도 <br class="only-mo">No.1 의류 기업</h2>
                                                <p><b>TP Nadia / EO</b></p>
                                            </div>
                                            <div class="image mo-none"><img
                                                    src="/assets/images/hero_slide_2_apparel_1767942790465.png"
                                                    alt="TP 의류"></div>
                                        </div>
                                        <div class="swiper-slide">
                                            <div class="title mo-none">
                                                <h2>업계 1위 <br class="only-mo">프리미엄 라이프스타일 크리에이터</h2>
                                                <p><b>TP Living</b></p>
                                            </div>
                                            <div class="image mo-none"><img
                                                    src="/assets/images/hero_slide_3_living_1767942807472.png"
                                                    alt="TP 리빙"></div>
                                        </div>
                                        <div class="swiper-slide">
                                            <div class="title mo-none">
                                                <h2>안전한 먹거리, <br class="only-mo">건강한 삶</h2>
                                                <p><b>TP F&B</b></p>
                                            </div>
                                            <div class="image mo-none"><img
                                                    src="/assets/images/hero_slide_4_food_1767942833305.png"
                                                    alt="TP F&B"></div>
                                        </div>
                                        <div class="swiper-slide">
                                            <div class="title mo-none">
                                                <h2>Work-life balance의 <br class="only-mo">공간과 문화를 창조하는 기업</h2>
                                                <p><b>TP Square</b></p>
                                            </div>
                                            <div class="image mo-none"><img
                                                    src="/assets/images/hero_slide_5_workspace_1767942851159.png"
                                                    alt="TP Square"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-timeline">
                                    <div class="swiper-timeline-progress"><span></span></div>
                                </div>
                                <div class="swiper-pagination swiper-pagination--timeline"></div>
                            </div>
                        </div>

                        <div class="pin02">
                            <div class="sec03">
                                <a href="/app/portfolio">
                                    <div class="main-tit">
                                        <h3>글로벌 사업장<i>↗</i></h3>
                                    </div>
                                    <div class="circle">
                                        <div class="image"><img src="https://tp-inc.com/images/main_global_bg.jpg"
                                                alt=""></div>
                                    </div>
                                </a>
                            </div>
                        </div>

                        <div class="sec04">
                            <div class="sec-tit">
                                <h3>더 나은 환경을 만들고 인류에 기여하는 <br class="only-mo">Trusted Partner, TP</h3>
                            </div>
                            <div class="sec-box">
                                <ul>
                                    <li>
                                        <a href="/app/company">
                                            <div class="img"><img
                                                    src="/assets/images/icon_environmental_1767943455654.png"
                                                    alt="Environmental"></div>
                                            <div class="tit">
                                                <h4>Environmental</h4>
                                                <p>환경</p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/app/company">
                                            <div class="img"><img src="/assets/images/icon_social_1767943474240.png"
                                                    alt="Social"></div>
                                            <div class="tit">
                                                <h4>Social</h4>
                                                <p>사회</p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/app/company">
                                            <div class="img"><img src="/assets/images/icon_ethical_1767943490946.png"
                                                    alt="Ethical"></div>
                                            <div class="tit">
                                                <h4>Ethical</h4>
                                                <p>윤리</p>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="sec-footer">
                    <div class="inner">
                        <div class="ft-btm">
                            <div class="ft-logo"><a href="/"></a></div>
                            <div class="ft-info">
                                <p>서울특별시 구로구 디지털로31길12 (구로동, TP타워) <br>
                                    COPYRIGHT © 1972-<%= java.time.Year.now().getValue() %> TP Inc. ALL RIGHTS RESERVED.
                                </p>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
        </div>

        <script>
            // Initialize Swiper when DOM is ready
            $(document).ready(function () {
                var timelineSwiper = new Swiper('.swiper-container--timeline', {
                    direction: 'vertical',
                    loop: false,
                    speed: 1600,
                    pagination: {
                        el: '.swiper-pagination--timeline',
                        clickable: true,
                        renderBullet: function (index, className) {
                            var labels = ['TP', 'TP Nadia/EO', 'TP Living', 'TP F&B', 'TP Square'];
                            return '<span class="' + className + '">' + labels[index] + '</span>';
                        },
                    },
                    autoplay: {
                        delay: 4000,
                        disableOnInteraction: false,
                    },
                    on: {
                        slideChange: function () {
                            var progress = ((this.activeIndex + 1) / this.slides.length) * 100;
                            $('.swiper-timeline-progress span').css('height', progress + '%');
                        }
                    }
                });

                // Initialize AOS
                if (typeof AOS !== 'undefined') {
                    AOS.init({
                        duration: 1200,
                        once: false
                    });
                }

                // Hamburger Menu Toggle (Mobile Only)
                $('#hamburger').on('click', function () {
                    $(this).toggleClass('active');
                    $('.hd-menu').toggleClass('active');
                });

                // Submenu Toggle (Mobile Only)
                if ($(window).width() <= 960) {
                    $('.menu-toggle').on('click', function (e) {
                        e.preventDefault();
                        const $this = $(this);
                        const $submenu = $this.next('.submenu');

                        // Toggle current submenu
                        $this.toggleClass('active');
                        $submenu.toggleClass('active');

                        // Close other submenus (accordion style)
                        $('.menu-toggle').not($this).removeClass('active');
                        $('.submenu').not($submenu).removeClass('active');
                    });

                    // Close menu when clicking on a submenu link
                    $('.submenu a').on('click', function () {
                        $('#hamburger').removeClass('active');
                        $('.hd-menu').removeClass('active');
                        $('.menu-toggle').removeClass('active');
                        $('.submenu').removeClass('active');
                    });
                }

                // Close menu when clicking outside
                $(document).on('click', function (e) {
                    if (!$(e.target).closest('#header').length) {
                        $('#hamburger').removeClass('active');
                        $('.hd-menu').removeClass('active');
                    }
                });

                // Re-bind on window resize
                $(window).on('resize', function () {
                    if ($(window).width() > 960) {
                        $('#hamburger').removeClass('active');
                        $('.hd-menu').removeClass('active');
                        $('.menu-toggle').removeClass('active');
                        $('.submenu').removeClass('active');
                    }
                });

                // Hide pagination when scrolling down (like tp-inc.com)
                $(window).on('scroll', function () {
                    const scrollTop = $(window).scrollTop();
                    const heroHeight = $('.swiper-container-wrapper--timeline').height();

                    if (scrollTop > heroHeight * 0.3) {
                        // Hide pagination when scrolled 30% past hero
                        $('.swiper-timeline').fadeOut(300);
                        $('.swiper-pagination--timeline').fadeOut(300);
                    } else {
                        // Show pagination when at top
                        $('.swiper-timeline').fadeIn(300);
                        $('.swiper-pagination--timeline').fadeIn(300);
                    }
                });
            });
        </script>
    </body>

    </html>