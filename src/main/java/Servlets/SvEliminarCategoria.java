/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

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
@WebServlet(name = "SvEliminarCategoria", urlPatterns = {"/SvEliminarCategoria"})
public class SvEliminarCategoria extends HttpServlet {
     Gestiones gestionar = new Gestiones();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    /**
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           int id= Integer.parseInt(request.getParameter("id"));
     try {
         gestionar.eliminarCategoria(id);
          response.sendRedirect("categoria.jsp?alert=eliminado"); // Redirigir a una página de éxito
     } catch (SQLException ex) {
         Logger.getLogger(SvEliminar.class.getName()).log(Level.SEVERE, null, ex);
     }
    }

    /**
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
