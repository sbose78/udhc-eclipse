package org.udhc.controller.healthRecord;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.udhc.dao.HealthRecordDAO;

/**
 * Servlet implementation class GetConsentLetter
 */
public class GetConsentLetter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetConsentLetter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
				
		
		try{
		
			 OutputStream o = response.getOutputStream();
		       
			 
			 int topic_id = Integer.parseInt(request.getParameter("topic_id"));
			 HealthRecordDAO dao = new HealthRecordDAO();
			 InputStream file=dao.getConsentLetter(topic_id);
	
			 
		//	 response.setContentLength((int)file.getSize());
	
			 response.setContentType("application/octet-stream");//file.getMime());
	
	
	
			 //response.setContentLength(-1);
			 response.setHeader("Content-Transfer-Encoding", "binary");
             response.setHeader("Content-Disposition","attachment; filename=\""+"Consent_letter_ID_"+topic_id+"\"");
	
	
			 byte b[]= IOUtils.toByteArray(file);
	
	
			 o.write(b);
			 o.flush();
			 o.close();

		 }
		 catch(Exception e){
			 e.printStackTrace();
		 }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
