<%-- 
    Document   : index
    Created on : 15 set. 2024, 12:16:31
    Author     : AsturiasNFS
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sistema de Control de Asistencia</title>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
    <script>
        function actualizarReloj() {
            const fecha = new Date();
            let horas = fecha.getHours();
            let minutos = fecha.getMinutes();
            let segundos = fecha.getSeconds();
            horas = horas < 10 ? '0' + horas : horas;
            minutos = minutos < 10 ? '0' + minutos : minutos;
            segundos = segundos < 10 ? '0' + segundos : segundos;
            document.getElementById('reloj').innerText = horas + ':' + minutos + ':' + segundos;
        }

        setInterval(actualizarReloj, 1000); // Actualiza el reloj cada segundo
    </script>
</head>
<body>
    <!-- Contenedor para el reloj -->
    <div id="reloj" class="reloj"></div>

    <div class="container">
        <img src="imagenes/logo.jpg" alt="Logo del Sistema" class="logo">
        <h1>Bienvenido al Sistema de Control de Asistencia</h1>
        <a href="login.jsp" class="btn">Iniciar Sesión</a>
    </div>
</body>
</html>
