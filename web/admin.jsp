<%-- 
    Document   : admin
    Created on : 5 oct. 2024, 08:05:14
    Author     : AsturiasNFS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Panel de Administración</title>
</head>
<body>
    <h2>Bienvenido al Panel de Administración</h2>
    
    <%
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("correo") == null) {
            response.sendRedirect("login.jsp");
        } else {
            out.print("Usuario: " + session.getAttribute("correo"));
        }
    %>
    
    <!-- Aquí puedes agregar opciones para el registro de usuarios y otras funciones del admin -->
</body>
</html>