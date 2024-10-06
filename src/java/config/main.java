/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

/**
 *
 * @author AsturiasNFS
 */
import java.sql.Connection;

public class main {
    public static void main(String[] args) {
        // Intentamos obtener la conexión
        Connection connection = DatabaseConnection.getConnection();
        
        // Si la conexión es exitosa, la variable connection no será null
        if (connection != null) {
            System.out.println("La conexión a la base de datos se ha realizado correctamente.");
        } else {
            System.out.println("No se pudo establecer la conexión.");
        }
    }
}


