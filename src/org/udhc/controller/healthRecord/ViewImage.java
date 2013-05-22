/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.udhc.controller.healthRecord;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.imgscalr.Scalr;
import org.udhc.models.HealthRecord;

/**
 *
 * @author root
 */
public class ViewImage extends HttpServlet {

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
        response.setContentType("image/png");
      //  PrintWriter out = response.getWriter();
         OutputStream o = response.getOutputStream();
        byte imbytes[]=null;
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            
            int file_id=Integer.parseInt(request.getParameter("file_id"));
            String scale_req=request.getParameter("scale");
            int scale=800;
            if(scale_req != null){
            	scale= Integer.parseInt(scale_req);
            }
            
            //InputStream image= HealthRecord.getImageData(file_id);
           // imbytes=HealthRecord.getImageData(file_id);
            
            InputStream my_image = HealthRecord.getImageStream(file_id);
            BufferedImage img = ImageIO.read(my_image); // load image
            BufferedImage scaledImg = Scalr.resize(img,scale);
            
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(scaledImg, "jpg", baos );
            baos.flush();
            byte[] imageInByte = baos.toByteArray();
            baos.close();
            o.write(imageInByte);
            
           
            //o.write(imbytes);
            o.flush();
            o.close();            

        } 
        catch(Exception e)
        {
         System.err.println(e.toString())   ;
        }
        finally {            
            o.close();
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
