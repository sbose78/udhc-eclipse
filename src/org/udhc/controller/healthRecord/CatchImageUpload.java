package org.udhc.controller.healthRecord;

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
import org.json.simple.*;



/**
 * Servlet implementation class CatchImageUpload
 */
public class CatchImageUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CatchImageUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*
		JSONObject json= new JSONObject();
		json.put("name", "Shoubhik");
		json.put("company", "accenture");
		
		response.setContentType("application/json");
		// Get the printwriter object from response to write the required json object to the output stream      
		PrintWriter out = response.getWriter();
		// Assuming your json object is **jsonObject**, perform the following, it will return your json object  
		out.print(json);
		out.flush();*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
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
        
		response.setContentType("application/json");

          String image_id=org.udhc.models.HealthRecord.insertImageWithName(filecontent,Integer.parseInt(topic_id),file_name);
          System.out.println(image_id);
          JSONObject image_data= new JSONObject();
          image_data.put("image_id", image_id);
          image_data.put("about", file_name);
          
          //response.setStatus(200);
          out.print(image_data);
          
          out.flush();
          //out.println("<br>Successfully uploaded<br>");

          //out.close();

    }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
 }
}
