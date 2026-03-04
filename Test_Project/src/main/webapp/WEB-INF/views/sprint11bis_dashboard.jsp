<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Sprint 11-bis</title>
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
        }
        .user-info {
            background: #e8f4fd;
            padding: 20px;
            border-radius: 5px;
            margin: 20px 0;
        }
        .user-info p {
            margin: 10px 0;
        }
        .nav {
            display: flex;
            gap: 15px;
            margin: 20px 0;
            flex-wrap: wrap;
        }
        .nav a {
            padding: 10px 20px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .nav a.danger {
            background: #e74c3c;
        }
        .nav a:hover {
            opacity: 0.9;
        }
        .protected-badge {
            display: inline-block;
            background: #27ae60;
            color: white;
            padding: 3px 8px;
            border-radius: 3px;
            font-size: 12px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1> Dashboard <span class="protected-badge">@Auth</span></h1>
        
        <div class="user-info">
            <h3> Informations utilisateur</h3>
            <p><strong>Login :</strong> ${username}</p>
            <p><strong>Rôles :</strong> ${roles}</p>
        </div>
        
        <p> Si vous voyez cette page, c'est que vous êtes bien connecté !</p>
        
        <div class="nav">
            <a href="${pageContext.request.contextPath}/s11bis/home"> Accueil</a>
            <a href="${pageContext.request.contextPath}/s11bis/profile"> Mon Profil</a>
            <a href="${pageContext.request.contextPath}/s11bis/admin"> Admin</a>
            <a href="${pageContext.request.contextPath}/s11bis/prof"> Prof</a>
            <a href="${pageContext.request.contextPath}/s11bis/reports"> Rapports</a>
            <a href="${pageContext.request.contextPath}/s11bis/logout" class="danger"> Déconnexion</a>
        </div>
    </div>
</body>
</html>
