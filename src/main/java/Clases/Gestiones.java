/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author maria
 */
public class Gestiones {
    public Connection establecerConexion(){
        String url = "jdbc:mysql://localhost:3306/tutoriales?serverTimeZone=utc";
        String user = "root";
        String password = "admin";
        Connection conn = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url,user,password);
            if (conn!=null) {
                System.out.println("Conexion exitosa");
            }
        } catch (Exception e) {
            System.out.println("Error de conexion" + e.getMessage());
        }
        return conn;
    }
     public List<String[]> getCategoriasAndTutoriales() throws ClassNotFoundException {
        List<String[]> data = new ArrayList<>();
        String url = "jdbc:mysql://localhost:3306/tutoriales?serverTimeZone=utc";
        String user = "root";
        String password = "admin";
        Connection connection = null;
        try {
            // Establecer conexión con la base de datos
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url,user,password);

            // Consulta SQL para obtener datos de la tabla tutorial
            String sqlTutorial = "SELECT * FROM tutorial join categoria on categoria.id=tutorial.idcategoria";

   

            // Crear una declaración para la consulta de tutoriales
            Statement statementTutorial = connection.createStatement();
            ResultSet resultSetTutorial = statementTutorial.executeQuery(sqlTutorial);

            // Iterar sobre los resultados de tutoriales y almacenarlos en el array
            while (resultSetTutorial.next()) {
                String[] row = new String[5]; // Cinco columnas: id, nombre, idCategoria, URL, estado
                row[0] = String.valueOf(resultSetTutorial.getInt("id"));
                row[1] = resultSetTutorial.getString("nombre");
                row[2] = String.valueOf(resultSetTutorial.getString("categoria"));
                row[3] = resultSetTutorial.getString("URL");
                row[4] = resultSetTutorial.getString("estado");
                data.add(row);
            }
  
            // Cerrar la conexión
            resultSetTutorial.close();
            statementTutorial.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejo de excepciones: registro, lanzamiento o propagación
        }

        return data;
    }
}
