package org.udhc.controller.upload;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.udhc.gen.HealthRecord;
import org.udhc.gen.models.Report;

/**
 * Servlet implementation class GetAllImagesIDs
 */
public class GetAllImagesIDs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAllImagesIDs() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String topic_id=request.getParameter("topic_id");
		System.out.println(topic_id);
		ArrayList<Report> hr= HealthRecord.getImagesListAndInfo(Integer.parseInt(topic_id));
		
		JSONArray all_images= new JSONArray();
		System.out.println("calling");
		JSONObject report=new JSONObject();

		for ( Report r: hr)
		{
			
			 report=new JSONObject();
			System.out.println(r.getReport_id());
			
			report.put("image_id",r.getReport_id());
			report.put("about",r.getDescription());
			
			all_images.add(report);
			
		}
		
		// create json from the collection
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(all_images);
		out.flush();	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
