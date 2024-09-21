import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try {
            Connection conn = DatabaseConnection.getConnection();
            // Aquí iría la lógica de autenticación
            // Si es exitosa, redirigir al dashboard correspondiente
            response.sendRedirect("dashboard-alumno.jsp");
        } catch (SQLException e) {
            throw new ServletException("Error de base de datos", e);
        }
    }
}