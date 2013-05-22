package org.udhc.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.udhc.dao.EventDAO;
import org.udhc.models.User;
import org.udhc.models.Event;

/**
 * Servlet implementation class CatchTimelinePost
 */
public class CatchTimelinePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CatchTimelinePost() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String patient_name = request.getParameter("patient_name");
    	String event_story = request.getParameter("event_data");
    	
    	String publisher = User.getLoggedInUserEmail(request);
    	int publisher_role= User.getLoggedInUserRole(publisher);
    	/*
    	DateFormat dateFormat = new SimpleDateFormat("EEE, MMM d, ''yy");
        Date date = new Date();
        
        
        String upload_date = dateFormat.format(date).toString();
        */
    	
    	String upload_date = request.getParameter("event_date");
    	System.out.println(upload_date);
    	String formatted_upload_date = formatDateForMySQL(upload_date);

        
        Event event = new Event(0, publisher_role, publisher, patient_name, formatted_upload_date ,event_story);
        EventDAO dao = new EventDAO();
        int event_id = dao.insert(event);
        
        JSONArray final_json = new JSONArray();
        JSONObject event_object = new JSONObject();
        event_object.put("id", event_id);
        event_object.put("event_story",event_story);
        event_object.put("date", upload_date);
        
        final_json.add(event_object);
        
        
        response.setContentType("application/json");
		
		PrintWriter out= response.getWriter();
		System.out.println("Returns response for new timeline post : "+ final_json);
		
		out.print(final_json);
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		processRequest(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}
	
	public static String formatDateForMySQL(String date){
		
		String formatted_date=new String();
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");
		Date parsed_date = new Date();
		
    	try {
        	
			parsed_date = sdf.parse(date);
			System.out.println("parsed date: "+parsed_date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	sdf = new SimpleDateFormat("yyyy-MM-dd");
    	formatted_date = sdf.format(parsed_date);
    	System.out.println("formatted date : "+formatted_date);
    	return formatted_date;
		
	}
	
	public static void main(String args[]) throws ParseException{
		
		formatDateForMySQL("02 Apr 2012");
		/*
		  
		 
    	SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");
    	Date date = sdf.parse("01 Apr 2013");
    	
    	sdf = new SimpleDateFormat("yyyy-mm-dd");
    	   	
    	String upload_date = sdf.format(date);
    	System.out.println(upload_date);
    	
    	EventDAO dao =new EventDAO();
    	dao.insertDate(upload_date);
    	//System.out.println(dao.getDate());
    	 * 
    	 * 
    	 */
	}

}
