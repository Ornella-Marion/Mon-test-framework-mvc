<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mon Profil - Sprint 11-bis</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
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
        .profile-card {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin: 20px 0;
        }
        .profile-card p {
            margin: 10px 0;
            padding: 10px;
            background: white;
            border-radius: 3px;
        }
        .profile-card strong {
            color: #555;
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
        <h1> Mon Profil <span class="protected-badge">@Auth</span></h1>
        
        <% if (request.getAttribute("user") != null) { %>
            <div class="profile-card">
                <p><strong>Login :</strong> ${user.login}</p>
                <p><strong>Email :</strong> ${user.email}</p>
                <p><strong>Nom complet :</strong> ${user.fullName}</p>
                <p><strong>Rôles :</strong> 
                    <% 
                        mg.etu3273.test.model.MyUser u = (mg.etu3273.test.model.MyUser) request.getAttribute("user");
                        if (u != null && u.getRoles() != null) {
                            out.print(String.join(", ", u.getRoles()));
                        }
                    %>
                </p>
            </div>
        <% } else { %>
            <p>Aucune information utilisateur disponible.</p>
        <% } %>
        
        <div class="nav">
            <a href="${pageContext.request.contextPath}/s11bis/dashboard"> Dashboard</a>
            <a href="${pageContext.request.contextPath}/s11bis/home"> Accueil</a>
        </div>
    </div>
</body>
</html>
