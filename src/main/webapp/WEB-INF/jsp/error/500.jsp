<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>500 - 서버 오류</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }

            .error-container {
                background: white;
                border-radius: 20px;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
                max-width: 700px;
                width: 100%;
                padding: 60px 40px;
                text-align: center;
                animation: slideUp 0.5s ease-out;
            }

            @keyframes slideUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .error-code {
                font-size: 120px;
                font-weight: 900;
                background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                margin-bottom: 20px;
                line-height: 1;
            }

            .error-icon {
                font-size: 80px;
                margin-bottom: 20px;
            }

            .error-title {
                font-size: 32px;
                color: #2d3748;
                margin-bottom: 15px;
                font-weight: 700;
            }

            .error-message {
                font-size: 18px;
                color: #718096;
                margin-bottom: 40px;
                line-height: 1.6;
            }

            .error-actions {
                display: flex;
                gap: 15px;
                justify-content: center;
                flex-wrap: wrap;
            }

            .btn {
                padding: 14px 32px;
                border-radius: 10px;
                text-decoration: none;
                font-weight: 600;
                font-size: 16px;
                transition: all 0.3s ease;
                display: inline-block;
            }

            .btn-primary {
                background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
                color: white;
                box-shadow: 0 4px 15px rgba(245, 87, 108, 0.4);
            }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(245, 87, 108, 0.6);
            }

            .btn-secondary {
                background: #e2e8f0;
                color: #2d3748;
            }

            .btn-secondary:hover {
                background: #cbd5e0;
                transform: translateY(-2px);
            }

            .error-details {
                margin-top: 30px;
                padding: 20px;
                background: #fff5f5;
                border-radius: 10px;
                border-left: 4px solid #f5576c;
            }

            .error-details summary {
                cursor: pointer;
                font-weight: 600;
                color: #2d3748;
                padding: 10px;
            }

            .error-details p {
                margin-top: 10px;
                color: #718096;
                font-size: 13px;
                text-align: left;
                padding: 10px;
                font-family: 'Courier New', monospace;
                background: white;
                border-radius: 5px;
                max-height: 300px;
                overflow-y: auto;
            }

            @media (max-width: 768px) {
                .error-code {
                    font-size: 80px;
                }

                .error-title {
                    font-size: 24px;
                }

                .error-message {
                    font-size: 16px;
                }

                .error-container {
                    padding: 40px 20px;
                }
            }
        </style>
    </head>

    <body>
        <div class="error-container">
            <div class="error-icon">⚠️</div>
            <div class="error-code">500</div>
            <h1 class="error-title">서버 내부 오류</h1>
            <p class="error-message">
                죄송합니다. 서버에서 예기치 않은 오류가 발생했습니다.<br>
                문제가 지속되면 관리자에게 문의해주세요.
            </p>

            <div class="error-actions">
                <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-primary">
                    🏠 홈으로 돌아가기
                </a>
                <a href="javascript:location.reload()" class="btn btn-secondary">
                    🔄 새로고침
                </a>
            </div>

            <details class="error-details">
                <summary>⚙️ 기술 정보 (개발자용)</summary>
                <p>
                    <strong>요청 URI:</strong>
                    <%= request.getAttribute("javax.servlet.error.request_uri") %><br>
                        <strong>상태 코드:</strong>
                        <%= response.getStatus() %><br>
                            <% Exception exception=(Exception) request.getAttribute("javax.servlet.error.exception"); if
                                (exception !=null) { %>
                                <strong>예외 타입:</strong>
                                <%= exception.getClass().getName() %><br>
                                    <strong>메시지:</strong>
                                    <%= exception.getMessage() !=null ? exception.getMessage() : "N/A" %>
                                        <% } %>
                </p>
            </details>
        </div>
    </body>

    </html>