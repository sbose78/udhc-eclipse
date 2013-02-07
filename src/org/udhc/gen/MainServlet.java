/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.udhc.gen;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.expressme.openid.Association;
import org.expressme.openid.Authentication;
import org.expressme.openid.Endpoint;
import org.expressme.openid.OpenIdException;
import org.expressme.openid.OpenIdManager;
/**
 *
 * @author root
 */
public class MainServlet extends HttpServlet {

        static final long ONE_HOUR = 3600000L;
    static final long TWO_HOUR = ONE_HOUR * 2L;
    static final String ATTR_MAC = "openid_mac";
    static final String ATTR_ALIAS = "openid_alias";

    private OpenIdManager manager;

    @Override
    public void init() throws ServletException {
        super.init();
        manager = new OpenIdManager();
  //     manager.setRealm("http://udhc-java.jelastic.servint.net/test1");
  //      manager.setReturnTo("http://udhc-java.jelastic.servint.net/test1/openid");
        
  //    manager.setRealm("http://www.udhc.co.in/");
  //    manager.setReturnTo("http://www.udhc.co.in/openid");
        
 //       manager.setRealm("http://heroku-sbose78-1.herokuapp.com/");
 //       manager.setReturnTo("http://heroku-sbose78-1.herokuapp.com/openid");
       
        
//     manager.setRealm("http://localhost:8080/udhc-eclipse-tomcat6/");
 //     manager.setReturnTo("http://localhost:8080/udhc-eclipse-tomcat6/openid");
       
 //   manager.setRealm("http://care.udhc.co.in/");    
 //   manager.setReturnTo("http://care.udhc.co.in/openid");
        
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    	String my_domain= getServletContext().getInitParameter("domain_url").toString(); 
    	
    	System.out.println(my_domain);
    	
        manager.setRealm(my_domain);
        manager.setReturnTo(my_domain+"openid");
        
        
    	try
    	{
    	
		    	
		       // System.out.println("Referer:"+request.getHeader("Referer").toString());
		        String op = request.getParameter("op");
		        if (op==null) {
		        	
		        					
		                            // check sign on result from Google or Yahoo:
		                            checkNonce(request.getParameter("openid.response_nonce"));
		                            // get authentication:
		                            byte[] mac_key = (byte[]) request.getSession(true).getAttribute(ATTR_MAC);
		                            String alias = (String) request.getSession().getAttribute(ATTR_ALIAS);
		                            Authentication authentication = manager.getAuthentication(request, mac_key, alias);
		                            response.setContentType("text/html; charset=UTF-8");
		                        //   showAuthentication(response.getWriter(), authentication);
		
		
		                      /*
		                       * 
		                       * Succesful authentication.
		                       * All the session data is updated.
		                       * TO DO : WIll be shifted to a new function
		                       * 
		                       */
		                        request.getSession().setAttribute("name",authentication.getFullname());
		                        request.getSession().setAttribute("email",authentication.getEmail());
		                        request.getSession().setAttribute("gender",authentication.getGender());
		                        //request.getSession().setAttribute("gender",authentication.getGender());
		
		                        System.out.println("----1----");
		                   
		                        
		                        /*
		                         * 
		                         *   Checking if the user is  accesing UDHC
		                         *   with Google/Yahoo for the first time.
		                         * 
		                         * 
		                         */
		                        
		                        if(User.checkUserPresence(authentication.getEmail()))
		                        {
		                                      String email=authentication.getEmail();
		                                      String name=org.udhc.gen.User.getName(authentication.getEmail().toString());
		                                      String role=""+org.udhc.gen.User.getLoggedInUserRole(email);
		                                      System.out.println("Role"+role);
		                                      request.getSession().setAttribute("role",role);
		                                      
		                                      // save name to session object This is possible only for care-givers
		                                      request.getSession().setAttribute("name",name);
		                                      
		                                      /*
		                                      String redirect_to=org.udhc.gen.User.getRedirectURL(request);
		                                      if(redirect_to==null) 
		                                      {
		                                          redirect_to=request.getContextPath()+"/home.jsp";
		                                      }
		                                      
		                                 //     System.out.println("----2----"+redirect_to );
		                                      
		                                      response.sendRedirect(redirect_to);
		                                      
		                                      */
		                                      
		                                      response.sendRedirect(request.getContextPath()+"/AUTH/successful.jsp");
		                                      return;                            
		                        }
		                        else
		                        {
		                            response.sendRedirect(request.getContextPath()+"/completeProfile.jsp");
		                            return;
		                        }
		        }
		        if (op.equals("Google") || op.equals("Yahoo")) {
		            // redirect to Google or Yahoo sign on page:
		            Endpoint endpoint = manager.lookupEndpoint(op);
		            Association association = manager.lookupAssociation(endpoint);
		            request.getSession().setAttribute(ATTR_MAC, association.getRawMacKey());
		            request.getSession().setAttribute(ATTR_ALIAS, endpoint.getAlias());
		            String url = manager.getAuthenticationUrl(endpoint, association);
		           //association. System.out.println("Now signing in");
		            response.sendRedirect(url);
		            
		            
		            
		        }
		        else {
		            throw new ServletException("Unsupported OP: " + op);
		        }
    	}
    	catch( Exception e)
    	{
    		System.out.println(e.getMessage());
    	}
    }

    void showAuthentication(PrintWriter pw, Authentication auth) {
        pw.print("<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><title>Test JOpenID</title></head><body><h1>You have successfully signed on!</h1>");
        pw.print("<p>Identity: " + auth.getIdentity() + "</p>");
        pw.print("<p>Email: " + auth.getEmail() + "</p>");
        pw.print("<p>Full name: " + auth.getFullname() + "</p>");
        pw.print("<p>First name: " + auth.getFirstname() + "</p>");
        pw.print("<p>Last name: " + auth.getLastname() + "</p>");
        pw.print("<p>Gender: " + auth.getGender() + "</p>");
        pw.print("<p>Language: " + auth.getLanguage() + "</p>");
        pw.print("</body></html>");
        pw.flush();
        
        
    }

    void checkNonce(String nonce) {
        // check response_nonce to prevent replay-attack:
        if (nonce==null || nonce.length()<20)
            throw new OpenIdException("Verify failed.");
        // make sure the time of server is correct:
        long nonceTime = getNonceTime(nonce);
        long diff = Math.abs(System.currentTimeMillis() - nonceTime);
        if (diff > ONE_HOUR)
            throw new OpenIdException("Bad nonce time.");
        if (isNonceExist(nonce))
            throw new OpenIdException("Verify nonce failed.");
        storeNonce(nonce, nonceTime + TWO_HOUR);
    }

    // simulate a database that store all nonce:
    private Set<String> nonceDb = new HashSet<String>();

    // check if nonce is exist in database:
    boolean isNonceExist(String nonce) {
        return nonceDb.contains(nonce);
    }

    // store nonce in database:
    void storeNonce(String nonce, long expires) {
        nonceDb.add(nonce);
    }

    long getNonceTime(String nonce) {
        try {
            return new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ")
                    .parse(nonce.substring(0, 19) + "+0000")
                    .getTime();
        }
        catch(ParseException e) {
            throw new OpenIdException("Bad nonce time.");
        }
    }
}
