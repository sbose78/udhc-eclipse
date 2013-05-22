/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.udhc.controller.healthRecord;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.udhc.models.HealthRecord;

/**
 *
 * @author root
 */
public class CatchHealthIssue extends HttpServlet {

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
        
        try{
            String topic = request.getParameter("topic");
            String problem_details = request.getParameter("problem_details");
            String swid= request.getSession().getAttribute("email").toString();
            //insert into database
            
            HealthRecord hr=new HealthRecord(topic,swid,"0",problem_details,0);
            hr.insertHealthRecord();
            
            String to[]={"rakesh7biswas@gmail.com","sbose78@gmail.com","shivika.ch@gmail.com "};
            String subject="[TEST] A new health issue has been uploaded at http://boseapp1.jelastic.servint.net/login.jsp ";
            String content=" Hello moderator, <BR> Please visit the website to check out the issue:  <br>"+topic;
            content+="<br> This is an automated email sent from the UDHC website <br>";
            content+="<br><br>Warm regards, <br> The UDHC Team";
            
            topic="[ care.udhc.co.in ]"+topic;
            problem_details="A new issue has been uploaded at <a href='http://care.udhc.co.in/problem_list.jsp'>UDHC NETWORK</a><br><br>"
                    +problem_details;
            org.udhc.gen.EmailUtil.sendMail("sbose78", to, topic, problem_details);
                   
            response.sendRedirect(request.getContextPath()+"/mySocialUploads.jsp");
        
        } 
        
        catch(Exception e)
        {
            e.toString();
        }
        finally {            
            
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
