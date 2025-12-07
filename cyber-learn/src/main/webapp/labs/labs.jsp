<%@ include file="/includes/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Practice Labs - CyberLearn</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
            color: #e0e0e0;
        }

        /* Animated background glow */
        body::before {
            content: '';
            position: fixed;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(100, 200, 255, 0.15) 0%, transparent 70%);
            animation: floatGlow 15s ease-in-out infinite;
            pointer-events: none;
            z-index: 0;
        }

        body::after {
            content: '';
            position: fixed;
            bottom: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255, 100, 200, 0.1) 0%, transparent 70%);
            animation: floatGlow 20s ease-in-out infinite reverse;
            pointer-events: none;
            z-index: 0;
        }

        @keyframes floatGlow {
            0%, 100% {
                transform: translate(0, 0);
            }
            50% {
                transform: translate(30px, 30px);
            }
        }

        .container {
            position: relative;
            z-index: 1;
            max-width: 1200px;
            margin: 0 auto;
            padding: 60px 20px;
        }

        h2 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            background: linear-gradient(135deg, #64c8ff, #ff64c8);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-weight: 700;
            text-shadow: 0 0 30px rgba(100, 200, 255, 0.3);
        }

        .subtitle {
            font-size: 1.1rem;
            color: #b0b0b0;
            margin-bottom: 50px;
            text-align: center;
        }

        .labs-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }

        .lab-card {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 15px;
            padding: 30px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            cursor: pointer;
        }

        .lab-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transition: left 0.5s ease;
        }

        .lab-card:hover::before {
            left: 100%;
        }

        .lab-card:hover {
            transform: translateY(-10px) scale(1.02);
            background: rgba(100, 200, 255, 0.15);
            border-color: rgba(100, 200, 255, 0.4);
            box-shadow: 0 10px 40px rgba(100, 200, 255, 0.2), 0 0 20px rgba(100, 200, 255, 0.1);
        }

        .lab-icon {
            font-size: 3rem;
            color: #64c8ff;
            margin-bottom: 20px;
            display: inline-block;
            animation: float 3s ease-in-out infinite;
        }

        .lab-card:nth-child(2) .lab-icon {
            animation-delay: 0.5s;
            color: #ff64c8;
        }

        .lab-card:nth-child(3) .lab-icon {
            animation-delay: 1s;
            color: #64ff96;
        }

        .lab-card:nth-child(4) .lab-icon {
            animation-delay: 1.5s;
            color: #ffd64c;
        }

        .lab-card:nth-child(5) .lab-icon {
            animation-delay: 2s;
            color: #ff8c64;
        }

        .lab-card:nth-child(6) .lab-icon {
            animation-delay: 2.5s;
            color: #c864ff;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px);
            }
            50% {
                transform: translateY(-10px);
            }
        }

        .lab-card h4 {
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: #ffffff;
            font-weight: 600;
        }

        .lab-card p {
            color: #c0c0c0;
            line-height: 1.6;
            font-size: 0.95rem;
            margin-bottom: 20px;
        }

        .lab-link {
            display: inline-block;
            padding: 10px 20px;
            background: linear-gradient(135deg, #64c8ff, #ff64c8);
            color: #ffffff;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-weight: 600;
            font-size: 0.9rem;
        }

        .lab-link:hover {
            transform: translateX(5px);
            box-shadow: 0 5px 20px rgba(100, 200, 255, 0.3);
        }

        .back-btn {
            display: inline-block;
            margin-bottom: 30px;
            padding: 12px 24px;
            background: rgba(100, 200, 255, 0.1);
            border: 1px solid rgba(100, 200, 255, 0.3);
            color: #64c8ff;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-weight: 600;
        }

        .back-btn:hover {
            background: rgba(100, 200, 255, 0.2);
            transform: translateX(-5px);
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="<%= request.getContextPath() %>/user/dashboard.jsp" class="back-btn">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>

        <h2>Practice Labs</h2>
        <p class="subtitle">Master cybersecurity skills with hands-on learning</p>

        <div class="labs-grid">
            <!-- Lab 1: Network Security -->
            <div class="lab-card">
                <div class="lab-icon">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h4>Network Security</h4>
                <p>Learn the fundamentals of securing network infrastructure, firewalls, and intrusion detection systems.</p>

            </div>

            <!-- Lab 2: Ethical Hacking -->
            <div class="lab-card">
                <div class="lab-icon">
                    <i class="fas fa-lock-open"></i>
                </div>
                <h4>Ethical Hacking</h4>
                <p>Explore penetration testing techniques and vulnerability assessment methodologies in a safe environment.</p>

            </div>

            <!-- Lab 3: Cryptography -->
            <div class="lab-card">
                <div class="lab-icon">
                    <i class="fas fa-code"></i>
                </div>
                <h4>Cryptography</h4>
                <p>Master encryption algorithms, digital signatures, and secure communication protocols.</p>

            </div>

            <!-- Lab 4: Web Security -->
            <div class="lab-card">
                <div class="lab-icon">
                    <i class="fas fa-globe"></i>
                </div>
                <h4>Web Security</h4>
                <p>Identify and fix common web vulnerabilities like SQL injection, XSS, and CSRF attacks.</p>

            </div>

            <!-- Lab 5: Malware Analysis -->
            <div class="lab-card">
                <div class="lab-icon">
                    <i class="fas fa-virus"></i>
                </div>
                <h4>Malware Analysis</h4>
                <p>Learn to identify, analyze, and mitigate malicious software threats and advanced attack patterns.</p>

            </div>

            <!-- Lab 6: Incident Response -->
            <div class="lab-card">
                <div class="lab-icon">
                    <i class="fas fa-exclamation-triangle"></i>
                </div>
                <h4>Incident Response</h4>
                <p>Develop skills to detect, respond to, and recover from security incidents and breaches.</p>

            </div>
        </div>
    </div>

    <%@ include file="/includes/footer.jsp" %>
</body>
</html>