/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.udhc.gen;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.udhc.models.User;
import org.udhc.models.*;

/**
 *
 * @author root
 */
public class CatchForumPost extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            
                int topic_id=Integer.parseInt(request.getParameter("topic_id") );
                String post_data = request.getParameter("post_data") ;
                int post_id =0;//Integer.parseInt(request.getParameter("post_id"));
                String email = User.getLoggedInUserEmail(request);//request.getSession().getAttribute("email").toString();//getParameter("email");
                int voteups = 0;
                int votedowns =0;
                String date = "0";
                
                ForumPost fp=new ForumPost(post_id,topic_id,post_data,email,voteups,votedowns,date);
                
                String status = fp.insertForumPost();                    
                
            
            
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>CatchForumPost</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CatchForumPost at " + request.getContextPath() + "</h1>"+status);
            out.println("</body>");
            out.println("</html>");
            
          //  response.sendRedirect(request.getServletContext()+"/network.jsp?topic_id="+topic_id);
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
