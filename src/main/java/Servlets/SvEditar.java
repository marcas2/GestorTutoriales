/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Gestiones;
import Clases.Tutorial;
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
@WebServlet(name = "SvEditar", urlPatterns = {"/SvEditar"})
public class SvEditar extends HttpServlet {

     Gestiones gestionar = new Gestiones();
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
             Tutorial conn = gestionar.obtenerTutorial(Integer.parseInt(request.getParameter("id")));

            if(conn!=null){
                String tutorialHTML =" <form class=\"row g-3 needs-validation\"  action=\"SvEditar\" method=\"POST\" novalidate>\n" +
"                    \n" +
"                      <label for=\"validationCustom01\" class=\"form-label\">Nombre</label>\n" +
                       "<input name=\"id\" value=\""+conn.getId()+"\" hidden required>"+
"                      <input type=\"text\" class=\"form-control\" id=\"validationCustom01\" name=\"nombre\" value=\""+conn.getNombre()+"\" required>\n" +
"                      <div class=\"valid-feedback\">\n" +
"                        Se mira bien!\n" +
"                      </div>\n" +
"                      <div class=\"invalid-feedback\">\n" +
"                          Ingresa algo valido.\n" +
"                        </div>\n" +
"                   \n" +
"                      <label for=\"validationCustomUsername\" class=\"form-label\">Prioridad</label>\n" +
"                      <div class=\"input-group has-validation\">\n" +
"                        <span class=\"input-group-text\" id=\"inputGroupPrepend\">@</span>\n" +
"                        <input type=\"number\" class=\"form-control\" id=\"validationCustomUsername\" aria-describedby=\"inputGroupPrepend\" name=\"prioridad\" value=\""+conn.getPrioridad()+"\" required>\n" +
"                        <div class=\"valid-feedback\">\n" +
"                        Se mira bien!\n" +
"                        </div>\n" +
"                        <div class=\"invalid-feedback\">\n" +
"                          Ingresa algo valido.\n" +
"                        </div>\n" +
"                      </div>\n" +
"                   \n" +
"                      <label for=\"validationCustom05\" class=\"form-label\">Estado</label>\n" +
"                      <input type=\"text\" class=\"form-control\" id=\"validationCustom05\" name=\"estado\" value=\""+conn.getEstado()+"\" required>\n" +
"                      <div class=\"valid-feedback\">\n" +
"                        Se mira bien!\n" +
"                      </div>\n" +
"                      <div class=\"invalid-feedback\">\n" +
"                        Ingresa algo valido.\n" +
"                      </div>\n" +
"                 \n" +
"                      <label for=\"validationCustom04\" class=\"form-label\">Categoria</label>\n" +
"                      <select class=\"form-select\" id=\"validationCustom04\" name=\"categoria\" required>\n" +
"                        <option selected value=\""+conn.getCategoria()+"\">"+conn.getCategoria()+"\"</option>\n" +
"                        <option value=\"1\">Logica de programacion</option>\n" +
"                        <option value=\"2\">Flutter</option>\n" +
"                        <option value=\"3\">Node.js</option>\n" +
"                      </select>\n" +
"                      <div class=\"valid-feedback\">\n" +
"                        Se mira bien!\n" +
"                      </div>\n" +
"                      <div class=\"invalid-feedback\">\n" +
"                        Ingresa algo valido.\n" +
"                      </div>\n" +
"                      \n" +
"                      <label for=\"validationCustom05\" class=\"form-label\">URL</label>\n" +
"                      <input type=\"text\" class=\"form-control\" id=\"validationCustom05\" name=\"url\" value=\""+conn.getUrl()+"\" required>\n" +
"                      <div class=\"valid-feedback\">\n" +
"                        Se mira bien!\n" +
"                      </div>\n" +
"                      <div class=\"invalid-feedback\">\n" +
"                        Ingresa algo valido.\n" +
"                      </div>\n" +
"                      <div class=\"form-check\">\n" +
"                        <input class=\"form-check-input\" type=\"checkbox\" value=\"\" id=\"invalidCheck\" required>\n" +
"                        <label class=\"form-check-label\" for=\"invalidCheck\">\n" +
"                          Acepto los terminos y condiciones\n" +
"                        </label>\n</div>" +
"                        <div class=\"invalid-feedback\">\n" +
"                          Debes aceptar.\n" +
"                        </div>\n" +
"                      </div>\n" +
"                  \n" +
"                    <div class=\"col-12\">\n" +
"                        <center><button class=\"btn btn-outline-success\" type=\"submit\">Agregar</button></center>\n" +
"                    </div>\n" +
"                  </form>";
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
