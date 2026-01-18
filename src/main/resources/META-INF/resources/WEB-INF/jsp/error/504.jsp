<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>504 - 게이트웨이 시간 초과</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
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
                max-width: 600px;
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
                background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                margin-bottom: 20px;
                line-height: 1;
            }

            .error-icon {
                font-size: 80px;
                margin-bottom: 20px;
                animation: pulse 2s ease-in-out infinite;
            }

            @keyframes pulse {

                0%,
                100% {
                    transform: scale(1);
                }

                50% {
                    transform: scale(1.1);
                }
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
                background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
                color: white;
                box-shadow: 0 4px 15px rgba(250, 112, 154, 0.4);
            }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(250, 112, 154, 0.6);
            }

            .btn-secondary {
                background: #e2e8f0;
                color: #2d3748;
            }

            .btn-secondary:hover {
                background: #cbd5e0;
                transform: translateY(-2px);
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
            <div class="error-icon">⏱️</div>
            <div class="error-code">504</div>
            <h1 class="error-title">게이트웨이 시간 초과</h1>
            <p class="error-message">
                서버가 응답하는 데 너무 오랜 시간이 걸렸습니다.<br>
                잠시 후 다시 시도하거나 페이지를 새로고침해주세요.
            </p>

            <div class="error-actions">
                <a href="javascript:location.reload()" class="btn btn-primary">
                    🔄 새로고침
                </a>
                <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary">
                    🏠 홈으로
                </a>
            </div>
        </div>
    </body>

    </html>