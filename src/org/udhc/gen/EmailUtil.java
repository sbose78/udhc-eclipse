/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.udhc.gen;

/**
 *
 * @author root
 */

import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.util.Properties;

import javax.mail.internet.*;
import javax.mail.*;

import org.apache.commons.io.IOUtils;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.SimpleEmail;





//import sun.rmi.transport.Transport;


public class EmailUtil {
	
	
	public static String sendMail(String from,String to[],String cc[] , String bcc[],String subject, String content)throws Exception
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
                    for( int i=0; i < to.length ; i++ ) { // changed from a while loop
                        toAddress[i] = new InternetAddress(to[i]);
                        System.out.println(toAddress[i]);
                    }
                    System.out.println(Message.RecipientType.TO);

                    for( int i=0; i < toAddress.length; i++) { // changed from a while loop
                        message.addRecipient(Message.RecipientType.TO, toAddress[i]);
                        
                    }
                 /*   
                    String bcc_list[] = User.getModeratorEmails();
                    
                    InternetAddress[] bccAddress = new InternetAddress[bcc_list.length];
                    
                    // To get the array of addresses
                    for( int i=0; i <bcc_list.length ; i++ ) { // changed from a while loop
                        bccAddress[i] = new InternetAddress(bcc_list[i]);
                        System.out.println(bccAddress[i]);
                    }
                    System.out.println(Message.RecipientType.BCC);

                    for( int i=0; i < bccAddress.length; i++) { // changed from a while loop
                        message.addRecipient(Message.RecipientType.BCC, bccAddress[i]);
                        
                    }
                    
                 */
                    message.setSubject(subject);
                    //message.setText("Welcome to JavaMail");
                    
                    message.setContent(content, "text/html");
                    
                    Transport transport = session.getTransport("smtp");
                    transport.connect(host, from, pass);
                    transport.sendMessage(message, message.getAllRecipients());
                    transport.close();

      return "OK";
   }
    
	
    
    public static String sendMail(String from,String to[], String subject, String content)throws Exception
    {
    	
    	/*
    	 			Properties properties = new Properties();
    	 			properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("credentials.properties"));
    	 			
    	 			from = properties.getProperty("admin_email");
    	 			String pass =  properties.getProperty("admin_password");
        	
    	 			System.out.println(from+","+pass);
    	
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
                    
                    InputStream inputStream= Thread.currentThread().getContextClassLoader().getResourceAsStream("email_header.html");
                    StringWriter writer = new StringWriter();
                    IOUtils.copy(inputStream, writer, "utf8");
                    String header = writer.toString();
                    System.out.println(header);

                    inputStream= Thread.currentThread().getContextClassLoader().getResourceAsStream("email_footer.html");
                    writer= new StringWriter();
                    IOUtils.copy(inputStream, writer, "utf8");
                    String footer = writer.toString();
                    System.out.println(footer);
                    
                    message.setSubject(subject);
                    //message.setText("Welcome to JavaMail");
                    content = header +"<br><br>"+content+"<br><br>"+footer;
                    message.setContent(content, "text/html; charset=utf-8");
                    Transport transport = session.getTransport("smtp");
                    transport.connect(host, from, pass);
                    transport.sendMessage(message, message.getAllRecipients());
                    transport.close();
    	 */
    	
    sendMailCommons(from, to, subject, content);

      return "OK";
   }
    
    
   public static void sendMailCommons(String from,String to[], String subject, String content) throws Exception
   {

	   Properties properties = new Properties();
	   properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("credentials.properties"));
		
	   from = properties.getProperty("admin_email");
	   String pass =  properties.getProperty("admin_password");
	   
	   
	   InputStream inputStream= Thread.currentThread().getContextClassLoader().getResourceAsStream("email_header.html");
       StringWriter writer = new StringWriter();
       IOUtils.copy(inputStream, writer, "utf8");
       String header = writer.toString();
       System.out.println(header);

       inputStream= Thread.currentThread().getContextClassLoader().getResourceAsStream("email_footer.html");
       writer= new StringWriter();
       IOUtils.copy(inputStream, writer, "utf8");
       String footer = writer.toString();
       System.out.println(footer);
	   
       HtmlEmail email = new HtmlEmail();
      
       email.setSmtpPort(587);
       email.setAuthenticator(new DefaultAuthenticator(from,pass));
       email.setDebug(true);
       email.setHostName("smtp.gmail.com");
       email.getMailSession().getProperties().put("mail.smtps.auth", "true");
       email.getMailSession().getProperties().put("mail.debug", "true");
       email.getMailSession().getProperties().put("mail.smtps.port", "587");
       email.getMailSession().getProperties().put("mail.smtps.socketFactory.port", "587");
       email.getMailSession().getProperties().put("mail.smtps.socketFactory.class",   "javax.net.ssl.SSLSocketFactory");
       email.getMailSession().getProperties().put("mail.smtps.socketFactory.fallback", "false");
       email.getMailSession().getProperties().put("mail.smtp.starttls.enable", "true");
       email.setFrom(from,"The ArogyaUDHC Admin");
       email.setSubject(subject);
       email.setHtmlMsg(content+footer);
       for( int i =0 ;i < to.length;i++){
    	   email.addTo(to[i]);
       }
      // email.addTo(to[0], "Shoubhik");
      // email.setTLS(true);
       email.send();
	   
	   
   }
    
    public static void main(String args[]) throws Exception{
    	String arr[]={"sbose78@gmail.com","sbose@udhc.co.in"};
    	sendMailCommons("",arr , "Just a test ", "relax - sending from app");
    }
        
        
   
    
}
