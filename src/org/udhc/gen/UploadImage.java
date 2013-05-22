/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.udhc.gen;


import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
//ServletFileUpload;
import org.udhc.models.HealthRecord;



/**
 *
 * @author root
 */
public class UploadImage extends HttpServlet {

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
        
        System.out.println("--------------IN SERVLET-----");
        
         PrintWriter out = response.getWriter();

        
    try {
        List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
        
        String file_name="";
        String topic_id="";
        
        String fieldname;
        String fieldvalue=""; ;
        InputStream filecontent=null ;  
        
        // assumption was that there were just 2 fields.
        // now there are 3. Added the file_description too in the form of file_name
        
        for (FileItem item : items) {
            if (item.isFormField()) {
                // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
                fieldname = item.getFieldName();
                fieldvalue = item.getString();
                
                if( fieldname.equals("topic_id") )
                {
                    topic_id=fieldvalue;
                }
                else if( fieldname.equals("file_name"))
                {
                    file_name=fieldvalue;
                }
                
                
                System.out.println(fieldname+"....formfield...."+fieldvalue);
                // ... (do your job here)
            } else {
                // Process form file field (input type="file").
               //ouur String fieldname = item.getFieldName();
                String filename = (item.getName());
                System.out.println("....non-form-field...."+filename);
                 filecontent = item.getInputStream();
                
              
                // ... (do your job here)
            }
        }
        
         
          HealthRecord.insertImageWithName(filecontent,Integer.parseInt(topic_id),file_name);      
          out.println("<br>Successfully uploaded<br>");
          out.close();
          
        //  response.sendRedirect(request.getContextPath()+"/mySocialUploads.jsp");
        
    } catch (Exception e) {
        throw new ServletException("Cannot parse multipart request.", e);
    }

    // ...
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
            throws ServletException, IOException{
        
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
            throws  ServletException, IOException{
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

