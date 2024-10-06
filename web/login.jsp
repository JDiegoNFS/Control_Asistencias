<%-- 
    Document   : login
    Created on : 15 set. 2024, 12:46:47
    Author     : AsturiasNFS
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
    <div class="container">
        <h2>Iniciar Sesión</h2>
        <!-- El formulario envía los datos al LoginServlet usando POST -->
        <form action="LoginServlet" method="post">
            <input type="email" name="username" placeholder="Correo" required> <!-- Se recomienda correo en lugar de usuario -->
            <input type="password" name="password" placeholder="Contraseña" required>
            <input type="submit" value="Iniciar Sesión">
        </form>
        <% if(request.getParameter("error") != null) { %>
            <p style="color: red;">Credenciales incorrectas. Intenta nuevamente.</p>
        <% } %>
    </div>
</body>
</html>

