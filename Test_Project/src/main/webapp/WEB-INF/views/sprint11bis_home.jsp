<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Accueil - Sprint 11-bis</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .message {
            text-align: center;
            color: #666;
            font-size: 18px;
        }
        .nav {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin: 30px 0;
            flex-wrap: wrap;
        }
        .nav a {
            padding: 12px 25px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .nav a:hover {
            opacity: 0.9;
        }
        .info-box {
            background: #e8f4fd;
            padding: 20px;
            border-radius: 5px;
            margin-top: 20px;
        }
        .info-box h3 {
            margin-top: 0;
            color: #333;
        }
        .info-box ul {
            line-height: 2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1> Bienvenue - Sprint 11-bis</h1>
        
        <p class="message">${message}</p>
        
        <div class="nav">
            <a href="${pageContext.request.contextPath}/s11bis/login"> Se connecter</a>
            <a href="${pageContext.request.contextPath}/s11bis/dashboard"> Dashboard</a>
            <a href="${pageContext.request.contextPath}/s11bis/admin"> Admin</a>
            <a href="${pageContext.request.contextPath}/s11bis/prof"> Espace Prof</a>
        </div>
        
        <div class="info-box">
            <h3> Test des annotations @Auth et @Role</h3>
            <ul>
                <li><strong>/s11bis/home</strong> - Public (pas d'annotation)</li>
                <li><strong>/s11bis/login</strong> - Public (page de connexion)</li>
                <li><strong>/s11bis/dashboard</strong> - @Auth (connecté requis)</li>
                <li><strong>/s11bis/profile</strong> - @Auth (connecté requis)</li>
                <li><strong>/s11bis/admin</strong> - @Role("ADMIN")</li>
                <li><strong>/s11bis/prof</strong> - @Role("PROF")</li>
                <li><strong>/s11bis/reports</strong> - @Role({"ADMIN", "PROF"})</li>
            </ul>
        </div>
    </div>
</body>
</html>
