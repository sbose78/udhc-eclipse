package org.udhc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.udhc.gen.HealthRecord;

/**
 * Servlet implementation class GetFeed
 */
public class GetFeed extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFeed() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
			ArrayList<HealthRecord> records = HealthRecord.getFeaturedNarratives();
			
			
			JSONArray all_records=new JSONArray();
			for( HealthRecord hr : records){
				JSONObject record = new JSONObject();
				record.put("id", hr.getTopic_id());
				record.put("description", hr.getProblem_details());
				record.put("patient_name", hr.getProblem_id());
				
				
				all_records.add(record);
			}		
		
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.print(all_records);
			out.flush();	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
