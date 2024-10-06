package dao;

import java.sql.*;

public class LoginDAO {

    public boolean validate(String username, String password) {
        boolean isValid = false;

        String jdbcURL = "jdbc:mysql://localhost:3308/control_asistencias";
        String dbUser = "root";
        String dbPassword = "";

        String sql = "SELECT * FROM usuarios WHERE correo = ? AND password = ?";

        try {
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                isValid = true;
            }

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isValid;
    }
}
