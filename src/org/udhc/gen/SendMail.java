package org.udhc.gen;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendMail
 */
public class SendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doPost(request,response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String sendee_to= request.getParameter("sendee_to");
		String sendee_cc= request.getParameter("sendee_cc");
		String sendee_bcc= request.getParameter("sendee_bcc");
		String subject  =  request.getParameter("subject");
		
		
		String email_text  = request.getParameter("email_text");
		String sendees_to[] = sendee_to.split("\\s+");
		String sendees_cc[]= sendee_cc.split("\\s+");;
		String sendees_bcc[] =  sendee_bcc.split("\\s+");;
		
		System.out.println(sendees_to+";"+sendee_cc+";"+sendee_bcc);
		
		try {
			EmailUtil.sendMail("sbose78@gmail.com" ,sendees_to, sendees_cc,sendees_bcc, subject , email_text);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
