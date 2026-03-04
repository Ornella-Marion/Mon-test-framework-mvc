<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Administration - Sprint 11-bis</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #2c3e50;
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.3);
        }
        h1 {
            color: #c0392b;
        }
        .role-badge {
            display: inline-block;
            background: #c0392b;
            color: white;
            padding: 3px 8px;
            border-radius: 3px;
            font-size: 12px;
            margin-left: 10px;
        }
        .alert-success {
            background: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
        }
        .nav {
            display: flex;
            gap: 15px;
            margin: 20px 0;
        }
        .nav a {
            padding: 10px 20px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .nav a:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1> Espace Administration <span class="role-badge">@Role("ADMIN")</span></h1>
        
        <div class="alert-success">
            <strong> Accès autorisé !</strong><br>
            ${message}
        </div>
        
        <p>Cette page est réservée aux utilisateurs ayant le rôle <strong>ADMIN</strong>.</p>
        
        <% if (request.getAttribute("user") != null) { %>
            <p><strong>Connecté en tant que :</strong> ${user.login}</p>
        <% } %>
        
        <div class="nav">
            <a href="${pageContext.request.contextPath}/s11bis/dashboard"> Dashboard</a>
            <a href="${pageContext.request.contextPath}/s11bis/home"> Accueil</a>
        </div>
    </div>
</body>
</html>
