<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Gated Community - Home</title>
    <style>
        /* Elegant Color Scheme */
        :root {
            --primary-blue: #2c3e50;
            --accent-gold: #D4AF37;
            --light-blue: #ecf0f1;
            --dark-blue: #34495e;
            --text-dark: #2c3e50;
        }
        
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, 
                #667eea 0%, 
                #764ba2 25%, 
                #f093fb 50%, 
                #f5576c 75%, 
                #4facfe 100%);
            background-size: 400% 400%;
            animation: gradientAnimation 15s ease infinite;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }
        
        /* Animated Background */
        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        /* Floating Particles */
        .particles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }
        
        .particle {
            position: absolute;
            background: rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }
        
        .particle:nth-child(1) {
            width: 80px;
            height: 80px;
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }
        
        .particle:nth-child(2) {
            width: 120px;
            height: 120px;
            top: 60%;
            right: 10%;
            animation-delay: 2s;
        }
        
        .particle:nth-child(3) {
            width: 60px;
            height: 60px;
            bottom: 30%;
            left: 20%;
            animation-delay: 4s;
        }
        
        @keyframes float {
            0%, 100% { 
                transform: translateY(0px) rotate(0deg); 
                opacity: 0.7;
            }
            50% { 
                transform: translateY(-40px) rotate(180deg); 
                opacity: 0.3;
            }
        }
        
        /* Main Container */
        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 60px 40px;
            border-radius: 25px;
            box-shadow: 
                0 25px 50px rgba(0, 0, 0, 0.2),
                0 0 0 1px rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(15px);
            text-align: center;
            max-width: 600px;
            width: 90%;
            border: 1px solid rgba(255, 255, 255, 0.4);
            position: relative;
            overflow: hidden;
            animation: containerEntrance 1s ease-out;
        }
        
        @keyframes containerEntrance {
            0% {
                opacity: 0;
                transform: translateY(50px) scale(0.9);
            }
            100% {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }
        
        /* Decorative Border */
        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, 
                #667eea, #764ba2, #f093fb, #f5576c, #4facfe);
            background-size: 200% 100%;
            animation: borderFlow 3s linear infinite;
        }
        
        @keyframes borderFlow {
            0% { background-position: 200% 0; }
            100% { background-position: -200% 0; }
        }
        
        /* Main Heading */
        .main-title {
            color: var(--text-dark);
            font-size: 3.5rem;
            margin-bottom: 30px;
            font-weight: 300;
            letter-spacing: 3px;
            text-transform: uppercase;
            position: relative;
            animation: titleGlow 3s ease-in-out infinite alternate;
        }
        
        @keyframes titleGlow {
            0% {
                text-shadow: 0 0 20px rgba(102, 126, 234, 0.5);
            }
            100% {
                text-shadow: 0 0 30px rgba(118, 75, 162, 0.8), 
                            0 0 40px rgba(240, 147, 251, 0.6);
            }
        }
        
        .main-title::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, transparent, var(--accent-gold), transparent);
        }
        
        /* Animated Subtitle */
        .subtitle {
            color: var(--dark-blue);
            font-size: 1.4rem;
            margin-bottom: 50px;
            font-weight: 300;
            letter-spacing: 2px;
            position: relative;
            animation: subtitleFloat 4s ease-in-out infinite;
        }
        
        @keyframes subtitleFloat {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        
        /* Navigation Buttons */
        .nav-buttons {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 40px;
        }
        
        .nav-btn {
            padding: 15px 35px;
            font-size: 1.1rem;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
            border: 2px solid transparent;
        }
        
        .signup-btn {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }
        
        .login-btn {
            background: transparent;
            color: var(--text-dark);
            border: 2px solid var(--text-dark);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        /* Button Hover Effects */
        .nav-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s;
        }
        
        .nav-btn:hover::before {
            left: 100%;
        }
        
        .nav-btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        }
        
        .signup-btn:hover {
            background: linear-gradient(135deg, #764ba2, #667eea);
        }
        
        .login-btn:hover {
            background: var(--text-dark);
            color: white;
        }
        
        /* Welcome Message */
        .welcome-message {
            margin-top: 40px;
            padding: 20px;
            background: rgba(236, 240, 241, 0.7);
            border-radius: 15px;
            border-left: 4px solid var(--accent-gold);
        }
        
        .welcome-text {
            color: var(--text-dark);
            font-size: 1.1rem;
            line-height: 1.6;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 40px 20px;
            }
            
            .main-title {
                font-size: 2.5rem;
            }
            
            .subtitle {
                font-size: 1.1rem;
            }
            
            .nav-buttons {
                flex-direction: column;
                gap: 20px;
            }
            
            .nav-btn {
                padding: 12px 25px;
                font-size: 1rem;
            }
        }
        
        /* Additional Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .fade-in-up {
            animation: fadeInUp 0.8s ease-out;
        }
        
        .delay-1 { animation-delay: 0.2s; }
        .delay-2 { animation-delay: 0.4s; }
        .delay-3 { animation-delay: 0.6s; }
    </style>
</head>
<body>
    <!-- Floating Particles -->
    <div class="particles">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>
    
    <!-- Main Content Container -->
    <div class="container">
        <!-- Main Title -->
        <h1 class="main-title fade-in-up">Welcome To Gated Community</h1>
        
        <!-- Animated Subtitle -->
        <div class="subtitle fade-in-up delay-1">
            🏡 Your Premium Living Experience Awaits
        </div>
        
        <!-- Navigation Buttons -->
        <div class="nav-buttons fade-in-up delay-2">
            <a href="signup.jsp" class="nav-btn signup-btn">
                🚀 Get Started
            </a>
            <a href="login.jsp" class="nav-btn login-btn">
                🔑 Member Login
            </a>
        </div>
        
        <!-- Welcome Message -->
        <div class="welcome-message fade-in-up delay-3">
            <p class="welcome-text">
                Experience luxury living with our state-of-the-art gated community. 
                Join us today and discover a world of premium amenities, security, 
                and community living at its finest.
            </p>
        </div>
    </div>

    <script>
        // Additional interactive animations
        document.addEventListener('DOMContentLoaded', function() {
            const buttons = document.querySelectorAll('.nav-btn');
            
            buttons.forEach(button => {
                button.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-8px) scale(1.05)';
                });
                
                button.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0) scale(1)';
                });
            });
            
            // Add ripple effect to buttons
            buttons.forEach(button => {
                button.addEventListener('click', function(e) {
                    const ripple = document.createElement('span');
                    const rect = button.getBoundingClientRect();
                    const size = Math.max(rect.width, rect.height);
                    const x = e.clientX - rect.left - size / 2;
                    const y = e.clientY - rect.top - size / 2;
                    
                    ripple.style.cssText = `
                        position: absolute;
                        border-radius: 50%;
                        background: rgba(255, 255, 255, 0.6);
                        transform: scale(0);
                        animation: ripple 0.6s linear;
                        width: ${size}px;
                        height: ${size}px;
                        left: ${x}px;
                        top: ${y}px;
                    `;
                    
                    button.appendChild(ripple);
                    
                    setTimeout(() => {
                        ripple.remove();
                    }, 600);
                });
            });
            
            // Add CSS for ripple animation
            const style = document.createElement('style');
            style.textContent = `
                @keyframes ripple {
                    to {
                        transform: scale(4);
                        opacity: 0;
                    }
                }
            `;
            document.head.appendChild(style);
        });
    </script>
</body>
</html>