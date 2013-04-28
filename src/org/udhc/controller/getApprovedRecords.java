package org.udhc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.udhc.dao.HealthRecordDAO;
import org.udhc.gen.HealthRecord;

import com.sun.org.apache.regexp.internal.recompile;

/**
 * Servlet implementation class getApprovedRecords
 */
public class getApprovedRecords extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getApprovedRecords() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<HealthRecord> all_records = HealthRecordDAO.getAllHealthRecords();
		
		JSONArray records_array = new JSONArray();
		JSONArray my_issues = new JSONArray();
		JSONObject my_record= new JSONObject();
		
		int status = 1 ;
		
		int count = 0;
		String header_patient_name="";
		for(HealthRecord record : all_records )
		{	count++;
			// 1. take out the patient name , take out the corresponding topic_id+topic_name
			// 2. take out the patientname , match with prev - if diff , go to step 1. else step 3
			// 3. take out topic_id+name , add to my_records
			
			if( status == 2 )
			{
				String current_patient_name  = record.getProblem_id();
				if( current_patient_name.equals(header_patient_name)){
					status = 3;  // same patient
				}
				else{
					header_patient_name = current_patient_name;
					my_record.put("issues", my_issues);
					records_array.add(my_record);

					status = 1; // new patient
					
				}
			}
			
			
			if( status == 1)
			{
				if(header_patient_name.equals("")){
					header_patient_name = record.getProblem_id();
				}
				my_issues = new JSONArray();
				
				my_record = new JSONObject();
				my_record.put("patient_name", header_patient_name); 
				
				JSONObject issue = new JSONObject();
				issue.put("topic_id", record.getTopic_id());
				issue.put("topic_name", record.getTopic());
				
				my_issues.add(issue);
				
				status = 2;
			}
			
			else if( status == 3){
				
				JSONObject issue = new JSONObject();
				issue.put("topic_id", record.getTopic_id());
				issue.put("topic_name", record.getTopic());
				
				my_issues.add(issue);
				status=2;
			}	
		}
		
		

		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		System.out.println(count+"\n"+records_array);
		out.print(records_array);
		out.flush();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
