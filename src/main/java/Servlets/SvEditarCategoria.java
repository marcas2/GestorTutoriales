/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Categoria;
import Clases.Gestiones;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "SvEditarCategoria", urlPatterns = {"/SvEditarCategoria"})
public class SvEditarCategoria extends HttpServlet {
    Gestiones gestionar = new Gestiones();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Categoria conn = gestionar.obtenerCategoria(Integer.parseInt(request.getParameter("id")));//Se obtiene la informacion de la Categoria
            
             if (conn != null) {
            // Construir una cadena HTML con información de la categoria
            String tutorialHtml = "<div >\n" +
"                      <input name=\"id\" value=\"" + conn.getId() + "\" hidden required>\n"+
"                      <label for=\"validationCustom01\" class=\"form-label\">Categoria</label>\n" +
"                      <input type=\"text\" class=\"form-control\" id=\"validationCustom01\" name=\"categoria\" value=\"" + conn.getCategoria() + "\"  required>\n" +
"                    </div>\n <br>" +
"                    <div class=\"col-12\">\n" +
"                        <center><button class=\"btn btn-outline-success\" type=\"submit\">Agregar</button></center>\n" +
"                    </div>";
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
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         int id=Integer.parseInt(request.getParameter("id")) ;
         String categoria= request.getParameter("categoria");
          
         try {
             gestionar.editarCategoria(id, categoria);
              response.sendRedirect("categoria.jsp?alert=editado"); // Redirigir a una página de éxito
         } catch (SQLException ex) {
             Logger.getLogger(SvEditar.class.getName()).log(Level.SEVERE, null, ex);
         }
    }

    /**
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
