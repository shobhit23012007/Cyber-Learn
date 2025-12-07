<%@ include file="/includes/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Discussion Forum - CyberLearn</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #e0e0e0;
            position: relative;
            overflow-x: hidden;
        }

        /* <CHANGE> Animated background glow effect */
        body::before {
            content: '';
            position: fixed;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(100, 200, 255, 0.1) 0%, rgba(100, 200, 255, 0) 70%);
            animation: glowFloat 15s ease-in-out infinite;
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
            background: radial-gradient(circle, rgba(255, 100, 200, 0.1) 0%, rgba(255, 100, 200, 0) 70%);
            animation: glowFloat 20s ease-in-out infinite reverse;
            pointer-events: none;
            z-index: 0;
        }

        @keyframes glowFloat {
            0%, 100% { transform: translate(0, 0); }
            50% { transform: translate(50px, 50px); }
        }

        .container {
            position: relative;
            z-index: 1;
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        h2 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            background: linear-gradient(135deg, #64c8ff, #ff64c8);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-weight: 700;
            text-align: center;
        }

        .subtitle {
            text-align: center;
            color: #b0b0b0;
            margin-bottom: 50px;
            font-size: 1.1rem;
        }

        .forum-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }

        .forum-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 25px;
            transition: all 0.4s cubic-bezier(0.23, 1, 0.320, 1);
            cursor: default;
            animation: slideIn 0.6s ease-out forwards;
            opacity: 0;
        }

        .forum-card:nth-child(1) { animation-delay: 0.1s; }
        .forum-card:nth-child(2) { animation-delay: 0.2s; }
        .forum-card:nth-child(3) { animation-delay: 0.3s; }
        .forum-card:nth-child(4) { animation-delay: 0.4s; }
        .forum-card:nth-child(5) { animation-delay: 0.5s; }
        .forum-card:nth-child(6) { animation-delay: 0.6s; }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .forum-card:hover {
            background: rgba(255, 255, 255, 0.08);
            border-color: rgba(255, 255, 255, 0.2);
            transform: translateY(-8px);
            box-shadow: 0 20px 60px rgba(100, 200, 255, 0.15);
        }

        .post-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 15px;
        }

        .user-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: linear-gradient(135deg, #64c8ff, #0ea5e9);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
            flex-shrink: 0;
        }

        .user-avatar.blue { background: linear-gradient(135deg, #64c8ff, #0ea5e9); }
        .user-avatar.purple { background: linear-gradient(135deg, #a855f7, #7c3aed); }
        .user-avatar.pink { background: linear-gradient(135deg, #ec4899, #db2777); }
        .user-avatar.green { background: linear-gradient(135deg, #10b981, #059669); }
        .user-avatar.orange { background: linear-gradient(135deg, #f97316, #ea580c); }
        .user-avatar.cyan { background: linear-gradient(135deg, #06b6d4, #0891b2); }

        .user-info h5 {
            margin: 0;
            font-size: 1.1rem;
            color: #e0e0e0;
            font-weight: 600;
        }

        .post-time {
            font-size: 0.85rem;
            color: #888;
            margin-top: 3px;
        }

        .post-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 10px;
            color: #ffffff;
        }

        .post-content {
            font-size: 0.95rem;
            line-height: 1.6;
            color: #c0c0c0;
            margin-bottom: 12px;
        }

        .post-meta {
            display: flex;
            gap: 20px;
            font-size: 0.85rem;
            color: #888;
        }

        .post-meta span {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .back-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 12px 24px;
            background: linear-gradient(135deg, #64c8ff, #0ea5e9);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            margin-bottom: 30px;
        }

        .back-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(100, 200, 255, 0.3);
        }

        @media (max-width: 768px) {
            h2 {
                font-size: 1.8rem;
            }

            .forum-grid {
                grid-template-columns: 1fr;
            }

            .container {
                padding: 20px 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Discussion Forum</h2>
        <p class="subtitle">Community Learning & Knowledge Sharing</p>

        <!-- <CHANGE> Hard-coded forum posts with futuristic card design -->
        <div class="forum-grid">
            <!-- Post 1 -->
            <div class="forum-card">
                <div class="post-header">
                    <div class="user-avatar blue">
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="user-info">
                        <h5>Alex Johnson</h5>
                        <p class="post-time">2 hours ago</p>
                    </div>
                </div>
                <div class="post-title">Understanding Network Security Fundamentals</div>
                <p class="post-content">I'm trying to understand the basics of network security. Could someone explain the differences between firewalls, VPNs, and proxies? Any resources would be helpful!</p>
                <div class="post-meta">
                    <span><i class="fas fa-comment"></i> 12 replies</span>
                    <span><i class="fas fa-heart"></i> 24 likes</span>
                </div>
            </div>

            <!-- Post 2 -->
            <div class="forum-card">
                <div class="post-header">
                    <div class="user-avatar purple">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <div class="user-info">
                        <h5>Sarah Chen</h5>
                        <p class="post-time">4 hours ago</p>
                    </div>
                </div>
                <div class="post-title">Best Practices for Password Security</div>
                <p class="post-content">What are the latest best practices for creating and managing strong passwords? I've heard about passkeys - are they replacing traditional passwords?</p>
                <div class="post-meta">
                    <span><i class="fas fa-comment"></i> 18 replies</span>
                    <span><i class="fas fa-heart"></i> 31 likes</span>
                </div>
            </div>

            <!-- Post 3 -->
            <div class="forum-card">
                <div class="post-header">
                    <div class="user-avatar pink">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="user-info">
                        <h5>Mike Rodriguez</h5>
                        <p class="post-time">6 hours ago</p>
                    </div>
                </div>
                <div class="post-title">Exploring Ethical Hacking Career Path</div>
                <p class="post-content">I'm interested in becoming a certified ethical hacker. Which certifications should I pursue first? CEH or OSCP? Looking for guidance from experienced professionals.</p>
                <div class="post-meta">
                    <span><i class="fas fa-comment"></i> 25 replies</span>
                    <span><i class="fas fa-heart"></i> 45 likes</span>
                </div>
            </div>

            <!-- Post 4 -->
            <div class="forum-card">
                <div class="post-header">
                    <div class="user-avatar green">
                        <i class="fas fa-code"></i>
                    </div>
                    <div class="user-info">
                        <h5>Emily Watson</h5>
                        <p class="post-time">8 hours ago</p>
                    </div>
                </div>
                <div class="post-title">Python for Penetration Testing - Tips & Tricks</div>
                <p class="post-content">Sharing some useful Python libraries for pentest automation. Let me know which tools you use most frequently in your security assessments!</p>
                <div class="post-meta">
                    <span><i class="fas fa-comment"></i> 9 replies</span>
                    <span><i class="fas fa-heart"></i> 38 likes</span>
                </div>
            </div>

            <!-- Post 5 -->
            <div class="forum-card">
                <div class="post-header">
                    <div class="user-avatar orange">
                        <i class="fas fa-virus"></i>
                    </div>
                    <div class="user-info">
                        <h5>James Park</h5>
                        <p class="post-time">10 hours ago</p>
                    </div>
                </div>
                <div class="post-title">Malware Analysis - Where to Start?</div>
                <p class="post-content">New to malware analysis here. What are the essential tools and sandboxes I should set up? Looking for step-by-step guidance to get started safely.</p>
                <div class="post-meta">
                    <span><i class="fas fa-comment"></i> 16 replies</span>
                    <span><i class="fas fa-heart"></i> 28 likes</span>
                </div>
            </div>

            <!-- Post 6 -->
            <div class="forum-card">
                <div class="post-header">
                    <div class="user-avatar cyan">
                        <i class="fas fa-network-wired"></i>
                    </div>
                    <div class="user-info">
                        <h5>Lisa Thompson</h5>
                        <p class="post-time">12 hours ago</p>
                    </div>
                </div>
                <div class="post-title">Cloud Security Challenges & Solutions</div>
                <p class="post-content">What are the main security concerns when migrating to the cloud? Any recommendations for securing AWS, Azure, or GCP environments?</p>
                <div class="post-meta">
                    <span><i class="fas fa-comment"></i> 22 replies</span>
                    <span><i class="fas fa-heart"></i> 51 likes</span>
                </div>
            </div>
        </div>

        <a href="<%= request.getContextPath() %>/user/dashboard.jsp" class="back-btn">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
    </div>
</body>
</html>

<%@ include file="/includes/footer.jsp" %>