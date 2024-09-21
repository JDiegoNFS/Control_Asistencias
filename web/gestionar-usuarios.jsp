<%-- 
    Document   : gestionar-usuarios
    Created on : 15 set. 2024, 13:03:51
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
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Usuario" required><br>
            <input type="password" name="password" placeholder="Contraseña" required><br>
            <input type="submit" value="Iniciar Sesión">
        </form>
    </div>
</body>
</html>