<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/jsp/include/header.jspf" %>

        <style>
            /* Cover Letter Page Styles */
            .cover-letter-page {
                background: #f5f7fa;
                min-height: 100vh;
                padding-top: 100px;
            }

            .cl-hero {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 80px 20px;
                text-align: center;
            }

            .cl-hero h1 {
                font-size: 48px;
                margin-bottom: 10px;
                font-weight: 700;
            }

            .cl-hero .subtitle {
                font-size: 24px;
                opacity: 0.9;
                margin-bottom: 30px;
            }

            .cl-hero .contact-info {
                display: flex;
                justify-content: center;
                gap: 30px;
                flex-wrap: wrap;
                margin-top: 20px;
            }

            .cl-hero .contact-info a {
                color: white;
                text-decoration: none;
                font-size: 16px;
                transition: opacity 0.3s;
            }

            .cl-hero .contact-info a:hover {
                opacity: 0.8;
            }

            .cl-container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 60px 20px;
            }

            .cl-section {
                background: white;
                border-radius: 20px;
                padding: 40px;
                margin-bottom: 30px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            }

            .cl-section h2 {
                font-size: 32px;
                margin-bottom: 30px;
                color: #2d3748;
                border-bottom: 3px solid #667eea;
                padding-bottom: 15px;
            }

            .summary-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
                margin-top: 20px;
            }

            .summary-card {
                background: #f7fafc;
                padding: 20px;
                border-radius: 10px;
                border-left: 4px solid #667eea;
            }

            .summary-card h3 {
                font-size: 18px;
                color: #667eea;
                margin-bottom: 10px;
            }

            .summary-card p {
                color: #4a5568;
                line-height: 1.6;
            }

            .timeline {
                position: relative;
                padding-left: 40px;
            }

            .timeline::before {
                content: '';
                position: absolute;
                left: 0;
                top: 0;
                bottom: 0;
                width: 2px;
                background: #cbd5e0;
            }

            .timeline-item {
                position: relative;
                margin-bottom: 40px;
            }

            .timeline-item::before {
                content: '';
                position: absolute;
                left: -46px;
                top: 0;
                width: 12px;
                height: 12px;
                border-radius: 50%;
                background: #667eea;
                border: 3px solid white;
                box-shadow: 0 0 0 3px #667eea;
            }

            .timeline-item h3 {
                font-size: 22px;
                color: #2d3748;
                margin-bottom: 5px;
            }

            .timeline-item .period {
                color: #718096;
                font-size: 14px;
                margin-bottom: 10px;
            }

            .timeline-item .company {
                font-weight: 600;
                color: #667eea;
                margin-bottom: 15px;
            }

            .timeline-item .description {
                color: #4a5568;
                line-height: 1.8;
                margin-bottom: 15px;
            }

            .timeline-item .project {
                background: #f7fafc;
                padding: 15px;
                border-radius: 8px;
                margin-top: 10px;
                border-left: 3px solid #667eea;
            }

            .timeline-item .project h4 {
                color: #667eea;
                font-size: 16px;
                margin-bottom: 8px;
            }

            .timeline-item .project p {
                color: #4a5568;
                font-size: 14px;
                line-height: 1.6;
            }

            .skills-grid {
                display: flex;
                flex-wrap: wrap;
                gap: 12px;
            }

            .skill-tag {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 10px 20px;
                border-radius: 25px;
                font-size: 14px;
                font-weight: 500;
                transition: transform 0.3s;
            }

            .skill-tag:hover {
                transform: translateY(-3px);
            }

            .cover-letter-text {
                color: #2d3748;
                line-height: 2;
                font-size: 16px;
            }

            .cover-letter-text p {
                margin-bottom: 20px;
                text-indent: 2em;
            }

            .education-grid {
                display: grid;
                gap: 20px;
            }

            .education-item {
                background: #f7fafc;
                padding: 20px;
                border-radius: 10px;
                border-left: 4px solid #667eea;
            }

            .education-item h3 {
                font-size: 20px;
                color: #2d3748;
                margin-bottom: 5px;
            }

            .education-item .period {
                color: #718096;
                font-size: 14px;
                margin-bottom: 10px;
            }

            .education-item .details {
                color: #4a5568;
            }

            @media (max-width: 768px) {
                .cl-hero h1 {
                    font-size: 32px;
                }

                .cl-hero .subtitle {
                    font-size: 18px;
                }

                .cl-section {
                    padding: 25px;
                }

                .cl-section h2 {
                    font-size: 24px;
                }

                .timeline {
                    padding-left: 30px;
                }

                .summary-grid {
                    grid-template-columns: 1fr;
                }
            }
        </style>

        <section class="sec-content cover-letter-page">
            <!-- Hero Section -->
            <div class="cl-hero" data-aos="fade-down">
                <h1>최준석</h1>
                <div class="subtitle">Backend Developer</div>
                <div class="contact-info">
                    <a href="mailto:junseok4545@gmail.com">📧 junseok4545@gmail.com</a>
                    <a href="tel:010-3602-4397">📱 010-3602-4397</a>
                    <a href="https://github.com/junnibear96" target="_blank">💻 GitHub</a>
                </div>
            </div>

            <div class="cl-container">
                <!-- Summary Section -->
                <div class="cl-section" data-aos="fade-up">
                    <h2>Profile Summary</h2>
                    <div class="summary-grid">
                        <div class="summary-card">
                            <h3>Experience</h3>
                            <p>총 5년 4개월<br />현재 재직 중</p>
                        </div>
                        <div class="summary-card">
                            <h3>Education</h3>
                            <p>서울사이버대학교<br />컴퓨터공학과 졸업 (3.86/4.5)</p>
                        </div>
                        <div class="summary-card">
                            <h3>Languages</h3>
                            <p>TOEFL iBT 91점<br />영어 회화 원어민 수준</p>
                        </div>
                        <div class="summary-card">
                            <h3>Military Service</h3>
                            <p>육군 병장 제대<br />2018.01 ~ 2019.09</p>
                        </div>
                    </div>
                </div>

                <!-- Education Section -->
                <div class="cl-section" data-aos="fade-up">
                    <h2>Education</h2>
                    <div class="education-grid">
                        <div class="education-item">
                            <h3>서울사이버대학교</h3>
                            <div class="period">2020.06 ~ 2022.12 졸업</div>
                            <div class="details">컴퓨터공학과 | 학점 3.86 / 4.5</div>
                        </div>
                        <div class="education-item">
                            <h3>University of Colorado - Boulder</h3>
                            <div class="period">2015.09 ~ 2017.06 휴학</div>
                            <div class="details">공학과 (편입)</div>
                        </div>
                        <div class="education-item">
                            <h3>Langley High School</h3>
                            <div class="period">2015 졸업</div>
                            <div class="details">버지니아주 현지 고등학교</div>
                        </div>
                    </div>
                </div>

                <!-- Work Experience Section -->
                <div class="cl-section" data-aos="fade-up">
                    <h2>Work Experience</h2>
                    <div class="timeline">
                        <div class="timeline-item">
                            <h3>대리 - 웹개발팀</h3>
                            <div class="period">2022.12 ~ 현재 재직 중</div>
                            <div class="company">주식회사 소프트리프</div>

                            <div class="project">
                                <h4>Atomy Ticket (글로벌 세미나·이벤트 서비스)</h4>
                                <p>Java Spring 기반 메인 서비스 개발 및 유지보수를 담당하였으며, Atomy Shoppingmall 및 Atomy Community와의 SSO
                                    연동 작업을 수행하였습니다. 다국어(i18n) 환경을 고려한 서비스 구조를 적용하였고, FCM·APNS 및 AWS SNS 기반 앱 푸시 알림 연동을
                                    통해 사용자 알림 기능을 구현하였습니다. 또한 SQL Injection 대응 등 보안 강화 작업과 SLO 기준의 서비스 안정화 작업을 수행하였습니다.
                                </p>
                            </div>

                            <div class="project">
                                <h4>Atomy Business College (교육 콘텐츠 플랫폼)</h4>
                                <p>Spring Boot 및 JPA 기반으로 교육 플랫폼 전반의 개발과 유지보수를 담당하였으며, 강의 콘텐츠 및 사용자 학습 이력 관리 로직을
                                    구현하였습니다. Redis 캐시 처리에 Jedis를 적용하여 운영하였으나 성능 이슈를 개선하기 위해 Lettuce로 전환하여 처리 안정성과 응답 성능을
                                    개선하였습니다.</p>
                            </div>

                            <div class="project">
                                <h4>Atomy Masstige (콘텐츠·제품 정보 서비스)</h4>
                                <p>Spring Boot와 JPA를 활용하여 콘텐츠 중심 서비스의 기능 개발 및 유지보수를 수행하였으며, Redis 캐시 구조에서 Jedis 사용 중 성능
                                    병목을 확인하고 Lettuce로 전환하여 서비스 안정성을 향상시켰습니다.</p>
                            </div>

                            <div class="project">
                                <h4>Atomy Global (글로벌 기업 포털 사이트)</h4>
                                <p>전자정부프레임워크 기반 글로벌 기업 사이트의 유지보수를 담당하였으며, 다국어·다지역 서비스 환경에서 보안(SQL Injection 대응) 및 SLO
                                    기준의 운영 안정화 작업을 수행하였습니다.</p>
                            </div>
                        </div>

                        <div class="timeline-item">
                            <h3>주임 - 서비스 개발팀</h3>
                            <div class="period">2020.11 ~ 2022.07 (1년 9개월)</div>
                            <div class="company">(주)시소아이티</div>

                            <div class="project">
                                <h4>G Suite Link (Google Workspace for Education 연계 솔루션)</h4>
                                <p>대학 학사 시스템과 Google Workspace for Education 간 API 연동을 통해 교수·학생·직원 계정의 자동 동기화 및 권한 관리를
                                    구현하였으며, 연동 로직 유지보수와 운영 안정화를 위한 장애 대응을 수행하였습니다.</p>
                            </div>

                            <div class="project">
                                <h4>G Class (구글 기반 학습관리시스템)</h4>
                                <p>Spring Boot 기반으로 구글 클래스룸 및 Google Workspace 앱과의 API 연동 기능을 개발하고, 수업 및 출결 관리 기능의 유지보수와
                                    고객사 요구사항에 따른 기능 개선을 담당하였습니다.</p>
                            </div>

                            <div class="project">
                                <h4>기록관리시스템</h4>
                                <p>MyBatis를 사용한 동기화 관리 및 사용자들이 다운로드 내역을 확인하는 화면을 관리하는 프로그램과 SpringBoot(JPA) 기반인 구글 클래스룸의
                                    수업과 유튜브 영상을 다운로드하는 배치 프로그램으로 이루어졌습니다. 시스템 구성은 Docker 구조되어 있었습니다.</p>
                            </div>
                        </div>

                        <div class="timeline-item">
                            <h3>인턴 - 서비스 개발팀</h3>
                            <div class="period">2019.10 ~ 2020.03 (6개월)</div>
                            <div class="company">시소아이티</div>
                            <div class="description">
                                파워포인트, 엑셀, 워드와 구글 드라이브, 구글 문서 도구 모두 이용하여 해외 영업 문서 작업을 하였습니다. Python과 tensorflow를 이용해서
                                챗봇을 만들었습니다. 챗봇 강의자료 준비해서 대학교에 가서 강의했습니다. 구글 인증 교육자 자격증 1급, 2급 취득하였습니다.
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Technical Skills Section -->
                <div class="cl-section" data-aos="fade-up">
                    <h2>Technical Skills</h2>
                    <div class="skills-grid">
                        <span class="skill-tag">JAVA</span>
                        <span class="skill-tag">Spring Framework</span>
                        <span class="skill-tag">Spring Boot</span>
                        <span class="skill-tag">JPA</span>
                        <span class="skill-tag">MyBatis</span>
                        <span class="skill-tag">Javascript</span>
                        <span class="skill-tag">JSP</span>
                        <span class="skill-tag">React</span>
                        <span class="skill-tag">Node.js</span>
                        <span class="skill-tag">Jquery</span>
                        <span class="skill-tag">MySQL</span>
                        <span class="skill-tag">Oracle</span>
                        <span class="skill-tag">Redis</span>
                        <span class="skill-tag">SQL</span>
                        <span class="skill-tag">DBMS</span>
                        <span class="skill-tag">Docker</span>
                        <span class="skill-tag">Git</span>
                        <span class="skill-tag">CI/CD</span>
                        <span class="skill-tag">GCP</span>
                        <span class="skill-tag">Vercel</span>
                        <span class="skill-tag">Python</span>
                        <span class="skill-tag">RPA</span>
                    </div>
                </div>

                <!-- Cover Letter Section -->
                <div class="cl-section" data-aos="fade-up">
                    <h2>자기소개서</h2>
                    <div class="cover-letter-text">
                        <p>안녕하세요 최준석입니다. 잘 부탁드립니다.</p>

                        <p>저는 기능을 만드는 개발자보다, 서비스를 끝까지 책임지는 개발자가 되고 싶어 이 일을 선택했습니다. 단순히 "개발했다"에서 끝나는 것이 아니라, 실제 사용자가 쓰고
                            문제가 생겼을 때 어떻게 더 안정적으로 만들 수 있을지를 고민해 왔습니다.</p>

                        <p>초기에는 Google Workspace 기반 교육 솔루션 개발에 참여하며 웹 개발의 기본과 운영의 중요성을 배웠습니다. 서버 구축, 배포 환경 구성, 데이터
                            마이그레이션까지 직접 경험하며 "돌아가는 코드"보다 "오래 운영될 수 있는 구조"가 얼마나 중요한지 체감했습니다. 이후 Atomy Ticket, Business
                            College, Global 사이트 등 글로벌 서비스를 담당하며 SSO 연동, 다국어 처리, 보안 대응, 앱 푸시 연동까지 폭넓은 업무를 맡았습니다.</p>

                        <p>특히 Atomy Ticket 프로젝트에서는 쇼핑몰·커뮤니티와의 SSO 연동, FCM·APNS 및 AWS SNS 기반 푸시 알림을 직접 구현하며 사용자 접근성과 운영
                            효율을 함께 개선했습니다. 또한 SQL Injection 대응과 공통 보안 로직 적용을 통해 서비스 운영 기간 동안 안정성을 유지하는 데 기여했습니다. 이런 경험을
                            통해 개발자는 단순히 기능을 구현하는 사람이 아니라, 서비스 신뢰도를 만들어가는 역할이라는 생각을 갖게 되었습니다.</p>

                        <p>저의 강점은 새로운 환경에서도 빠르게 적응하고, 맡은 영역을 끝까지 책임지려는 태도입니다. 미국 스미스소니언 자연사 박물관에서의 인턴 경험과 다양한 글로벌 협업을
                            통해, 기술뿐 아니라 사람과의 소통 역시 서비스 품질의 일부라는 점을 배웠습니다.</p>

                        <p>앞으로도 저는 화려한 기술보다 필요한 기술을 제대로 쓰는 개발자, 그리고 혼자 잘하는 개발자가 아니라 팀과 서비스에 신뢰를 주는 개발자로 성장하고 싶습니다. 맡은
                            서비스가 안정적으로 운영될 수 있도록 고민하고 행동하는 개발자가 되겠습니다.</p>
                    </div>
                </div>

                <!-- Certifications & Languages -->
                <div class="cl-section" data-aos="fade-up">
                    <h2>Certifications & Languages</h2>
                    <div class="education-grid">
                        <div class="education-item">
                            <h3>자격증</h3>
                            <div class="details">
                                • SQL 개발자 (한국데이터산업진흥원, 2024.12)<br />
                                • 정보처리기사 필기 합격<br />
                                • 2종보통운전면허 (2019.11)<br />
                                • 구글 인증 교육자 1급, 2급
                            </div>
                        </div>
                        <div class="education-item">
                            <h3>어학</h3>
                            <div class="details">
                                • TOEFL iBT 91점 (2020.03)<br />
                                • IELTS 7점 (2019.11)<br />
                                • OPIc AL (2017.06)<br />
                                • TOEIC 925점 (2017.06)<br />
                                • 회화 능력: 원어민 수준
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Portfolio Links -->
                <div class="cl-section" data-aos="fade-up">
                    <h2>Portfolio</h2>
                    <div class="description">
                        <p style="margin-bottom: 10px;">
                            <a href="https://github.com/junnibear96/lotto_number_maker" target="_blank"
                                style="color: #667eea; text-decoration: none;">
                                🔗 Lotto Number Maker
                            </a>
                        </p>
                        <p style="margin-bottom: 10px;">
                            <a href="https://github.com/junnibear96/dividend_planner" target="_blank"
                                style="color: #667eea; text-decoration: none;">
                                🔗 Dividend Planner
                            </a>
                        </p>
                        <p>
                            <a href="https://github.com/junnibear96/donationRPA" target="_blank"
                                style="color: #667eea; text-decoration: none;">
                                🔗 Donation RPA
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <%@ include file="/WEB-INF/jsp/include/footer.jspf" %>