package org.udhc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.udhc.dao.HealthFileDAO;

/**
 * Servlet implementation class DeleteHealthFile
 */
public class DeleteHealthFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteHealthFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String health_file_id= request.getParameter("health_file_id");
		int idhealth_files=0;
		if(health_file_id!=null)
		{
			idhealth_files=Integer.parseInt(health_file_id);
		}
		
		int number_of_rows_deleted= HealthFileDAO.deleteHealthFile(idhealth_files);
		JSONArray status_array = new JSONArray();
		
		JSONObject status = new JSONObject();
		status.put("health_file_id", idhealth_files);
		status.put("status", number_of_rows_deleted);
		
		status_array.add(status);
		
		response.setContentType("application/json");
		
		PrintWriter out= response.getWriter();
		System.out.println(status_array);
		
		out.print(status_array);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
