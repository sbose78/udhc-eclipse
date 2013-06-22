/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.udhc.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.udhc.gen.EmailUtil;
import org.udhc.models.User;

/**
 *
 * @author root
 */
public class registerUser extends HttpServlet {

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
        
            
            // 0 - caregiver
            // 1 - social worker
            // 2 - care-seeker
            
            int role= Integer.parseInt(request.getParameter("role"));         
            String name=request.getParameter("name");
            String email=request.getSession().getAttribute("email").toString();
            
            if( role == 0)
            {
            	String pincode =request.getParameter("pincode");
            	// add name and role
            	 name = name.trim();
            	 int split_loc=0;
            	 String split_name[]= name.split(" ");
            	 if( !Character.isLetter(name.charAt(0) ))
            	 {
            		 // control enters here only if # or * present in the sci name string
            		 split_loc = 1;
            		 
            	 }
            	 split_name[split_loc]+="-"+pincode+"-";
            	 
            	 name= "";
            	 for( int i =split_loc ;i < split_name.length ;i++){
            		 name=name+split_name[i]+"-";
            	 }
            	System.out.println(name);
            	 
            }
            
            User user=new User(role,email,1,name,"0");
            System.out.println(user.insertUser());
            
            if( role !=0){
            	String body = "Dear moderators, <br><br> A new user : "+email+"  has signed up as a "+User.getRoleName(role)+" . Please visit DASHBOARD and approve . <br><br> - The UDHC team";
            	
            	String emails[]={"sbose78@gmail.com"};
            	EmailUtil.sendMail("sbose78@gmail.com", emails , " [UDHC ] User approval required for "+ name, body);
            	
            }
            
            request.getSession(true).setAttribute("name", name);
            request.getSession(true).setAttribute("role", request.getParameter("role") );
            
            
         
            
            
        }
        
        catch(Exception e )
        {
            
            System.out.println(e.toString());
        
        
        } 
         finally {            
    
        }
        response.sendRedirect(request.getContextPath()+"/AUTH/successful.jsp");
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
