<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - Gated Community System</title>
<style>
    /* Classic Elegant Color Scheme */
    :root {
        --primary-gold: #D4AF37;
        --dark-blue: #1a237e;
        --navy-blue: #0d1b2a;
        --cream-white: #fefefe;
        --light-gold: #f7efd9;
        --text-dark: #2c3e50;
    }
    
    /* Reset and base styles */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: 'Georgia', 'Times New Roman', serif;
        line-height: 1.6;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        
        /* Classic Elegant Background */
        background: linear-gradient(135deg, 
            #0d1b2a 0%, 
            #1b263b 25%, 
            #415a77 50%, 
            #778da9 75%, 
            #e0e1dd 100%);
        background-size: 400% 400%;
        animation: gradientShift 15s ease infinite;
        position: relative;
        overflow: hidden;
    }
    
    /* Animated background gradient */
    @keyframes gradientShift {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }
    
    /* Subtle pattern overlay */
    body::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-image: 
            radial-gradient(circle at 20% 80%, rgba(212, 175, 55, 0.1) 0%, transparent 50%),
            radial-gradient(circle at 80% 20%, rgba(212, 175, 55, 0.1) 0%, transparent 50%),
            radial-gradient(circle at 40% 40%, rgba(255, 255, 255, 0.05) 0%, transparent 50%);
        z-index: -1;
    }
    
    /* Header Styles */
    .header {
        text-align: center;
        margin-bottom: 40px;
        position: relative;
    }
    
    .main-title {
        color: var(--primary-gold);
        font-size: 3rem;
        margin-bottom: 15px;
        font-weight: bold;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
        letter-spacing: 2px;
    }
    
    .subtitle {
        color: var(--light-gold);
        font-size: 1.2rem;
        opacity: 0.9;
        font-style: italic;
    }
    
    /* Login Form Container */
    .login-container {
        background: linear-gradient(145deg, 
            rgba(254, 254, 254, 0.95) 0%, 
            rgba(247, 239, 217, 0.9) 100%);
        padding: 50px 40px;
        border-radius: 20px;
        box-shadow: 
            0 20px 40px rgba(0, 0, 0, 0.3),
            0 0 0 1px rgba(212, 175, 55, 0.3),
            inset 0 1px 0 rgba(255, 255, 255, 0.6);
        width: 100%;
        max-width: 450px;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(212, 175, 55, 0.2);
        position: relative;
        overflow: hidden;
    }
    
    /* Decorative corner elements */
    .login-container::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(90deg, 
            transparent 0%, 
            var(--primary-gold) 50%, 
            transparent 100%);
    }
    
    .form-title {
        color: var(--navy-blue);
        text-align: center;
        margin-bottom: 40px;
        font-size: 1.8rem;
        font-weight: bold;
        position: relative;
    }
    
    .form-title::after {
        content: '';
        position: absolute;
        bottom: -10px;
        left: 50%;
        transform: translateX(-50%);
        width: 60px;
        height: 3px;
        background: linear-gradient(90deg, 
            transparent 0%, 
            var(--primary-gold) 50%, 
            transparent 100%);
    }
    
    /* Form Styles */
    .form-group {
        margin-bottom: 25px;
        position: relative;
    }
    
    label {
        display: block;
        margin-bottom: 10px;
        color: var(--navy-blue);
        font-weight: bold;
        font-size: 1rem;
        letter-spacing: 0.5px;
    }
    
    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 15px 20px;
        border: 2px solid #e0e0e0;
        border-radius: 10px;
        font-size: 1rem;
        transition: all 0.3s ease;
        background: rgba(255, 255, 255, 0.8);
        font-family: 'Georgia', serif;
    }
    
    input[type="text"]:focus,
    input[type="password"]:focus {
        outline: none;
        border-color: var(--primary-gold);
        background: white;
        box-shadow: 0 0 0 3px rgba(212, 175, 55, 0.1);
        transform: translateY(-2px);
    }
    
    /* Submit Button */
    .submit-btn {
        width: 100%;
        background: linear-gradient(135deg, var(--primary-gold) 0%, #b8941f 100%);
        color: var(--navy-blue);
        padding: 16px;
        border: none;
        border-radius: 10px;
        font-size: 1.1rem;
        cursor: pointer;
        transition: all 0.3s ease;
        font-weight: bold;
        letter-spacing: 1px;
        text-transform: uppercase;
        box-shadow: 0 4px 15px rgba(212, 175, 55, 0.3);
    }
    
    .submit-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 20px rgba(212, 175, 55, 0.4);
        background: linear-gradient(135deg, #e6c158 0%, var(--primary-gold) 100%);
    }
    
    .submit-btn:active {
        transform: translateY(-1px);
    }
    
    /* Signup Section */
    .signup-section {
        text-align: center;
        margin-top: 30px;
        padding-top: 25px;
        border-top: 1px solid rgba(212, 175, 55, 0.3);
    }
    
    .signup-link {
        color: var(--primary-gold);
        text-decoration: none;
        font-weight: bold;
        transition: all 0.3s ease;
        border-bottom: 1px solid transparent;
    }
    
    .signup-link:hover {
        color: var(--navy-blue);
        border-bottom-color: var(--primary-gold);
    }
    
    /* Message Styling */
    .error-message {
        background: linear-gradient(135deg, #ffebee 0%, #ffcdd2 100%);
        color: #c62828;
        padding: 15px;
        border-radius: 10px;
        margin-bottom: 25px;
        text-align: center;
        border-left: 4px solid #c62828;
        box-shadow: 0 2px 10px rgba(198, 40, 40, 0.1);
    }
    
    .success-message {
        background: linear-gradient(135deg, #e8f5e8 0%, #c8e6c9 100%);
        color: #2e7d32;
        padding: 15px;
        border-radius: 10px;
        margin-bottom: 25px;
        text-align: center;
        border-left: 4px solid #2e7d32;
        box-shadow: 0 2px 10px rgba(46, 125, 50, 0.1);
    }
    
    /* Floating decorative elements */
    .floating-element {
        position: absolute;
        background: rgba(212, 175, 55, 0.1);
        border-radius: 50%;
        animation: float 6s ease-in-out infinite;
    }
    
    .floating-element:nth-child(1) {
        width: 100px;
        height: 100px;
        top: 10%;
        left: 10%;
        animation-delay: 0s;
    }
    
    .floating-element:nth-child(2) {
        width: 150px;
        height: 150px;
        top: 60%;
        right: 10%;
        animation-delay: 2s;
    }
    
    .floating-element:nth-child(3) {
        width: 80px;
        height: 80px;
        bottom: 20%;
        left: 20%;
        animation-delay: 4s;
    }
    
    @keyframes float {
        0%, 100% { transform: translateY(0px) rotate(0deg); }
        50% { transform: translateY(-20px) rotate(180deg); }
    }
    
    /* Responsive Design */
    @media (max-width: 480px) {
        .login-container {
            padding: 30px 20px;
            margin: 20px;
        }
        
        .main-title {
            font-size: 2.2rem;
        }
        
        body {
            padding: 20px;
        }
    }
</style>
</head>
<body>
    <!-- Floating Background Elements -->
    <div class="floating-element"></div>
    <div class="floating-element"></div>
    <div class="floating-element"></div>
    
    <!-- Page Header -->
    <div class="header">
        <h1 class="main-title">🏛️ Gated Community</h1>
        <p class="subtitle">Established with Excellence</p>
    </div>
    
    <!-- Login Form Container -->
    <div class="login-container">
        <h2 class="form-title">Member Portal</h2>
        
        <!-- Display Error Message if login fails -->
        <% 
            String error = (String) request.getAttribute("error");
            if (error != null) { 
        %>
            <div class="error-message">
                ⚠️ <%= error %>
            </div>
        <% } %>
        
        <!-- Display Success Message after signup -->
        <% 
            String success = (String) request.getAttribute("success");
            if (success != null) { 
        %>
            <div class="success-message">
                ✅ <%= success %>
            </div>
        <% } %>
        
        <!-- Login Form -->
        <form action="${pageContext.request.contextPath}/login" method="post">
            
            <!-- Username Field -->
            <div class="form-group">
                <label for="username">👤 Username</label>
                <input type="text" 
                       id="username" 
                       name="username" 
                       placeholder="Enter your username" 
                       required>
            </div>
            
            <!-- Password Field -->
            <div class="form-group">
                <label for="password">🔐 Password</label>
                <input type="password" 
                       id="password" 
                       name="password" 
                       placeholder="Enter your password" 
                       required>
            </div>
            
            <!-- Submit Button -->
            <button type="submit" class="submit-btn">
                Enter Portal
            </button>
        </form>
        
        <!-- Signup Section -->
        <div class="signup-section">
            <p style="color: var(--text-dark);">
                New resident? 
                <a href="signup.jsp" class="signup-link">Request Access</a>
            </p>
        </div>
    </div>
</body>
</html>