/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.udhc.gen;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.udhc.models.*;

/**
 *
 * @author root
 */
public class CatchReport extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        
        try {
                List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                InputStream image_report=null;
                String description="";
                String patient_id="";


                String fieldname;
                String fieldvalue=""; ;
                InputStream filecontent=null ;
                for (FileItem item : items) {
                    if (item.isFormField()) {

                        fieldname = item.getFieldName();
                        fieldvalue = item.getString();

                        if( fieldname.equals("description"))
                        {
                            description=fieldvalue;
                            System.out.println(description);
                        }
                        else if(fieldname.equals("patient_id"))
                        {
                            patient_id=fieldvalue;
                            System.out.println(patient_id);
                        }

                    } 
                    else {

                        String filename = (item.getName());
                        System.out.println("....non-form-field...."+filename);
                        image_report = item.getInputStream();

                    }
               }
                
               org.udhc.models.Report r=new org.udhc.models.Report(User.getLoggedInUserEmail(request),patient_id,description, image_report) ;
               System.out.println(r.insertReport());
    }    
            
     catch (Exception e) {
        throw new ServletException("Cannot parse multipart request.", e);
    
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
