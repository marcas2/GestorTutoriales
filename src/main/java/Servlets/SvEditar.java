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
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(name = "SvEditar", urlPatterns = {"/SvEditar"})
public class SvEditar extends HttpServlet {

     Gestiones gestionar = new Gestiones();
     GestionCategorias ges = new GestionCategorias();
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
             Tutorial conn = gestionar.obtenerTutorial(Integer.parseInt(request.getParameter("id")));

            if(conn!=null){
                
                String tutorialHTML = "<label for=\"validationCustom01\" class=\"form-label\">Nombre</label>\n"
                        + "<input name=\"id\" value=\"" + conn.getId() + "\" hidden required>\n"
                        + "<input type=\"text\" class=\"form-control\" id=\"validationCustom01\" name=\"nombre\" value=\"" + conn.getNombre() + "\" required>\n"
                        + "<label for=\"validationCustomUsername\" class=\"form-label\">Prioridad</label>\n"
                        + "<select class=\"form-select\" id=\"validationCustomUsername\" name=\"prioridad\" required>\n"
                        + "    <option selected disabled value=\"\">Selecciona una prioridad</option>\n"
                        + "    <option value=\"1\">1</option>\n"
                        + "    <option value=\"2\">2</option>\n"
                        + "    <option value=\"3\">3</option>\n"
                        + "    <option value=\"4\">4</option>\n"
                        + "    <option value=\"5\">5</option>\n"
                        + "    <option value=\"6\">6</option>\n"
                        + "    <option value=\"7\">7</option>\n"
                        + "    <option value=\"8\">8</option>\n"
                        + "    <option value=\"9\">9</option>\n"
                        + "    <option value=\"10\">10</option>\n"
                        + "</select>\n"
                        + "<label for=\"validationCustom05\" class=\"form-label\">Estado</label>\n"
                        + "<select class=\"form-select\" id=\"validationCustom05\" name=\"estado\" required>\n"
                        + "    <option selected disabled value=\"\">Selecciona un estado</option>\n"
                        + "    <option value=\"Activo\">Activo</option>\n"
                        + "    <option value=\"Inactivo\">Inactivo</option>\n"
                        + "    <option value=\"Pendiente\">Pendiente</option>\n"
                        + "</select>\n"
                        + "<label for=\"validationCustom04\" class=\"form-label\">Categoría</label>\n"
                        + "<select class=\"form-select\" id=\"validationCustom04\" name=\"categoria\" required>\n"
                        + "    <option selected disabled value=\"\">Elige...</option>\n";

                ArrayList<Categoria> result2 = ges.getCategorias();
                // Iterar sobre los resultados y mostrarlos en la tabla
                for (Categoria cat2 : result2) {
                    tutorialHTML += "<option value=\"" + cat2.getId() + "\">" + cat2.getCategoria() + "</option>\n";
                }

                tutorialHTML += "</select>\n"
                        + "<label for=\"validationCustom05\" class=\"form-label\">URL</label>\n"
                        + "<input type=\"text\" class=\"form-control\" id=\"validationCustom05\" name=\"url\" value=\"" + conn.getUrl() + "\" required>\n"
                        + "<div class=\"form-check\">\n"
                        + "    <input class=\"form-check-input\" type=\"checkbox\" value=\"\" id=\"invalidCheck\" required>\n"
                        + "    <label class=\"form-check-label\" for=\"invalidCheck\">\n"
                        + "        Acepto los términos y condiciones\n"
                        + "    </label>\n"
                        + "    <div class=\"invalid-feedback\">\n"
                        + "        Debes aceptar.\n"
                        + "    </div>\n"
                        + "</div>\n"
                        + "<div class=\"col-12\">\n"
                        + "    <center><button class=\"btn btn-outline-success\" type=\"submit\">Agregar</button></center>\n"
                        + "</div>";


                // Establecer el tipo de contenido de la respuesta
            response.setContentType("text/html; charset=UTF-8");
            // Escribir la cadena HTML en el cuerpo de la respuesta
            response.getWriter().write(tutorialHTML);
            }else {
                /// Manejar el caso en el que el objeto es nulo
                response.setContentType("text/plain");// Establecer el tipo de contenido como texto plano
                response.getWriter().write("Contacto no encontrado"); // Escribir un mensaje indicando que el contacto no está disponible
            }
              
         } catch (SQLException ex) {
             Logger.getLogger(SvEditar.class.getName()).log(Level.SEVERE, null, ex);
         } catch (ClassNotFoundException ex) {
             Logger.getLogger(SvEditar.class.getName()).log(Level.SEVERE, null, ex);
         }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          int id=Integer.parseInt(request.getParameter("id")) ;
          String nombre= request.getParameter("nombre");
          int prioridad=Integer.parseInt(request.getParameter("prioridad")) ;
          String estado= request.getParameter("estado");
          int categoria= Integer.parseInt(request.getParameter("categoria"));
          String url= request.getParameter("url");
          
         try {
             gestionar.editar(id, nombre, categoria, url, prioridad, estado);
              response.sendRedirect("tutoriales.jsp?alert=editado"); // Redirigir a una página de éxito
         } catch (SQLException ex) {
             Logger.getLogger(SvEditar.class.getName()).log(Level.SEVERE, null, ex);
         }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
