<%@ include file="/includes/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Courses - CyberLearn</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0a0e27 0%, #16213e 50%, #0f3460 100%);
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
        }

        /* Animated Background Glow */
        body::before {
            content: '';
            position: fixed;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(0, 150, 255, 0.1) 0%, rgba(0, 100, 200, 0.05) 30%, transparent 70%);
            animation: floatGlow 15s ease-in-out infinite;
            pointer-events: none;
            z-index: 0;
        }

        body::after {
            content: '';
            position: fixed;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(100, 50, 255, 0.1) 0%, rgba(50, 100, 200, 0.05) 30%, transparent 70%);
            animation: floatGlow 20s ease-in-out infinite reverse;
            pointer-events: none;
            z-index: 0;
        }

        @keyframes floatGlow {
            0%, 100% {
                transform: translate(0, 0);
            }
            50% {
                transform: translate(50px, 50px);
            }
        }

        .container {
            position: relative;
            z-index: 1;
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .back-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 12px 24px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: #00d4ff;
            text-decoration: none;
            border-radius: 8px;
            margin-bottom: 30px;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .back-btn:hover {
            background: rgba(0, 212, 255, 0.2);
            border-color: rgba(0, 212, 255, 0.5);
            transform: translateX(-5px);
        }

        h2 {
            font-size: 2.5rem;
            background: linear-gradient(135deg, #00d4ff 0%, #0099ff 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 40px;
            text-align: center;
            font-weight: 700;
        }

        .courses-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 30px;
            margin-bottom: 40px;
        }

        .course-card {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 16px;
            padding: 30px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            animation: float 3s ease-in-out infinite;
        }

        .course-card:nth-child(1) { animation-delay: 0s; }
        .course-card:nth-child(2) { animation-delay: 0.2s; }
        .course-card:nth-child(3) { animation-delay: 0.4s; }
        .course-card:nth-child(4) { animation-delay: 0.6s; }
        .course-card:nth-child(5) { animation-delay: 0.8s; }
        .course-card:nth-child(6) { animation-delay: 1s; }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px);
            }
            50% {
                transform: translateY(-10px);
            }
        }

        .course-card:hover {
            background: rgba(255, 255, 255, 0.12);
            border-color: rgba(0, 212, 255, 0.5);
            transform: translateY(-15px);
            box-shadow: 0 20px 40px rgba(0, 212, 255, 0.2);
        }

        .icon-container {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #00d4ff, #0099ff);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            font-size: 28px;
            color: white;
        }

        .course-card:nth-child(2) .icon-container {
            background: linear-gradient(135deg, #ff006e, #8338ec);
        }

        .course-card:nth-child(3) .icon-container {
            background: linear-gradient(135deg, #06ffa5, #00d4ff);
        }

        .course-card:nth-child(4) .icon-container {
            background: linear-gradient(135deg, #ffbe0b, #fb5607);
        }

        .course-card:nth-child(5) .icon-container {
            background: linear-gradient(135deg, #7209b7, #3a0ca3);
        }

        .course-card:nth-child(6) .icon-container {
            background: linear-gradient(135deg, #f72585, #b5179e);
        }

        .course-title {
            font-size: 1.5rem;
            color: #00d4ff;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .course-description {
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 16px;
        }

        .course-meta {
            display: flex;
            gap: 16px;
            color: rgba(255, 255, 255, 0.6);
            font-size: 0.9rem;
        }

        .meta-item {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .meta-item i {
            color: #00d4ff;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="<%= request.getContextPath() %>/user/dashboard.jsp" class="back-btn">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>

        <h2>Available Courses</h2>

        <div class="courses-grid">
            <!-- Course Card 1 -->
            <div class="course-card">
                <div class="icon-container">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h3 class="course-title">Network Security Fundamentals</h3>
                <p class="course-description">Learn the basics of network security, firewalls, and intrusion detection systems to protect your infrastructure.</p>
                <div class="course-meta">
                    <div class="meta-item">
                        <i class="fas fa-clock"></i>
                        <span>40 hours</span>
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-star"></i>
                        <span>Beginner</span>
                    </div>
                </div>
            </div>

            <!-- Course Card 2 -->
            <div class="course-card">
                <div class="icon-container">
                    <i class="fas fa-code"></i>
                </div>
                <h3 class="course-title">Ethical Hacking Essentials</h3>
                <p class="course-description">Master penetration testing techniques and learn how to identify vulnerabilities in systems ethically.</p>
                <div class="course-meta">
                    <div class="meta-item">
                        <i class="fas fa-clock"></i>
                        <span>50 hours</span>
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-star"></i>
                        <span>Intermediate</span>
                    </div>
                </div>
            </div>

            <!-- Course Card 3 -->
            <div class="course-card">
                <div class="icon-container">
                    <i class="fas fa-lock"></i>
                </div>
                <h3 class="course-title">Cryptography & Encryption</h3>
                <p class="course-description">Understand encryption algorithms, digital certificates, and secure communication protocols in depth.</p>
                <div class="course-meta">
                    <div class="meta-item">
                        <i class="fas fa-clock"></i>
                        <span>35 hours</span>
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-star"></i>
                        <span>Advanced</span>
                    </div>
                </div>
            </div>

            <!-- Course Card 4 -->
            <div class="course-card">
                <div class="icon-container">
                    <i class="fas fa-exclamation-triangle"></i>
                </div>
                <h3 class="course-title">Malware Analysis</h3>
                <p class="course-description">Learn to identify, analyze, and remove malware threats while understanding malicious code behavior.</p>
                <div class="course-meta">
                    <div class="meta-item">
                        <i class="fas fa-clock"></i>
                        <span>45 hours</span>
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-star"></i>
                        <span>Advanced</span>
                    </div>
                </div>
            </div>

            <!-- Course Card 5 -->
            <div class="course-card">
                <div class="icon-container">
                    <i class="fas fa-user-secret"></i>
                </div>
                <h3 class="course-title">Social Engineering & OSINT</h3>
                <p class="course-description">Understand social engineering tactics and open-source intelligence gathering techniques for security awareness.</p>
                <div class="course-meta">
                    <div class="meta-item">
                        <i class="fas fa-clock"></i>
                        <span>25 hours</span>
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-star"></i>
                        <span>Intermediate</span>
                    </div>
                </div>
            </div>

            <!-- Course Card 6 -->
            <div class="course-card">
                <div class="icon-container">
                    <i class="fas fa-server"></i>
                </div>
                <h3 class="course-title">Cloud Security & Compliance</h3>
                <p class="course-description">Secure cloud environments, manage identity and access, and implement compliance frameworks effectively.</p>
                <div class="course-meta">
                    <div class="meta-item">
                        <i class="fas fa-clock"></i>
                        <span>38 hours</span>
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-star"></i>
                        <span>Intermediate</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="/includes/footer.jsp" %>
</body>
</html>