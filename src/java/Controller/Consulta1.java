/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.ConsultasDao;
import Model.Director;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistence.DAOException;

/**
 *
 * @author vitor
 */
public class Consulta1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Consulta1</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Consulta1 at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("tle");
        String aux = request.getParameter("count_genres");
        int count_genres = Integer.parseInt(request.getParameter("count_genres"));
        int count_languages = Integer.parseInt(request.getParameter("count_languages"));
               
        
            String array_genres[] = new String[count_genres];
            for(int i = 0; i < count_genres; i++){
                String x = "" + (i + 1);
                array_genres[i] = request.getParameter("genresSelect"+x);
            }
        
            String array_languages[] = new String[count_languages];
            for(int i = 0; i < count_languages; i++){
                String x = "" + (i + 1);
                array_languages[i] = request.getParameter("languagesSelect"+x);
            }
        
        
        try {
            ConsultasDao c1dao = new ConsultasDao();
            ArrayList<Director> directors_list = c1dao.consulta1(title,array_genres,array_languages);
            request.setAttribute("directors_list", directors_list);
            
            RequestDispatcher d = null;
            d = request.getRequestDispatcher("/viewResultConsulta1.jsp");
            d.forward(request, response);
        } catch (DAOException ex) {
            Logger.getLogger(Consulta1.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Consulta1.class.getName()).log(Level.SEVERE, null, ex);
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
