/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * GestionCategorias
 * @author María- Sofia
 */
public class GestionCategorias {
     /**
     * getCategorias
     * Metodo para poner la informacion de la base de datos en un array
     * @return data
     * @throws ClassNotFoundException 
     */
     public ArrayList<Categoria> getCategorias() throws ClassNotFoundException {
        ArrayList<Categoria> array= new ArrayList();
        Gestiones ges= new Gestiones();
        try {
            // Establecer conexión con la base de datos
            Connection connection = ges.establecerConexion();

            // Consulta SQL para obtener datos de la tabla tutorial
            String sqlTutorial = "SELECT * FROM categoria";


            // Crear una declaración para la consulta de tutoriales
            Statement statementTutorial = connection.createStatement();
            ResultSet resultSetTutorial = statementTutorial.executeQuery(sqlTutorial);
            
            
            
            // Iterar sobre los resultados de tutoriales y almacenarlos en el array
            while (resultSetTutorial.next()) {
                Categoria cat= new Categoria ();
                cat.setId(resultSetTutorial.getInt("id"));
                if(resultSetTutorial.getString("categoria")!=null){
                cat.setCategoria(resultSetTutorial.getString("categoria"));}
                else{
                    cat.setCategoria("No hay categoria");
                }
                System.out.println("---"+cat.getId()+cat.getCategoria());
                array.add(cat);
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
     /**
      * ObtenerCategoria
      * Metodo para obtener una categoria
      * @param id
      * @return
      * @throws SQLException 
      */
      public Categoria obtenerCategoria (int id) throws SQLException{
         Categoria cat=new Categoria();
         Gestiones ges= new Gestiones();
          Connection connection = ges.establecerConexion();
          // Consulta SQL para obtener datos de la tabla tutorial
          String sqlTutorial = "SELECT * FROM categoria where categoria.id="+id ;
          // Crear una declaración para la consulta de tutoriales
          Statement statementTutorial = connection.createStatement();
          ResultSet resultSetTutorial = statementTutorial.executeQuery(sqlTutorial);
            
            
           // Iterar sobre los resultados de tutoriales y almacenarlos en el array
            while (resultSetTutorial.next()) {              
                cat.setId(resultSetTutorial.getInt("id"));              
                cat.setCategoria(resultSetTutorial.getString("categoria"));
            }

            // Cerrar la conexión
            resultSetTutorial.close();
            statementTutorial.close();
            connection.close();
            
          return cat; 
     }
    /**
     * editarCategoria
     * Metodo para editar la categoria
     * @param id
     * @param categoria
     * @throws SQLException 
     */
    public void editarCategoria(int id, String categoria) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    Gestiones ges= new Gestiones();
    try {
        connection = ges.establecerConexion();
        
        // Consulta SQL parametrizada para actualizar la fila
        String sqlTutorial = "UPDATE categoria SET categoria = ? WHERE id = ?";
        
        // Crear una declaración preparada para la consulta de actualización
        preparedStatement = connection.prepareStatement(sqlTutorial);
        
        // Establecer los parámetros de la consulta
        preparedStatement.setString(1, categoria);
        preparedStatement.setInt(2, id);
        
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
    /**
     * eliminarCategoria
     * Metodo para eliminar categoria
     * @param id
     * @throws SQLException 
     */
    public void eliminarCategoria(int id) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    Gestiones ges= new Gestiones();
    try {
        // Establecer la conexión a la base de datos
        connection = ges.establecerConexion();
        
        // Consulta SQL parametrizada para eliminar la fila
        String sqlTutorial = "DELETE FROM categoria WHERE id = ?";
        
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
