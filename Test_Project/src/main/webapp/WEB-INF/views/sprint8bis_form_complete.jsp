<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${titre}</title>
    <style>
        body{font-family:Arial;margin:40px;background:linear-gradient(135deg, #667eea 0%, #764ba2 100%)}
        .box{background:white;padding:30px;border-radius:10px;max-width:700px;margin:0 auto;box-shadow:0 10px 40px rgba(0,0,0,0.2)}
        h1{color:#667eea;margin:0 0 20px 0}
        .info{background:linear-gradient(135deg, #e0c3fc 0%, #8ec5fc 100%);padding:20px;border-radius:8px;margin-bottom:25px;color:#333}
        .section{background:#f8f9fa;padding:20px;border-radius:8px;margin:20px 0;border-left:4px solid #667eea}
        .form-group{margin:15px 0}
        label{display:block;font-weight:bold;margin-bottom:5px;color:#333}
        input[type="text"], input[type="number"]{width:100%;padding:12px;border:2px solid #ddd;border-radius:5px;box-sizing:border-box;transition:border 0.3s}
        input:focus{border-color:#667eea;outline:none}
        button{background:linear-gradient(135deg, #667eea 0%, #764ba2 100%);color:white;padding:15px 40px;border:none;border-radius:5px;cursor:pointer;margin-top:20px;font-size:16px;font-weight:bold;box-shadow:0 4px 15px rgba(102,126,234,0.4)}
        button:hover{transform:translateY(-2px);box-shadow:0 6px 20px rgba(102,126,234,0.6)}
        .checkbox-group{padding:15px;border:2px dashed #ddd;border-radius:8px;background:white}
        .checkbox-item{display:block;margin:10px 0}
    </style>
</head>
<body>
    <div class="box">
        <h1> ${titre}</h1>
        
        <div class="info">
            <strong style="font-size:18px"> Sprint 8-bis - Test 5 : TEST COMPLET</strong><br><br>
            Ce formulaire combine <strong>TOUS les types de binding</strong> :<br>
             Objet simple<br>
             Objet imbriqué (Department)<br>
             Liste (Hobbies)<br>
             Conversion de types automatique
        </div>

        <form action="/test-framework-mvc/sprint8bis/save-complete" method="POST">
            <div class="section">
                <h3 style="margin-top:0;color:#667eea"> Informations personnelles</h3>
                
                <div class="form-group">
                    <label>Nom complet (e.nom) :</label>
                    <input type="text" name="e.nom" value="Marie Rasoanaivo" required>
                </div>
                
                <div class="form-group">
                    <label>Âge (e.age) :</label>
                    <input type="number" name="e.age" value="32" required>
                </div>
                
                <div class="form-group">
                    <label>Salaire mensuel en Ar (e.salaire) :</label>
                    <input type="number" step="0.01" name="e.salaire" value="4500000">
                </div>
            </div>

            <div class="section" style="border-left-color:#3498db">
                <h3 style="margin-top:0;color:#3498db"> Département (objet imbriqué)</h3>
                
                <div class="form-group">
                    <label>Nom du département (e.department.nom) :</label>
                    <input type="text" name="e.department.nom" value="Direction Technique" required>
                </div>
                
                <div class="form-group">
                    <label>Code (e.department.code) :</label>
                    <input type="text" name="e.department.code" value="TECH01" required>
                </div>
                
                <div class="form-group">
                    <label>Budget annuel (e.department.budget) :</label>
                    <input type="number" name="e.department.budget" value="150000000">
                </div>
            </div>

            <div class="section" style="border-left-color:#e74c3c">
                <h3 style="margin-top:0;color:#e74c3c"> Centres d'intérêt (liste)</h3>
                
                <div class="checkbox-group">
                    <label class="checkbox-item">
                        <input type="checkbox" name="e.hobbies" value="Programmation" checked>  Programmation
                    </label>
                    <label class="checkbox-item">
                        <input type="checkbox" name="e.hobbies" value="Lecture technique" checked>  Lecture technique
                    </label>
                    <label class="checkbox-item">
                        <input type="checkbox" name="e.hobbies" value="Veille technologique" checked>  Veille technologique
                    </label>
                    <label class="checkbox-item">
                        <input type="checkbox" name="e.hobbies" value="Sport">  Sport
                    </label>
                    <label class="checkbox-item">
                        <input type="checkbox" name="e.hobbies" value="Voyage">  Voyage
                    </label>
                </div>
            </div>
            
            <button type="submit"> Enregistrer (Test Complet)</button>
        </form>

        <div style="margin-top:30px;background:#d4edda;padding:20px;border-radius:8px;border-left:4px solid#27ae60">
            <strong style="font-size:16px"> Ce que fait le framework automatiquement :</strong>
            <ol style="margin:15px 0;line-height:1.8">
                <li>Détecte que <code>e</code> est un objet <code>Employee</code></li>
                <li>Crée une instance : <code>Employee e = new Employee()</code></li>
                <li>Remplit les attributs simples : <code>e.setNom(...)</code>, <code>e.setAge(...)</code></li>
                <li>Convertit automatiquement les types : String → Integer, String → Double</li>
                <li>Détecte l'objet imbriqué <code>department</code></li>
                <li>Crée : <code>Department d = new Department()</code></li>
                <li>Remplit le département et l'associe : <code>e.setDepartment(d)</code></li>
                <li>Détecte la liste <code>hobbies</code></li>
                <li>Récupère toutes les valeurs cochées</li>
                <li>Crée et remplit : <code>List&lt;String&gt; list = Arrays.asList(...)</code></li>
                <li>Associe : <code>e.setHobbies(list)</code></li>
                <li>Invoque le contrôleur : <code>controller.saveComplete(e)</code></li>
            </ol>
            <strong style="color:#27ae60"> TOUT ÇA SANS UNE SEULE LIGNE DE CODE DU DÉVELOPPEUR !</strong>
        </div>

        <p style="margin-top:20px;text-align:center">
            <a href="/test-framework-mvc/sprint8bis/form-list" style="color:#667eea;font-weight:bold">← Test 4</a>
        </p>
    </div>
</body>
</html>


