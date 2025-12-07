<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CyberLearn - Your Cyber Security Learning Platform</title>
    <!-- Font Awesome Icons -->
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
            color: #e0e0e0;
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* Animated Background Glow */
        body::before {
            content: '';
            position: fixed;
            width: 400px;
            height: 400px;
            background: radial-gradient(circle, rgba(100, 200, 255, 0.3), transparent);
            border-radius: 50%;
            top: -100px;
            left: -100px;
            animation: float 15s infinite ease-in-out;
            z-index: 0;
        }

        body::after {
            content: '';
            position: fixed;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(255, 100, 200, 0.2), transparent);
            border-radius: 50%;
            bottom: -50px;
            right: -50px;
            animation: float 20s infinite ease-in-out reverse;
            z-index: 0;
        }

        @keyframes float {
            0%, 100% { transform: translate(0, 0); }
            50% { transform: translate(50px, 50px); }
        }

        .container {
            position: relative;
            z-index: 1;
            max-width: 1200px;
            margin: 0 auto;
            padding: 60px 20px;
        }

        .header-section {
            text-align: center;
            margin-bottom: 80px;
            animation: slideDown 0.8s ease-out;
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h2 {
            font-size: 3.5rem;
            font-weight: 700;
            background: linear-gradient(135deg, #64c8ff, #ff64c8);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 20px;
            text-shadow: 0 0 30px rgba(100, 200, 255, 0.3);
        }

        .subtitle {
            font-size: 1.3rem;
            color: #b0b0b0;
            margin-bottom: 40px;
            font-weight: 300;
        }

        /* Feature Cards Grid */
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-bottom: 60px;
            animation: slideUp 0.8s ease-out 0.2s both;
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

        .feature-card {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            padding: 40px 30px;
            text-align: center;
            cursor: pointer;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(100, 200, 255, 0.2), rgba(255, 100, 200, 0.2));
            opacity: 0;
            transition: opacity 0.4s ease;
        }

        .feature-card:hover {
            transform: translateY(-15px);
            border-color: rgba(100, 200, 255, 0.5);
            box-shadow: 0 20px 60px rgba(100, 200, 255, 0.3);
        }

        .feature-card:hover::before {
            opacity: 1;
        }

        .icon {
            font-size: 3.5rem;
            color: #64c8ff;
            margin-bottom: 20px;
            transition: all 0.4s ease;
            position: relative;
            z-index: 1;
        }

        .feature-card:hover .icon {
            color: #ff64c8;
            transform: scale(1.2) rotate(10deg);
            text-shadow: 0 0 20px rgba(255, 100, 200, 0.8);
        }

        .feature-card h3 {
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: #ffffff;
            position: relative;
            z-index: 1;
        }

        .feature-card p {
            font-size: 0.95rem;
            color: #c0c0c0;
            line-height: 1.6;
            position: relative;
            z-index: 1;
        }

        /* Login Button */
        .btn {
            display: inline-block;
            padding: 16px 50px;
            background: linear-gradient(135deg, #64c8ff, #00d4ff);
            color: #0f0c29;
            text-decoration: none;
            border: none;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(100, 200, 255, 0.4);
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #ff64c8, #64c8ff);
            transition: left 0.4s ease;
            z-index: -1;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(100, 200, 255, 0.6);
        }

        .btn:hover::before {
            left: 0;
        }

        .cta-section {
            text-align: center;
            animation: slideUp 0.8s ease-out 0.4s both;
        }

        .cta-section p {
            font-size: 1.2rem;
            margin-bottom: 30px;
            color: #b0b0b0;
        }

        /* Responsive */
        @media (max-width: 768px) {
            h2 {
                font-size: 2.5rem;
            }

            .subtitle {
                font-size: 1.1rem;
            }

            .features-grid {
                grid-template-columns: 1fr;
            }

            .feature-card {
                padding: 30px 20px;
            }

            .icon {
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header-section">
            <h2>Welcome to CyberLearn</h2>
            <p class="subtitle">Your Cyber Security Learning Platform</p>
        </div>

        <div class="features-grid">
            <div class="feature-card">
                <div class="icon"><i class="fas fa-shield-alt"></i></div>
                <h3>Security Fundamentals</h3>
                <p>Learn the core principles of cybersecurity and best practices</p>
            </div>

            <div class="feature-card">
                <div class="icon"><i class="fas fa-code"></i></div>
                <h3>Ethical Hacking</h3>
                <p>Master penetration testing and secure coding techniques</p>
            </div>

            <div class="feature-card">
                <div class="icon"><i class="fas fa-user-graduate"></i></div>
                <h3>Expert Training</h3>
                <p>Learn from industry professionals and certified instructors</p>
            </div>

            <div class="feature-card">
                <div class="icon"><i class="fas fa-network-wired"></i></div>
                <h3>Network Security</h3>
                <p>Understand firewalls, VPNs, and network protection protocols</p>
            </div>

            <div class="feature-card">
                <div class="icon"><i class="fas fa-lock"></i></div>
                <h3>Cryptography</h3>
                <p>Explore encryption, decryption, and secure communications</p>
            </div>

            <div class="feature-card">
                <div class="icon"><i class="fas fa-certificate"></i></div>
                <h3>Certifications</h3>
                <p>Earn recognized credentials in cybersecurity domains</p>
            </div>
        </div>

        <div class="cta-section">
            <p>Ready to enhance your cybersecurity skills?</p>
            <a class="btn" href="login.jsp">Login</a>
        </div>
    </div>
</body>
</html>