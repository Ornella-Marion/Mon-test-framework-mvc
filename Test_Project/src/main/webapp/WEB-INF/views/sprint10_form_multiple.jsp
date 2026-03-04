<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${titre}</title>
    <style>
        body{font-family:Arial;margin:40px;background:#3498db}
        .box{background:white;padding:30px;border-radius:10px;max-width:700px;margin:0 auto}
        h1{color:#3498db}
        .info{background:#d1ecf1;padding:15px;border-radius:8px;margin-bottom:20px;border-left:4px solid#3498db}
        .section{background:#f8f9fa;padding:20px;border-radius:8px;margin:20px 0;border-left:4px solid #3498db}
        .form-group{margin:15px 0}
        label{display:block;font-weight:bold;margin-bottom:5px}
        input[type="text"]{width:100%;padding:10px;border:2px solid #ddd;border-radius:5px;box-sizing:border-box}
        input[type="file"]{padding:10px 0}
        button{background:#3498db;color:white;padding:12px 30px;border:none;border-radius:5px;cursor:pointer;margin-top:15px;font-size:16px}
        button:hover{background:#2980b9}
        .code{background:#f8f9fa;padding:10px;border-radius:5px;font-family:monospace;margin:10px 0;font-size:13px}
    </style>
</head>
<body>
    <div class="box">
        <h1> ${titre}</h1>
        
        <div class="info">
            <strong> Sprint 10 - Test 2 :</strong> Upload de plusieurs fichiers<br>
            Deux fichiers différents seront injectés dans deux paramètres distincts.
        </div>

        <div class="code">
            <strong>Contrôleur :</strong><br>
            @PostUrl("/sprint10/upload-multiple")<br>
            public ModelView uploadMultiple(<br>
            &nbsp;&nbsp;<span style="color:#e74c3c">FileUpload document</span>,<br>
            &nbsp;&nbsp;<span style="color:#e74c3c">FileUpload image</span>,<br>
            &nbsp;&nbsp;String titre<br>
            ) { ... }
        </div>

        <form action="/test-framework-mvc/sprint10/upload-multiple" 
              method="POST" 
              enctype="multipart/form-data">
            
            <div class="form-group">
                <label> Titre du document :</label>
                <input type="text" name="titre" placeholder="Ex: Rapport mensuel" required>
            </div>

            <div class="section">
                <h3 style="margin-top:0;color:#3498db"> Document (PDF, Word, etc.)</h3>
                <div class="form-group">
                    <label>Fichier document (name="document") :</label>
                    <input type="file" name="document" accept=".pdf,.doc,.docx,.txt">
                </div>
            </div>

            <div class="section">
                <h3 style="margin-top:0;color:#3498db"> Image (Photo, logo, etc.)</h3>
                <div class="form-group">
                    <label>Fichier image (name="image") :</label>
                    <input type="file" name="image" accept="image/*">
                </div>
            </div>
            
            <button type="submit"> Uploader les 2 fichiers</button>
        </form>

        <div style="background:#e7f3ff;padding:15px;border-radius:8px;margin:20px 0">
            <strong> Magie du framework :</strong>
            <ul style="margin:10px 0">
                <li> Le framework détecte les 2 fichiers uploadés</li>
                <li> Il crée 2 objets <code>FileUpload</code> distincts</li>
                <li> Il les injecte dans les bons paramètres selon le <code>name</code></li>
                <li> Le contrôleur reçoit : <code>document</code>, <code>image</code>, <code>titre</code></li>
            </ul>
        </div>

        <p style="margin-top:20px">
            <a href="/test-framework-mvc/sprint10/form-single" style="color:#3498db">← Test 1</a> |
            <a href="/test-framework-mvc/sprint10/form-with-object" style="color:#3498db">Test 3 →</a>
        </p>
    </div>
</body>
</html>