package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/control_asistencias"; // Cambia "control_asistencia" por tu DB
    private static final String USER = "root"; // Cambia por tu usuario de DB
    private static final String PASSWORD = ""; // Cambia por tu contraseña

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Asegúrate de usar el nombre correcto del driver
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Conexión exitosa a la base de datos");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al conectar con la base de datos");
            e.printStackTrace();
        }
        return connection;
    }
}
