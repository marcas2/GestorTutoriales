/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
        ArrayList<Tutorial> array= new ArrayList();
        try {
            // Establecer conexión con la base de datos
            Connection connection = establecerConexion();

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
     public Tutorial obtenerTutorial (int id) throws SQLException{
         Tutorial tut=new Tutorial();
          Connection connection = establecerConexion();
          // Consulta SQL para obtener datos de la tabla tutorial
          String sqlTutorial = "SELECT * FROM tutorial join categoria on categoria.id=tutorial.idcategoria where tutorial.id="+id ;
          // Crear una declaración para la consulta de tutoriales
          Statement statementTutorial = connection.createStatement();
          ResultSet resultSetTutorial = statementTutorial.executeQuery(sqlTutorial);
            
            
            
           // Iterar sobre los resultados de tutoriales y almacenarlos en el array
            while (resultSetTutorial.next()) {              
                tut.setId(resultSetTutorial.getInt("id"));
                tut.setNombre(resultSetTutorial.getString("nombre"));                
                tut.setCategoria(resultSetTutorial.getString("categoria"));
                tut.setUrl(resultSetTutorial.getString("URL"));
                tut.setEstado(resultSetTutorial.getString("estado"));
                tut.setPrioridad(Integer.parseInt(resultSetTutorial.getString("prioridad")));
            }

            // Cerrar la conexión
            resultSetTutorial.close();
            statementTutorial.close();
            connection.close();
            
          return tut; 
     }
     
  public void editar(int id, String nombre, int idCat, String url, int prioridad, String estado) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    
    try {
        connection = establecerConexion();
        
        // Consulta SQL parametrizada para actualizar la fila
        String sqlTutorial = "UPDATE tutorial SET nombre = ?, idCategoria = ?, URL = ?, prioridad = ?, estado = ? WHERE id = ?";
        
        // Crear una declaración preparada para la consulta de actualización
        preparedStatement = connection.prepareStatement(sqlTutorial);
        
        // Establecer los parámetros de la consulta
        preparedStatement.setString(1, nombre);
        preparedStatement.setInt(2, idCat);
        preparedStatement.setString(3, url);
        preparedStatement.setInt(4, prioridad);
        preparedStatement.setString(5, estado);
        preparedStatement.setInt(6, id);
        
        // Ejecutar la consulta de actualización
        int filasActualizadas = preparedStatement.executeUpdate();
        
        if (filasActualizadas > 0) {
            System.out.println("La fila fue actualizada exitosamente.");
        } else {
            System.out.println("No se encontró la fila a actualizar.");
        }
    } finally {
        // Cerrar los recursos en un bloque finally
        if (preparedStatement != null) {
            preparedStatement.close();
        }
        if (connection != null) {
            connection.close();
        }
    }
}
public void eliminar(int id) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    
    try {
        // Establecer la conexión a la base de datos
        connection = establecerConexion();
        
        // Consulta SQL parametrizada para eliminar la fila
        String sqlTutorial = "DELETE FROM tutorial WHERE id = ?";
        
        // Crear una declaración preparada para la consulta de eliminación
        preparedStatement = connection.prepareStatement(sqlTutorial);
        
        // Establecer el parámetro de la consulta
        preparedStatement.setInt(1, id);
        
        // Ejecutar la consulta de eliminación
        int filasEliminadas = preparedStatement.executeUpdate();
        
        if (filasEliminadas > 0) {
            System.out.println("La fila fue eliminada exitosamente.");
        } else {
            System.out.println("No se encontró la fila a eliminar.");
        }
    } finally {
        // Cerrar los recursos en un bloque finally
        if (preparedStatement != null) {
            preparedStatement.close();
        }
        if (connection != null) {
            connection.close();
        }
    }
}

}
