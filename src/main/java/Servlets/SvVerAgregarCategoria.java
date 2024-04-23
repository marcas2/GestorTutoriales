/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Categoria;
import Clases.GestionCategorias;
import Clases.Gestiones;
import Clases.Tutorial;
import java.io.IOException;
import java.io.PrintWriter;
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
 *
 * @author maria
 */
@WebServlet(name = "SvVerAgregarCategoria", urlPatterns = {"/SvVerAgregarCategoria"})
public class SvVerAgregarCategoria extends HttpServlet {
    GestionCategorias gestionar = new GestionCategorias();
    Gestiones ges= new Gestiones();

    /**
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Ver categoria
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Categoria conn = gestionar.obtenerCategoria(Integer.parseInt(request.getParameter("id")));//Se obtiene la informacion de la Categoria
            
             if (conn != null) {
            // Construir una cadena HTML con información de la categoria
            String tutorialHtml = "<center><h2>- CATEGORIA -</h2></center>"+          
                    "<h3> Id:</h3><p> " +conn.getId()+ "</p>" +
                    "<h3> Categoria:</h3><p> " +conn.getCategoria()+ "</p>" 
                 ;
            // Establecer el tipo de contenido de la respuesta
            response.setContentType("text/html; charset=UTF-8");
            // Escribir la cadena HTML en el cuerpo de la respuesta
            response.getWriter().write(tutorialHtml);

            } else {
                /// Manejar el caso en el que el objeto es nulo
                response.setContentType("text/plain");// Establecer el tipo de contenido como texto plano
                response.getWriter().write("Categoria no encontrada"); // Escribir un mensaje indicando que la categoria no está disponible
            }
        } catch (SQLException ex) {
            Logger.getLogger(SvGestiones.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Añadir Categoria
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Establecer la conexión a la base de datos
        Connection conn = ges.establecerConexion();

        if (conn != null) {
            try {
                // Llamar al procedimiento almacenado
                CallableStatement stmt = conn.prepareCall("{call InsertarCategoria(?)}");

                // Establecer parámetros del procedimiento almacenado
                stmt.setString(1, request.getParameter("categoria"));

                // Ejecutar el procedimiento almacenado
                stmt.execute();

                // Cerrar la conexión
                conn.close();

                // Redirigir a alguna página de éxito o mostrar un mensaje de éxito
                response.sendRedirect("index.jsp?alert=anadida"); // Redirigir a una página de éxito
            } catch (SQLException e) {
                // Manejar cualquier error de SQL
                e.printStackTrace(); // Esto imprimirá la traza de la excepción en la consola del servidor
                // Puedes manejar el error de otra manera, como mostrar un mensaje de error en la página
                response.getWriter().println("Error al agregar la categoria. Por favor, inténtelo de nuevo."); 
            }
        } else {
            // Manejar el caso en que no se pueda obtener una conexión a la base de datos
            response.getWriter().println("No se pudo establecer una conexión a la base de datos."); 
        }
    }

    /**
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
