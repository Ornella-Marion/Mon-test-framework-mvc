<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mg.etu3273.test.model.Employee" %>
<%@ page import="mg.etu3273.test.model.Department" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${titre}</title>
    <style>
        body{font-family:Arial;margin:40px;background:#9b59b6}
        .box{background:white;padding:30px;border-radius:10px;max-width:700px;margin:0 auto}
        h1{color:#9b59b6}
        .badge{background:#f39c12;color:white;padding:5px 15px;border-radius:20px;display:inline-block;margin-bottom:20px}
        .object-section{background:#f8f9fa;padding:20px;margin:20px 0;border-radius:8px;border-left:4px solid #9b59b6}
        table{width:100%;border-collapse:collapse;margin:15px 0}
        th{background:#9b59b6;color:white;padding:12px;text-align:left}
        td{padding:10px;border-bottom:1px solid #ddd}
    </style>
</head>
<body>
    <div class="box">
        <h1> ${titre}</h1>
        <span class="badge">${sprint}</span>

        <div style="background:#d1f2eb;padding:15px;border-radius:8px;margin:20px 0;border-left:4px solid #27ae60">
            <strong> Sprint 8-bis - Test 3 :</strong> Le framework a reçu <strong>3 objets différents</strong> simultanément !
        </div>

        <%
            Employee employee = (Employee) request.getAttribute("employee");
            Department department = (Department) request.getAttribute("department");
            Integer id = (Integer) request.getAttribute("id");
        %>

        <!-- Objet 1 : Employee -->
        <% if (employee != null) { %>
        <div class="object-section">
            <h3 style="margin-top:0;color:#9b59b6"> Objet 1 : Employee e</h3>
            <table>
                <tr>
                    <th>Attribut</th>
                    <th>Valeur</th>
                </tr>
                <tr>
                    <td><strong>Nom</strong></td>
                    <td><%= employee.getNom() %></td>
                </tr>
                <tr>
                    <td><strong>Âge</strong></td>
                    <td><%= employee.getAge() != null ? employee.getAge() : "<em>null</em>" %></td>
                </tr>
                <tr>
                    <td><strong>Salaire</strong></td>
                    <td><%= employee.getSalaire() != null ? String.format("%.2f Ar", employee.getSalaire()) : "<em>null</em>" %></td>
                </tr>
            </table>
        </div>
        <% } %>

        <!-- Objet 2 : Department -->
        <% if (department != null) { %>
        <div class="object-section" style="border-left-color:#3498db">
            <h3 style="margin-top:0;color:#3498db"> Objet 2 : Department d</h3>
            <table>
                <tr>
                    <th>Attribut</th>
                    <th>Valeur</th>
                </tr>
                <tr>
                    <td><strong>Nom</strong></td>
                    <td><%= department.getNom() %></td>
                </tr>
                <tr>
                    <td><strong>Code</strong></td>
                    <td><%= department.getCode() %></td>
                </tr>
                <tr>
                    <td><strong>Budget</strong></td>
                    <td><%= department.getBudget() != null ? department.getBudget() + " Ar" : "<em>null</em>" %></td>
                </tr>
            </table>
        </div>
        <% } %>

        <!-- DEBUG : Afficher tous les attributs -->
        <div style="background:yellow;padding:10px;margin:20px 0">
            <strong>DEBUG - Attributs disponibles :</strong><br>
            employee: <%= request.getAttribute("employee") %><br>
            department: <%= request.getAttribute("department") %><br>
            id: <%= request.getAttribute("id") %><br>
            id == null ? <%= (request.getAttribute("id") == null) %><br>
        </div>

        <!-- Paramètre 3 : Integer -->
        <% if (id != null) { %>
        <div class="object-section" style="border-left-color:#e74c3c">
            <h3 style="margin-top:0;color:#e74c3c"> Paramètre 3 : Integer id</h3>
            <p style="font-size:20px;margin:10px 0"><strong>Valeur :</strong> <%= id %></p>
            <p style="color:#666;font-size:14px">Type : Integer (converti automatiquement depuis String)</p>
        </div>
        <% } %>

        <div style="background:#e7f3ff;padding:20px;border-radius:8px;margin:20px 0">
            <strong> Sprint 8-bis : Injection réussie !</strong>
            <ol style="margin:15px 0;line-height:1.8">
                <li>Le framework a analysé la signature : <code>save(Employee e, Department d, Integer id)</code></li>
                <li>Il a détecté 3 paramètres de types différents</li>
                <li>Il a créé : <code>Employee e = new Employee()</code></li>
                <li>Il a rempli e.nom, e.age, e.salaire depuis <code>e.nom</code>, <code>e.age</code>, etc.</li>
                <li>Il a créé : <code>Department d = new Department()</code></li>
                <li>Il a rempli d.nom, d.code, d.budget depuis <code>d.nom</code>, <code>d.code</code>, etc.</li>
                <li>Il a récupéré <code>id</code> et l'a converti en Integer</li>
                <li>Il a invoqué : <code>controller.saveMultiple(e, d, id)</code></li>
            </ol>
        </div>

        <p><a href="/test-framework-mvc/sprint8bis/form-multiple" style="color:#9b59b6;font-weight:bold">← Retour au formulaire</a></p>
    </div>
</body>
</html>