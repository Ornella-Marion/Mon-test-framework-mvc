<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sprint 10 : Test ULTIME</title>
    <style>
        body{font-family:Arial;margin:40px;background:linear-gradient(135deg, #667eea 0%, #764ba2 100%)}
        .box{background:white;padding:30px;border-radius:10px;max-width:800px;margin:0 auto;box-shadow:0 10px 40px rgba(0,0,0,0.2)}
        h1{color:#667eea;margin:0 0 20px 0}
        .info{background:linear-gradient(135deg, #e0c3fc 0%, #8ec5fc 100%);padding:20px;border-radius:8px;margin-bottom:25px;color:#333}
        .section{background:#f8f9fa;padding:20px;border-radius:8px;margin:20px 0;border-left:4px solid #667eea}
        .form-group{margin:15px 0}
        label{display:block;font-weight:bold;margin-bottom:5px}
        input[type="text"], input[type="number"], input[type="email"]{width:100%;padding:10px;border:2px solid #ddd;border-radius:5px;box-sizing:border-box}
        input[type="file"]{padding:10px 0}
        button{background:linear-gradient(135deg, #667eea 0%, #764ba2 100%);color:white;padding:15px 40px;border:none;border-radius:5px;cursor:pointer;margin-top:20px;font-size:16px;font-weight:bold;box-shadow:0 4px 15px rgba(102,126,234,0.4)}
        button:hover{transform:translateY(-2px);box-shadow:0 6px 20px rgba(102,126,234,0.6)}
        .code{background:#f8f9fa;padding:15px;border-radius:5px;font-family:monospace;margin:15px 0;font-size:13px;line-height:1.6}
    </style>
</head>
<body>
    <div class="box">
        <h1> TEST ULTIME : Sprint 8 + 8-bis + 10</h1>
        
        <div class="info">
            <strong style="font-size:18px"> Le test qui combine TOUT !</strong><br><br>
            Ce formulaire teste simultanément :<br>
             Sprint 8-bis : Objet <code>Employee</code><br>
             Sprint 8 : <code>Map&lt;String, Object&gt;</code> pour les métadonnées<br>
             Sprint 10 : <code>FileUpload</code> pour le CV
        </div>

        <div class="code">
            <strong>Contrôleur :</strong><br>
            @PostUrl("/sprint10/upload-ultimate")<br>
            public ModelView uploadUltimate(<br>
            &nbsp;&nbsp;<span style="color:#e74c3c">Employee e</span>,              ← Sprint 8-bis<br>
            &nbsp;&nbsp;<span style="color:#3498db">Map&lt;String, Object&gt; meta</span>,  ← Sprint 8<br>
            &nbsp;&nbsp;<span style="color:#27ae60">FileUpload cv</span>             ← Sprint 10<br>
            ) { ... }
        </div>

        <form action="/test-framework-mvc/sprint10/upload-ultimate" 
              method="POST" 
              enctype="multipart/form-data">
            
            <div class="section" style="border-left-color:#e74c3c">
                <h3 style="margin-top:0;color:#e74c3c"> Employé (Objet - Sprint 8-bis)</h3>
                
                <div class="form-group">
                    <label>Nom (e.nom) :</label>
                    <input type="text" name="e.nom" value="Sophie Andrianina" required>
                </div>
                
                <div class="form-group">
                    <label>Âge (e.age) :</label>
                    <input type="number" name="e.age" value="28" required>
                </div>
                
                <div class="form-group">
                    <label>Salaire (e.salaire) :</label>
                    <input type="number" step="0.01" name="e.salaire" value="4200000">
                </div>
            </div>

            <div class="section" style="border-left-color:#3498db">
                <h3 style="margin-top:0;color:#3498db"> Métadonnées (Map - Sprint 8)</h3>
                
                <div class="form-group">
                    <label>Email de contact (meta.email) :</label>
                    <input type="email" name="meta.email" value="sophie@example.com">
                </div>
                
                <div class="form-group">
                    <label>Téléphone (meta.telephone) :</label>
                    <input type="text" name="meta.telephone" value="034 12 345 67">
                </div>
                
                <div class="form-group">
                    <label>Commentaire (meta.commentaire) :</label>
                    <input type="text" name="meta.commentaire" value="Candidature spontanée">
                </div>
            </div>

            <div class="section" style="border-left-color:#27ae60">
                <h3 style="margin-top:0;color:#27ae60"> CV (FileUpload - Sprint 10)</h3>
                
                <div class="form-group">
                    <label>Fichier CV (name="cv") :</label>
                    <input type="file" name="cv" accept=".pdf,.doc,.docx" required>
                </div>
            </div>
            
            <button type="submit"> ENVOYER TOUT !</button>
        </form>

        <div style="background:#d4edda;padding:20px;border-radius:8px;margin:20px 0;border-left:4px solid #27ae60">
            <strong style="font-size:16px"> Ce que fait le framework :</strong>
            <ol style="margin:15px 0;line-height:1.8">
                <li>Détecte <code>Employee e</code> → binde l'objet depuis <code>e.nom</code>, <code>e.age</code>, <code>e.salaire</code></li>
                <li>Détecte <code>Map meta</code> → construit une Map avec les champs <code>meta.*</code></li>
                <li>Détecte <code>FileUpload cv</code> → extrait le fichier uploadé</li>
                <li>Invoque : <code>controller.uploadUltimate(e, meta, cv)</code></li>
                <li><strong>TOUT EST INJECTÉ AUTOMATIQUEMENT !</strong></li>
            </ol>
        </div>

        <p style="text-align:center;margin-top:20px">
            <a href="/test-framework-mvc/test/sprint10_index" style="color:#667eea;font-weight:bold;text-decoration:none">← Retour aux tests Sprint 10</a>
        </p>
    </div>
</body>
</html>