<%@ include file="/includes/header.jsp" %>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #0a0e27 0%, #1a1a3e 50%, #0f0f2e 100%);
        min-height: 100vh;
        position: relative;
        overflow-x: hidden;
    }

    .glow-bg {
        position: fixed;
        width: 400px;
        height: 400px;
        background: radial-gradient(circle, rgba(99, 102, 241, 0.3) 0%, transparent 70%);
        border-radius: 50%;
        filter: blur(40px);
        animation: float1 20s ease-in-out infinite;
        z-index: 0;
    }

    .glow-bg:nth-child(2) {
        animation: float2 25s ease-in-out infinite;
        right: 100px;
        top: 50%;
    }

    @keyframes float1 {
        0%, 100% { transform: translate(0, 0); }
        50% { transform: translate(50px, 50px); }
    }

    @keyframes float2 {
        0%, 100% { transform: translate(0, 0); }
        50% { transform: translate(-50px, -50px); }
    }

    .container {
        position: relative;
        z-index: 1;
        max-width: 1200px;
        margin: 0 auto;
        padding: 40px 20px;
    }

    .header-section {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 50px;
        gap: 20px;
    }

    h2 {
        font-size: 2.5rem;
        background: linear-gradient(135deg, #6366f1 0%, #a78bfa 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }

    .back-button {
        display: flex;
        align-items: center;
        gap: 8px;
        padding: 12px 24px;
        background: rgba(255, 255, 255, 0.1);
        border: 1px solid rgba(99, 102, 241, 0.5);
        border-radius: 50px;
        color: #a78bfa;
        text-decoration: none;
        font-size: 0.95rem;
        backdrop-filter: blur(10px);
        transition: all 0.3s ease;
        cursor: pointer;
    }

    .back-button:hover {
        background: rgba(99, 102, 241, 0.2);
        border-color: #a78bfa;
        box-shadow: 0 0 20px rgba(167, 139, 250, 0.5);
        transform: translateX(-5px);
    }

    .certifications-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 30px;
        margin-top: 30px;
    }

    .cert-card {
        background: rgba(255, 255, 255, 0.05);
        border: 1px solid rgba(99, 102, 241, 0.3);
        border-radius: 15px;
        padding: 30px;
        backdrop-filter: blur(10px);
        transition: all 0.3s ease;
        animation: slideUp 0.6s ease forwards;
        opacity: 0;
    }

    .cert-card:nth-child(1) { animation-delay: 0.1s; }
    .cert-card:nth-child(2) { animation-delay: 0.2s; }
    .cert-card:nth-child(3) { animation-delay: 0.3s; }
    .cert-card:nth-child(4) { animation-delay: 0.4s; }
    .cert-card:nth-child(5) { animation-delay: 0.5s; }
    .cert-card:nth-child(6) { animation-delay: 0.6s; }

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

    .cert-card:hover {
        background: rgba(99, 102, 241, 0.15);
        border-color: #a78bfa;
        transform: translateY(-10px);
        box-shadow: 0 20px 40px rgba(99, 102, 241, 0.3);
    }

    .cert-icon {
        font-size: 2.5rem;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        justify-content: center;
        width: 60px;
        height: 60px;
        border-radius: 12px;
        background: linear-gradient(135deg, #6366f1, #a78bfa);
    }

    .cert-card:nth-child(1) .cert-icon { background: linear-gradient(135deg, #6366f1, #a78bfa); }
    .cert-card:nth-child(2) .cert-icon { background: linear-gradient(135deg, #ec4899, #f43f5e); }
    .cert-card:nth-child(3) .cert-icon { background: linear-gradient(135deg, #3b82f6, #06b6d4); }
    .cert-card:nth-child(4) .cert-icon { background: linear-gradient(135deg, #10b981, #14b8a6); }
    .cert-card:nth-child(5) .cert-icon { background: linear-gradient(135deg, #f59e0b, #d97706); }
    .cert-card:nth-child(6) .cert-icon { background: linear-gradient(135deg, #8b5cf6, #d946ef); }

    .cert-icon i {
        color: white;
    }

    .cert-title {
        font-size: 1.3rem;
        font-weight: 600;
        color: #fff;
        margin-bottom: 10px;
    }

    .cert-course {
        font-size: 0.9rem;
        color: #a78bfa;
        margin-bottom: 8px;
    }

    .cert-meta {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 15px;
        padding-top: 15px;
        border-top: 1px solid rgba(99, 102, 241, 0.2);
        font-size: 0.85rem;
        color: #94a3b8;
    }

    .cert-id {
        font-family: monospace;
        color: #6366f1;
    }

    .cert-year {
        background: rgba(99, 102, 241, 0.2);
        padding: 4px 12px;
        border-radius: 20px;
        color: #a78bfa;
    }
</style>

<div class="glow-bg"></div>
<div class="glow-bg"></div>

<div class="container">
    <div class="header-section">
        <h2>My Certifications</h2>
        <!-- <CHANGE> Updated back button path to correct dashboard location -->
        <a href="<%= request.getContextPath() %>/user/dashboard.jsp" class="back-button">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
    </div>

    <div class="certifications-grid">
        <div class="cert-card">
            <div class="cert-icon"><i class="fas fa-shield-alt"></i></div>
            <div class="cert-title">Network Security Certified</div>
            <div class="cert-course">Course: Network Fundamentals</div>
            <div class="cert-meta">
                <span class="cert-id">NSC-2024-001</span>
                <span class="cert-year">2024</span>
            </div>
        </div>

        <div class="cert-card">
            <div class="cert-icon"><i class="fas fa-code"></i></div>
            <div class="cert-title">Ethical Hacking Pro</div>
            <div class="cert-course">Course: Penetration Testing</div>
            <div class="cert-meta">
                <span class="cert-id">EHP-2024-002</span>
                <span class="cert-year">2024</span>
            </div>
        </div>

        <div class="cert-card">
            <div class="cert-icon"><i class="fas fa-lock"></i></div>
            <div class="cert-title">Cryptography Expert</div>
            <div class="cert-course">Course: Encryption & Algorithms</div>
            <div class="cert-meta">
                <span class="cert-id">CE-2024-003</span>
                <span class="cert-year">2024</span>
            </div>
        </div>

        <div class="cert-card">
            <div class="cert-icon"><i class="fas fa-user-shield"></i></div>
            <div class="cert-title">Identity & Access Master</div>
            <div class="cert-course">Course: IAM Systems</div>
            <div class="cert-meta">
                <span class="cert-id">IAM-2024-004</span>
                <span class="cert-year">2024</span>
            </div>
        </div>

        <div class="cert-card">
            <div class="cert-icon"><i class="fas fa-virus"></i></div>
            <div class="cert-title">Malware Analysis Specialist</div>
            <div class="cert-course">Course: Threat Detection</div>
            <div class="cert-meta">
                <span class="cert-id">MAS-2024-005</span>
                <span class="cert-year">2024</span>
            </div>
        </div>

        <div class="cert-card">
            <div class="cert-icon"><i class="fas fa-server"></i></div>
            <div class="cert-title">Cloud Security Certified</div>
            <div class="cert-course">Course: Cloud Infrastructure</div>
            <div class="cert-meta">
                <span class="cert-id">CSC-2024-006</span>
                <span class="cert-year">2024</span>
            </div>
        </div>
    </div>
</div>

<%@ include file="/includes/footer.jsp" %>