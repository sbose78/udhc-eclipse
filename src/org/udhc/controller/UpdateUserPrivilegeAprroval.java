package org.udhc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.udhc.gen.User;

/**
 * Servlet implementation class UpdateUserPrivilegeAprroval
 */
public class UpdateUserPrivilegeAprroval extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserPrivilegeAprroval() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int current_privilege = Integer.parseInt( request.getParameter("current_privilege"));
		//int approved = Integer.parseInt( request.getParameter("current_approval_status"));
		String email = request.getParameter("email");
		
		System.out.println(current_privilege+","+email);
		
		int final_privilege = User.approvePrivilege(email, current_privilege);
		
		JSONArray response_array = new JSONArray();
		JSONObject response_object = new JSONObject();
		response_object.put("email", email);
		response_object.put("previous_privilege", current_privilege);
		response_object.put("final_privilege", final_privilege);
		int approved  = 0;
		if( final_privilege >= 0){
			approved=1;
		}
		
		response_object.put("approved", approved);
		
		response_array.add(response_object);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		System.out.println(response_array);
		out.print(	response_array);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
