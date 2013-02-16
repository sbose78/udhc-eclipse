/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.udhc.gen;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.udhc.dao.SolutionDAO;
import org.udhc.gen.models.Solution;

/**
 *
 * @author root
 */
public class CatchSolution extends HttpServlet {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {        
		request.setCharacterEncoding("UTF-8");
        String solution_content=request.getParameter("solution_content");
        int topic_id=Integer.parseInt(request.getParameter("topic_id"));
   
        String solution_language = request.getParameter("solution_language");
        String user=User.getLoggedInUserEmail(request);
        
        Solution s = new Solution(topic_id, solution_content, "0", user, solution_language);
    	SolutionDAO dao = new SolutionDAO();
        
        
        
        String isUpdate = request.getParameter("update");
        if(isUpdate!=null && isUpdate.equalsIgnoreCase("true")){
            int solution_id=Integer.parseInt(request.getParameter("solution_id"));
        	// call DAO function to update
        	s = new Solution(solution_id,topic_id, solution_content, "0", user, solution_language);
        	System.out.println(dao.update(s));
        	
        }
        else{
                org.udhc.gen.HealthRecord hr = new org.udhc.gen.HealthRecord();                
                hr.insertSolution(topic_id,solution_content,user);  
                
                // call dao function to insert
                
            	System.out.println(dao.insertSolution(s));
        }
    	
    	//System.out.println(request.getParameter("solution_content")+";"+Integer.parseInt(request.getParameter("topic_id")));
             //   System.out.println(solution_content);
           
               
                response.getOutputStream().println("Thank you . The solution has been recorded.");
                
                //response.sendRedirect(request.getContextPath()+"/SOLUTION/solution.jsp?topic_id="+topic_id);        
    }

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
