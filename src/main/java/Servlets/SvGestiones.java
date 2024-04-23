/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Gestiones;
import Clases.Tutorial;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *  SvGestiones
 * @author maria - sofia
 */
@WebServlet(name = "SvGestiones", urlPatterns = {"/SvGestiones"})
public class SvGestiones extends HttpServlet {

    Gestiones gestionar = new Gestiones();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {     
    }
    /**
     * Metodo ver 
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Tutorial conn = gestionar.obtenerTutorial(Integer.parseInt(request.getParameter("id")));//Se obtiene la informacion del tutorial
            
             if (conn != null) {
            // Construir una cadena HTML con información del tutorial
            String tutorialHtml = "<h2>Nombre: " + conn.getNombre() + "</h2>"+          
                    "<h3> Id:</h3><p> " +conn.getId()+ "</p>" +
                    "<h3> Categoria:</h3><p> " +conn.getCategoria()+ "</p>" +
                    "<h3> Prioridad:</h3><p> " +conn.getPrioridad()+ "</p>" +
                    "<h3> Estado:</h3><p> " +conn.getEstado()+ "</p>" +
                    "<h3> Url:</h3><p> <a href=\""+conn.getUrl()+" \" target=\"_blank\">Enlace</a></p>" 
                 ;
            // Establecer el tipo de contenido de la respuesta
            response.setContentType("text/html; charset=UTF-8");
            // Escribir la cadena HTML en el cuerpo de la respuesta
            response.getWriter().write(tutorialHtml);

            } else {
                /// Manejar el caso en el que el objeto es nulo
                response.setContentType("text/plain");// Establecer el tipo de contenido como texto plano
                response.getWriter().write("Tutorial no encontrado"); // Escribir un mensaje indicando que el Tutorial no está disponible
            }
        } catch (SQLException ex) {
            Logger.getLogger(SvGestiones.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    /**
     * Añadir tutorial- Mandar informacion a base de datos
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         // Establecer la conexión a la base de datos
        Connection conn = gestionar.establecerConexion();

        if (conn != null) {
            try {
                // Llamar al procedimiento almacenado
                CallableStatement stmt = conn.prepareCall("{call InsertarTutorial(?,?,?,?,?)}");

                // Establecer parámetros del procedimiento almacenado
                stmt.setString(1, request.getParameter("nombre"));
                stmt.setInt(2,Integer.parseInt(request.getParameter("prioridad")) );
                stmt.setString(3,request.getParameter("estado"));
                stmt.setInt(4,  Integer.parseInt(request.getParameter("categoria")));
                stmt.setString(5, request.getParameter("url"));

                // Ejecutar el procedimiento almacenado
                stmt.execute();

                // Cerrar la conexión
                conn.close();

                // Redirigir a alguna página de éxito o mostrar un mensaje de éxito
                response.sendRedirect("index.jsp?alert=anadido"); // Redirigir a una página de éxito
            } catch (SQLException e) {
                // Manejar cualquier error de SQL
                e.printStackTrace(); // Esto imprimirá la traza de la excepción en la consola del servidor
                // Puedes manejar el error de otra manera, como mostrar un mensaje de error en la página
                response.getWriter().println("Error al agregar el tutorial. Por favor, inténtelo de nuevo."); 
            }
        } else {
            // Manejar el caso en que no se pueda obtener una conexión a la base de datos
            response.getWriter().println("No se pudo establecer una conexión a la base de datos."); 
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
