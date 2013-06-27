package org.udhc.controller.healthRecord;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.htmlparser.jericho.Source;
import net.htmlparser.jericho.TextExtractor;

import org.json.simple.JSONArray;
import org.udhc.dao.HealthRecordDAO;
import org.udhc.models.HealthRecord;

/**
 * Servlet implementation class GetSimilarCases
 */
public class GetSimilarCases extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSimilarCases() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String issue_description=request.getParameter("issue_description");
		issue_description = getTextFromHTML(issue_description);
		JSONArray array_of_similar_records=HealthRecordDAO.getSimilarRecords(issue_description);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		out.print(array_of_similar_records);
		out.flush();		
		
		
	}
	
	public static String getTextFromHTML(String htmlText)
	{
		Source source= new Source(htmlText);
		return source.getTextExtractor().toString();
	}
	
	public static void main(String ardsp[]) {
		
		
		
	}

}
