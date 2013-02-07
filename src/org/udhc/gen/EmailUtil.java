/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.udhc.gen;

/**
 *
 * @author root
 */

import java.util.Properties;

import javax.mail.internet.*;
import javax.mail.*;




//import sun.rmi.transport.Transport;


public class EmailUtil {
    
    public static String sendMail(String from,String to[], String subject, String content)throws Exception
    {
    	 			Properties properties = new Properties();
    	 			properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("credentials.properties"));
    	 			
    	 			from = properties.getProperty("admin_email");
    	 			String pass =  properties.getProperty("admin_password");
        	
    	
                    String host = "smtp.gmail.com";
                   
                    Properties props = System.getProperties();
                    props.put("mail.smtp.starttls.enable", "true"); 
                    props.put("mail.smtp.host", host);
                    props.put("mail.smtp.user", from);
                    props.put("mail.smtp.password", pass);
                    props.put("mail.smtp.port", "587");
                    props.put("mail.smtp.auth", "true");


                    javax.mail.Session session = Session.getDefaultInstance(props, null);
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(from));

                    InternetAddress[] toAddress = new InternetAddress[to.length];

                    // To get the array of addresses
                    for( int i=0; i < to.length; i++ ) { // changed from a while loop
                        toAddress[i] = new InternetAddress(to[i]);
                    }
                    System.out.println(Message.RecipientType.TO);

                    for( int i=0; i < toAddress.length; i++) { // changed from a while loop
                        message.addRecipient(Message.RecipientType.TO, toAddress[i]);
                    }
                    
                    
                    message.setSubject(subject);
                    //message.setText("Welcome to JavaMail");
                    
                    message.setContent(content, "text/html");
                    
                    Transport transport = session.getTransport("smtp");
                    transport.connect(host, from, pass);
                    transport.sendMessage(message, message.getAllRecipients());
                    transport.close();

      return "OK";
   }
    
    public static void main(String args[]) throws Exception{
    	String arr[]={"rishabhjain.rj01@gmail.com","rishabh.rishi@gmail.com", "sbose78@gmail.com"};
    	sendMail("",arr , "Just a test ", "relax - sending from app");
    }
        
        
   
    
}
