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
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Usuario" required>
            <input type="password" name="password" placeholder="Contraseña" required>
            <input type="submit" value="Iniciar Sesión">
        </form>
    </div>
</body>
</html>