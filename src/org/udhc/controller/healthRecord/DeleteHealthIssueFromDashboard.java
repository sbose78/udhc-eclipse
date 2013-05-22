package org.udhc.controller.healthRecord;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.udhc.models.HealthRecord;

/**
 * Servlet implementation class DeleteHealthIssue
 */
public class DeleteHealthIssueFromDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteHealthIssueFromDashboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String topic_id=request.getParameter("topic_id");
		int no_of_deleted = 0;
		if(topic_id!=null)
		{
			no_of_deleted=HealthRecord.deleteHealthRecord(Integer.parseInt(topic_id));
		}
		
		//response.getWriter().println("Successfully removed - please close this window");
		
		response.setContentType("application/json");
		
		JSONArray json_array = new JSONArray();
		JSONObject json_object = new JSONObject();
		json_object.put("topic_id", topic_id);
		if( no_of_deleted>0){
			json_object.put("isdeleted", "true");
		}
		else{
			json_object.put("isdeleted", "true");
		}
		
		json_array.add(json_object);
		
		PrintWriter out= response.getWriter();
		System.out.println(json_array);
		
		out.print(json_array);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
