<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${titre}</title>
    <style>
        body{font-family:Arial;margin:40px;background:#9b59b6}
        .box{background:white;padding:30px;border-radius:10px;max-width:600px;margin:0 auto}
        h1{color:#9b59b6}
        .info{background:#e8daef;padding:15px;border-radius:8px;margin:15px 0}
        .form-group{margin:15px 0}
        label{display:block;font-weight:bold;margin-bottom:5px}
        input{width:100%;padding:10px;border:2px solid #ddd;border-radius:5px;box-sizing:border-box}
        button{background:#9b59b6;color:white;padding:12px 30px;border:none;border-radius:5px;cursor:pointer;margin-top:15px}
        .method{display:inline-block;padding:4px 10px;border-radius:5px;font-size:12px;font-weight:bold;margin:0 5px}
        .GET{background:#27ae60;color:white}
        .POST{background:#3498db;color:white}
    </style>
</head>
<body>
    <div class="box">
        <h1> ${titre}</h1>
        <span class="method GET">GET</span>
        <div class="info">
            <strong> Sprint 7 :</strong> Cette page est affichée via <strong>GET</strong>. 
            Le formulaire utilisera <strong>POST</strong> sur la même URL !
        </div>
        <form action="/test-framework-mvc/sprint7/form" method="POST">
            <div class="form-group">
                <label>Nom :</label>
                <input type="text" name="nom" required>
            </div>
            <div class="form-group">
                <label>Email :</label>
                <input type="email" name="email" required>
            </div>
            <button type="submit"> Enregistrer (POST)</button>
        </form>
        <p style="margin-top:20px;color:#666">
            <span class="method GET">GET</span> /sprint7/form → showForm()<br>
            <span class="method POST">POST</span> /sprint7/form → submitForm()
        </p>
    </div>
</body>
</html>