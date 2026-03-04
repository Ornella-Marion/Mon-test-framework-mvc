<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${titre}</title>
    <style>
        body{font-family:Arial;margin:40px;background:#3498db}
        .box{background:white;padding:30px;border-radius:10px;max-width:600px;margin:0 auto}
        h1{color:#3498db}
        .success{background:#d4edda;padding:15px;border-radius:8px;margin:15px 0;border-left:4px solid #27ae60}
        .method{display:inline-block;padding:4px 10px;border-radius:5px;font-size:12px;font-weight:bold;background:#3498db;color:white}
    </style>
</head>
<body>
    <div class="box">
        <h1> ${titre}</h1>
        <span class="method">${method}</span>
        <div class="success">
            <p><strong>Nom :</strong> ${nom}</p>
            <p><strong>Email :</strong> ${email}</p>
        </div>
        <p> Sprint 7 : Méthode HTTP ${method} utilisée avec succès</p>
        <a href="/test-framework-mvc/sprint7/form" style="color:#3498db">← Retour</a>
    </div>
</body>
</html>