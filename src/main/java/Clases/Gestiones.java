/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Gestiones
 * Clase para la conexion con la base de datos
 * @author maria- Sofia
 */
public class Gestiones {
    
    /**
     * Metodo para establecer la conexion con la base de datos
     * @return conexion
     */
    public Connection establecerConexion(){
        //Parametros para la conexion
        String url = "jdbc:mysql://localhost:3306/tutoriales?serverTimeZone=utc";
        String user = "root";
        String password = "admin";
        Connection conn = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url,user,password);
            if (conn!=null) {
                System.out.println("Conexion exitosa");//Bandera para indicar procedimiento exitoso
            }
        } catch (Exception e) {
            //Manejo de excepciones en caso de error
            System.out.println("Error de conexion" + e.getMessage());
        }
        return conn;
    }
    
    /**
     * getTutoriales
     * Metodo para poner la informacion de la base de datos en un array
     * @return data
     * @throws ClassNotFoundException 
     */
     public ArrayList<Tutorial> getTutoriales() throws ClassNotFoundException {
        List<String[]> data = new ArrayList<>();//Array para almacenar
        ArrayList<Tutorial> array= new ArrayList();
        //Parametros para la conecion
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
                Tutorial tut= new Tutorial ();
                tut.setId(resultSetTutorial.getInt("id"));
                tut.setNombre(resultSetTutorial.getString("nombre"));                
                tut.setCategoria(resultSetTutorial.getString("categoria"));
                tut.setUrl(resultSetTutorial.getString("URL"));
                tut.setEstado(resultSetTutorial.getString("estado"));
                tut.setPrioridad(Integer.parseInt(resultSetTutorial.getString("prioridad")));
                array.add(tut);
                //data.add(row);
            }
  
            // Cerrar la conexión
            resultSetTutorial.close();
            statementTutorial.close();
            connection.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejo de excepciones
        }

        return array;
    }
}
