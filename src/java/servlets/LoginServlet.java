package config;

import dao.LoginDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        LoginDAO loginDAO = new LoginDAO();

        if (loginDAO.validate(username, password)) {
            response.sendRedirect("welcome.jsp");
        } else {
            response.sendRedirect("login.jsp?error=true");
        }
    }
}
