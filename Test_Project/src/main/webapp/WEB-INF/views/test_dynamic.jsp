<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${titre}</title>
    <style>
        body{font-family:Arial;margin:40px;background:#e74c3c}
        .box{background:white;padding:30px;border-radius:10px;max-width:600px;margin:0 auto}
        h1{color:#e74c3c}
        .info{background:#ffe6e6;padding:15px;border-radius:8px;margin:15px 0;border-left:4px solid #e74c3c}
    </style>
</head>
<body>
    <div class="box">
        <h1> ${titre}</h1>
        <div class="info">
            <p><strong>Pattern :</strong> <code>${urlPattern}</code></p>
            <p><strong>ID extrait :</strong> ${id}</p>
            ${extra != null ? '<p><strong>Extra :</strong> '.concat(extra).concat('</p>') : ''}
        </div>
        <p> Sprint 6-ter : Valeur extraite depuis l'URL avec {}</p>
        <p>Exemples : /test/17, /test/25, /test/100</p>
    </div>
</body>
</html>