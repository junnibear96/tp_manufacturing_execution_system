<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/jsp/include/header.jspf" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

        <section class="sec-content">
            <div class="index">
                <div class="sec01">
                    <div class="swiper-container-wrapper swiper-container-wrapper--timeline">
                        <div class="swiper swiper-container swiper-container--timeline">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="title mo-none">
                                        <h2><spring:message code="main.title" arguments="<br class='only-mo'>"/></h2>
                                        <p><spring:message code="main.subtitle"/></p>
                                    </div>
                                    <div class="image mo-none"><img
                                            src="/assets/images/hero_slide_1_vision_1767942773232.png" alt="<spring:message code='main.vision'/>">
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="title mo-none">
                                        <h2><spring:message code="main.apparel.title" arguments="<br class='only-mo'>"/></h2>
                                        <p><b><spring:message code="main.apparel.subtitle"/></b></p>
                                    </div>
                                    <div class="image mo-none"><img
                                            src="/assets/images/hero_slide_2_apparel_1767942790465.png" alt="<spring:message code='main.apparel.alt'/>">
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="title mo-none">
                                        <h2><spring:message code="main.living.title" arguments="<br class='only-mo'>"/></h2>
                                        <p><b><spring:message code="main.living.subtitle"/></b></p>
                                    </div>
                                    <div class="image mo-none"><img
                                            src="/assets/images/hero_slide_3_living_1767942807472.png" alt="<spring:message code='main.living.alt'/>">
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="title mo-none">
                                        <h2><spring:message code="main.food.title" arguments="<br class='only-mo'>"/></h2>
                                        <p><b><spring:message code="main.food.subtitle"/></b></p>
                                    </div>
                                    <div class="image mo-none"><img
                                            src="/assets/images/hero_slide_4_food_1767942833305.png" alt="<spring:message code='main.food.alt'/>"></div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="title mo-none">
                                        <h2><spring:message code="main.workspace.title" arguments="<br class='only-mo'>"/></h2>
                                        <p><b><spring:message code="main.workspace.subtitle"/></b></p>
                                    </div>
                                    <div class="image mo-none"><img
                                            src="/assets/images/hero_slide_5_workspace_1767942851159.png"
                                            alt="<spring:message code='main.workspace.alt'/>">
                                    </div>
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
                        <a href="/login">
                            <div class="main-tit">
                                <h3><spring:message code="main.global.title"/><i>↗</i></h3>
                            </div>
                            <div class="circle">
                                <div class="image"><img src="https://tp-inc.com/images/main_global_bg.jpg" alt=""></div>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="sec04">
                    <div class="sec-tit">
                        <h3><spring:message code="main.esg.title" arguments="<br class='only-mo'>"/></h3>
                    </div>
                    <div class="sec-box">
                        <ul>
                            <li>
                                <a href="/app/company">
                                    <div class="img"><img src="/assets/images/icon_environmental_1767943455654.png"
                                            alt="Environmental"></div>
                                    <div class="tit">
                                        <h4>Environmental</h4>
                                        <p><spring:message code="main.esg.environmental.kor"/></p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/app/company">
                                    <div class="img"><img src="/assets/images/icon_social_1767943474240.png"
                                            alt="Social">
                                    </div>
                                    <div class="tit">
                                        <h4>Social</h4>
                                        <p><spring:message code="main.esg.social.kor"/></p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/app/company">
                                    <div class="img"><img src="/assets/images/icon_ethical_1767943490946.png"
                                            alt="Ethical">
                                    </div>
                                    <div class="tit">
                                        <h4>Ethical</h4>
                                        <p><spring:message code="main.esg.ethical.kor"/></p>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <%@ include file="/WEB-INF/jsp/include/footer.jspf" %>
