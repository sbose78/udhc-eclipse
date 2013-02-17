package org.udhc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.udhc.dao.DoctorDAO;
import org.udhc.gen.User;
import org.udhc.gen.models.Doctor;

/**
 * Servlet implementation class CatchProfileData
 */
public class CatchProfileData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CatchProfileData() {
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
		
		String doctor_name=request.getParameter("doctor_name");
		String doctor_about=request.getParameter("doctor_about");
		
		String loggedInUserEmail= User.getLoggedInUserEmail(request);
		
		Doctor doctor= new Doctor(doctor_name,loggedInUserEmail,doctor_about,	"");
		
		DoctorDAO dao = new DoctorDAO();
		System.out.println("UPdate, doctor,"+loggedInUserEmail +",rows = "+dao.update(doctor));
		response.sendRedirect(getServletContext().getInitParameter("domain_url").toString()+"PROFILE/DOCTOR/profile.jsp");
		
	}

}
