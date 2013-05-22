package org.udhc.controller.healthRecord;
import org.udhc.gen.*;
import org.udhc.models.HealthRecord;
import org.udhc.models.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CatchUpdateHealthIssue
 */
public class CatchUpdateHealthIssue extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CatchUpdateHealthIssue() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String topic_id=request.getParameter("topic_id");
		String topic = request.getParameter("topic");
		String problem_details=request.getParameter("problem_details");
		String patient_name=request.getParameter("patient_name");
		String approved = request.getParameter("approved");
		if(approved == null)
		{
			approved="0";
		}
		// instantiate with basic attributes
		
		HealthRecord record = new HealthRecord(topic_id, topic, patient_name, problem_details,Integer.parseInt(approved));
		
		// calling DAO function.
		record.updateHealthRecord();
		
		String subject ="Updated Health issue "+ topic;
		String content ="Health issue : <a href='http://care.udhc.co.in"
				+"/INPUT/displayIssueGraphically.jsp?topic_id="
				+topic_id+"'>"	
				+topic+"</a> updated by "+ User.getLoggedInUserName(request);
		
		try{
			EmailUtil.sendMail("", User.getModeratorEmails(), subject, content);
		}
		catch( Exception e){
			e.printStackTrace();
		}				
	}

}
