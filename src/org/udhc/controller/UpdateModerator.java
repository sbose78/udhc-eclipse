package org.udhc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.udhc.dao.UserDAO;

/**
 * Servlet implementation class UpdateModerator
 */
public class UpdateModerator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateModerator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String email = request.getParameter("email");
		boolean isModerator = Boolean.parseBoolean(request.getParameter("moderator"));
		
		UserDAO dao = new UserDAO();
		String isUpdated  = dao.updateModerator(email, isModerator);
		System.out.println(isUpdated);
		
		JSONArray status_array= new JSONArray();
		JSONObject status_object = new JSONObject();
		
		status_object.put("email", email);
		status_object.put("status", isUpdated);
		
		status_array.add(status_object);
		
		

		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		
		System.out.println(status_array);
		out.print(status_array);
		out.flush();
		
		
		
		
	}

}
