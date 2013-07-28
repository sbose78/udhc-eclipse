package org.udhc.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.udhc.dao.PatientHistoryDAO;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.util.JSON;

/**
 * Servlet implementation class UpdatePatientSummary
 */
public class UpdatePatientSummary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePatientSummary() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doPost(request, response);
		
		String patient_name = request.getParameter("patient_name");
		String info_type= request.getParameter("info_type");
		
		PatientHistoryDAO dao = new PatientHistoryDAO();
		JSONArray response_JSONarray=dao.fetch(patient_name, info_type);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(response_JSONarray);
		out.flush();	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Object keys[] = request.getParameterMap().keySet().toArray();
		HashMap parameterMap = new HashMap();
		for ( Object param_object : keys ){
			
			String key_value = request.getParameter(param_object.toString());
			String param_name=param_object.toString();
			
			if(param_name.startsWith("checkbox_")){
				
				String splitted[] = param_name.split("_");
				
				Object existing_value = parameterMap.get(splitted[1]);//.toString();
				if( existing_value==null){
					parameterMap.put(splitted[1], key_value);
				}
				else{
					key_value= existing_value.toString()+","+key_value;
					parameterMap.put(splitted[1], key_value);

				}
				
			}
			else{
				parameterMap.put(param_name.toString(), key_value.toString());
			}
			System.out.println(param_name+" : "+key_value);
			
		
		}
		
	
		
		
		/*
		 * 
		 * mongo candidate.7.mongolayer.com:10014/patient_summary -u <user> -p<password>
		 * 
		 * 
		 */
		
		
		JSONObject content_parameter = new JSONObject(request.getParameterMap()); //dicitonary		
		JSONObject json_response = new JSONObject();
		
		json_response.put("status", "OK");
		json_response.put("summary_content", parameterMap);
		
		JSONArray response_array = new JSONArray();
		
		response_array.add(json_response);
		PatientHistoryDAO dao = new PatientHistoryDAO();
		dao.insert(parameterMap);
		
		
		System.out.println(response_array);
		
		response.setContentType("application/json");		
		PrintWriter out= response.getWriter();		
		out.print(response_array);
		
	}

}
