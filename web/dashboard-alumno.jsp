<%-- 
    Document   : dashboard-alumno
    Created on : 15 set. 2024, 13:04:39
    Author     : AsturiasNFS
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Marcar Asistencia</title>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
    <div class="container">
        <h2>Marcar Asistencia</h2>
        <form action="MarcarAsistenciaServlet" method="post">
            <input type="submit" value="Marcar Asistencia" class="btn">
        </form>
        <a href="dashboard-alumno.jsp" class="btn">Volver al Dashboard</a>
    </div>
</body>
</html>