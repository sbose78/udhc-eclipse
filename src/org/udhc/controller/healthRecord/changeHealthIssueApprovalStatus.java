package org.udhc.controller.healthRecord;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.udhc.gen.EmailUtil;
import org.udhc.models.HealthRecord;

/**
 * Servlet implementation class changeHealthIssueApprovalStatus
 */
public class changeHealthIssueApprovalStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changeHealthIssueApprovalStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int topic_id = Integer.parseInt(request.getParameter("topic_id"));
		String approve_to=(request.getParameter("approve_to"));
		String uploader = (request.getParameter("uploader"));
		System.out.println(approve_to);
		int final_approval_status = approve_to.equals("approve")?1:0;
		
		int transaction_status=HealthRecord.updateHealthIssueApprovalStatus(topic_id, final_approval_status);
		
		String to[] = {uploader};
		System.out.println(uploader);
		
		/*
		if( final_approval_status == 1)
		{
			try {
				
				InputStream inputStream= Thread.currentThread().getContextClassLoader().getResourceAsStream("issue-approval-mail.html");
			    StringWriter writer = new StringWriter();
			    IOUtils.copy(inputStream, writer, "utf8");
			    String auto_mailer = writer.toString()+"\n\n";
			    System.out.println(auto_mailer);				
				
				EmailUtil.sendMail("", to," Thank you for uploading your health issue ", auto_mailer);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		*/
		
		JSONArray jsonarray= new JSONArray();
		JSONObject status = new JSONObject();
		
		status.put("topic_id", topic_id);
		status.put("approved", final_approval_status);
		status.put("status",transaction_status );
		
		jsonarray.add(status);
		
		
		
		response.setContentType("application/json");
		
		PrintWriter out= response.getWriter();
		System.out.println(jsonarray);
		
		out.print(jsonarray);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	private static boolean sendNotificationMail(){
		return false;
		
	}

}
