/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.udhc.gen;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import java.util.TimeZone;

import org.udhc.gen.models.Report;


/**
 *
 * @author root
 */
public class HealthRecord {
	
	
	
    public String getTopic_id() {
		return topic_id;
	}

	public void setTopic_id(String topic_id) {
		this.topic_id = topic_id;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getProblem_details() {
		return problem_details;
	}

	public void setProblem_details(String problem_details) {
		this.problem_details = problem_details;
	}

	public String getSocialWorker_id() {
		return socialWorker_id;
	}

	public void setSocialWorker_id(String socialWorker_id) {
		this.socialWorker_id = socialWorker_id;
	}

	public String getProblem_id() {
		return problem_id;
	}

	public void setProblem_id(String problem_id) {
		this.problem_id = problem_id;
	}

	public int getApproved() {
		return approved;
	}

	public void setApproved(int approved) {
		this.approved = approved;
	}

	public InputStream getConsent_letter() {
		return consent_letter;
	}

	public void setConsent_letter(InputStream consent_letter) {
		this.consent_letter = consent_letter;
	}

	String date;
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	int solved;
	public int getSolved() {
		return solved;
	}

	public void setSolved(int solved) {
		this.solved = solved;
	}

	String topic_id;
    String topic;
    String problem_details;
    String socialWorker_id;
    String problem_id;
    int approved;
    InputStream consent_letter;
    String solution_date;
    public String getSolution_date() {
		return solution_date;
	}

	public void setSolution_date(String solution_date) {
		this.solution_date = solution_date;
	}

	public String getSolution_content() {
		return solution_content;
	}

	public void setSolution_content(String solution_content) {
		this.solution_content = solution_content;
	}

	public String getSolution_user() {
		return solution_user;
	}

	public void setSolution_user(String solution_user) {
		this.solution_user = solution_user;
	}

	String solution_content;
    String solution_user;
    
    public HealthRecord(){
    	
    }
    
    
    public HealthRecord(int topic_id , String topic,String social_worker_id,String patient_name, String problem_details, int approved)
    {
        this.topic_id=topic_id+"";
        this.problem_id= patient_name;
        this.problem_details=problem_details;
        this.topic=topic;
        this.approved=approved;
        this.socialWorker_id=social_worker_id;
        
    }
    
    
    public HealthRecord(int topic_id , String topic,String social_worker_id,String patient_name, String problem_details, int approved, String date,int solved)
    {
        this.topic_id=topic_id+"";
        this.problem_id= patient_name;
        this.problem_details=problem_details;
        this.topic=topic;
        this.approved=approved;
        this.socialWorker_id=social_worker_id;
        this.date=date;
        this.solved =solved;
        
    }
    
    public HealthRecord(int topic_id , String topic,String social_worker_id,String patient_name, String problem_details, int approved, String date)
    {
        this.topic_id=topic_id+"";
        this.problem_id= patient_name;
        this.problem_details=problem_details;
        this.topic=topic;
        this.approved=approved;
        this.socialWorker_id=social_worker_id;
        this.date=date;
        
    }
    
    
   
    /*
     * Currently used object constructor for uploading new health cases.
     */
    
    public HealthRecord(String topic, String socialWorker_id,String problem_id, String problem_details, InputStream consent_letter)
    {
        this.consent_letter=consent_letter;
        this.problem_id=problem_id;
        this.socialWorker_id=socialWorker_id;
        this.problem_details=problem_details;
        this.topic=topic;
        
    }
      public HealthRecord(String topic, String socialWorker_id,String problem_id, String problem_details, InputStream consent_letter,int approved)
    {
        this.approved=approved;
        this.consent_letter=consent_letter;
        this.problem_id=problem_id;
        this.socialWorker_id=socialWorker_id;
        this.problem_details=problem_details;
        this.topic=topic;
        
    }
    
    public HealthRecord(String topic_id,String topic, String socialWorker_id,String problem_id, String problem_details)
    {
        
        this.topic_id= topic_id;
        this.problem_id=problem_id;
        this.socialWorker_id=socialWorker_id;
        this.problem_details=problem_details;
        this.topic=topic;
    }
    
    public HealthRecord(String topic_id,String topic, String socialWorker_id,String problem_id, String problem_details, String solution_date)
    {
        
        this.topic_id= topic_id;
        this.problem_id=problem_id;
        this.socialWorker_id=socialWorker_id;
        this.problem_details=problem_details;
        this.topic=topic;
        this.solution_date=solution_date;
    }
    
    /*
     * 
     *  This section has all the code for updation of health records
     * 
     *  1. This contructor will be used for creating objects containing new attributes.
     *  2. The DAO function will send an UPDATE to the database 
     *  
     **/
    
    public HealthRecord(String topic_id , String topic,String patient_name, String problem_details, int approved)
    {
        this.topic_id=topic_id;
        this.problem_id= patient_name;
        this.problem_details=problem_details;
        this.topic=topic;
        this.approved=approved;
    }
    
    public static int deleteHealthRecord(int topic_id)
    {
    	try            
        {              
                Connection conn= DbCon.getDbConnection();
                PreparedStatement pstatement = null;

                // forum
                
                String queryString = "DELETE FROM forum WHERE idforum = ?";
                pstatement = conn.prepareStatement(queryString);                
                pstatement.setInt(1, topic_id);                
                int updateQuery = pstatement.executeUpdate();
                
                
                // forum_post
                
                queryString = "DELETE FROM forum_post WHERE topic_id = ?";
                pstatement = conn.prepareStatement(queryString);                
                pstatement.setInt(1, topic_id);                
                updateQuery = pstatement.executeUpdate();
                
                // health_files
                
                queryString = "DELETE FROM health_files WHERE topic_id = ?";
                pstatement = conn.prepareStatement(queryString);                
                pstatement.setInt(1, topic_id);                
                updateQuery = pstatement.executeUpdate();
               
                // solution table
                
                queryString = "DELETE FROM solution WHERE topic_id = ?";
                pstatement = conn.prepareStatement(queryString);                
                pstatement.setInt(1, topic_id);                
                updateQuery = pstatement.executeUpdate();
                
                DbCon.closeConnection(conn, pstatement);            
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        	return 0;
        	
           // return e.toString();
        }
    	return 1;
    }
    
    public static int  updateHealthIssueApprovalStatus(int topic_id, int approve_status) {
    	
    	try            
        {
              
                Connection conn= DbCon.getDbConnection();
                PreparedStatement pstatement = null;

                
                
                String queryString = "UPDATE forum SET approved = ? WHERE idforum = ?";
                pstatement = conn.prepareStatement(queryString); 
                
                pstatement.setInt(1, approve_status);   
                pstatement.setInt(2, topic_id);   
                int updateQuery = pstatement.executeUpdate();
                
                DbCon.closeConnection(conn, pstatement);
            
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        	return 0;
        	
           // return e.toString();
        }
        
    	return 1;
    			
	}
   
    
    
    public int updateHealthRecord()
    {
    	try            
        {
              
                Connection conn= DbCon.getDbConnection();
                PreparedStatement pstatement = null;

                
                
                String queryString = "UPDATE forum SET topic = ? ,problem_details = ? , problem_id = ? , approved = ? WHERE idforum = ?";
                pstatement = conn.prepareStatement(queryString); 
                
                pstatement.setInt(5, Integer.parseInt(this.topic_id));
             
                pstatement.setString(1, this.topic);
                pstatement.setString(2, this.problem_details);
                pstatement.setString(3, this.problem_id);
                pstatement.setInt(4, approved);
                
                int updateQuery = pstatement.executeUpdate();
                
                DbCon.closeConnection(conn, pstatement);
            
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        	
           // return e.toString();
        }
        
    	return 0;
    }
    
    
		
	    
    public static ArrayList<HealthRecord> getAllUploadedHealthRecords() 
    {
    	 
    	 System.out.println("testing");
    	 
    	
     	
        ArrayList<HealthRecord> lhr = new ArrayList<HealthRecord>();
        
        Connection con;//=DbCon.getDbConnection();
     
        try{
            
                con=DbCon.getDbConnection();

                ResultSet rst=null;
                Statement stmt=null;

                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from forum");
                while(rst.next()){
        
                            	
                   HealthRecord h=new HealthRecord(Integer.parseInt(rst.getString("idforum")),rst.getString("topic"),rst.getString("social_worker_id"),rst.getString("problem_id"),rst.getString("problem_details"),rst.getInt("approved"),rst.getString("upload_date").toString(),rst.getInt("solved"));
                   lhr.add(h);
                }
                DbCon.closeConnection(con);
        }
        
        
        
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        
        
        
        return lhr;
    }
    
    
    public static ArrayList<HealthRecord> getAllUploadedHealthRecordsByPatientName(String patient_name) 
    {
    	 
    	 System.out.println("testing");
    	 
    	
     	
        ArrayList<HealthRecord> lhr = new ArrayList<HealthRecord>();
        
        Connection con;//=DbCon.getDbConnection();
     
        try{
            
                con=DbCon.getDbConnection();

                ResultSet rst=null;
                Statement stmt=null;

                String sql="select * from forum where problem_id = ? order by idforum asc";
                PreparedStatement ps=con.prepareStatement(sql);
                ps.setString(1, patient_name);
                rst=ps.executeQuery();
                while(rst.next()){
        
                            	
                   HealthRecord h=new HealthRecord(Integer.parseInt(rst.getString("idforum")),rst.getString("topic"),rst.getString("social_worker_id"),rst.getString("problem_id"),rst.getString("problem_details"),rst.getInt("approved"),rst.getString("upload_date").toString(),rst.getInt("solved"));
                   lhr.add(h);
                }
                DbCon.closeConnection(con);
        }
        
        
        
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        
        
        
        return lhr;
    }
    

    
    public static ArrayList<HealthRecord> getAllSolvedHealthRecords() throws IOException
    {
    	 
    	
     	
        ArrayList<HealthRecord> lhr = new ArrayList<HealthRecord>();
        
        Connection con;//=DbCon.getDbConnection();
     
        try{
            
                con=DbCon.getDbConnection();

                ResultSet rst=null;
                Statement stmt=null;

                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from forum where approved = 1 and solved = 1");
                while(rst.next()){

                    
                    HealthRecord h=new HealthRecord(rst.getString("idforum"),rst.getString("topic"),rst.getString("social_worker_id"),rst.getString("problem_id"),rst.getString("problem_details"), rst.getString("solution_date"));
                    lhr.add(h);
                }
                DbCon.closeConnection(con);
        }
        
        
        
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        
        
        return lhr;
    }
    
     public static ArrayList<HealthRecord> getAllHealthRecords() throws IOException
    {
    	 
    	
     	
        ArrayList<HealthRecord> lhr = new ArrayList<HealthRecord>();
        
        Connection con;//=DbCon.getDbConnection();
     
        try{
            
                con=DbCon.getDbConnection();

                ResultSet rst=null;
                Statement stmt=null;

                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from forum where approved = 1");
                while(rst.next()){

                    
                    HealthRecord h=new HealthRecord(rst.getString("idforum"),rst.getString("topic"),rst.getString("social_worker_id"),rst.getString("problem_id"),rst.getString("problem_details"));
                    lhr.add(h);
                }
                DbCon.closeConnection(con);
        }
        
        
        
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        
        
        return lhr;
    }
    
     // for feed
     public static ArrayList<HealthRecord> getFeaturedNarratives()
     {
         ArrayList<HealthRecord> lhr = new ArrayList<HealthRecord>();
         
         Connection con;//=DbCon.getDbConnection();
      
         try{
             
                 con=DbCon.getDbConnection();

                 ResultSet rst=null;
                 Statement stmt=null;

                 stmt=con.createStatement();
                 rst=stmt.executeQuery("select * from forum where approved = 1 and featured = 1");
                 while(rst.next()){

                     
                     HealthRecord h=new HealthRecord(rst.getString("idforum"),rst.getString("topic"),rst.getString("social_worker_id"),rst.getString("problem_id"),rst.getString("problem_details"));
                     lhr.add(h);
                 }
                 DbCon.closeConnection(con);
         }
         
         
         
         catch(Exception e)
         {
             System.out.println(e.toString());
         }
         
         
         
         return lhr;
     }
     
    
    public static byte[] getImageData(int idhealth_files)
    {
        Connection con;//=DbCon.getDbConnection();
        
          InputStream is;
          byte[] imgdata=null;
     
        try{
            
                con=DbCon.getDbConnection();

                ResultSet rst=null;
                Statement stmt=null;
                
              

                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from health_files where idhealth_files = "+idhealth_files);
                while(rst.next()){
                    
                        //is=rst.getBinaryStream("file");
                         Blob b=rst.getBlob("file");
                         imgdata=b.getBytes(1, (int)b.length());
                         break;
                         
                }
                DbCon.closeConnection(con);
                return imgdata;
        }
        
        
        
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        return null;
        
    }
    
    
    public static ArrayList<Integer> getImagesList(int topic_id)
    {
        ArrayList<Integer> list=new ArrayList<Integer>();
        Connection con;
        
       try{
            
                con=DbCon.getDbConnection();

                ResultSet rst=null;
                Statement stmt=null;
                
              

                stmt=con.createStatement();
                rst=stmt.executeQuery("select idhealth_files from health_files where topic_id = "+topic_id);
                while(rst.next()){
                    
                    list.add(rst.getInt("idhealth_files"));     
                }
                DbCon.closeConnection(con);
                
                
        }
        
        
        
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        
        return list;
        
        
    }
    
    
     public static ArrayList<Report> getImagesListAndInfo(int topic_id)
    {
        ArrayList<Report> list=new ArrayList<Report>();
        Connection con;
        ResultSet rst=null;
        Statement stmt=null;
       try{
            
                con=DbCon.getDbConnection();

                
                System.out.println(topic_id+"--------");
 
                stmt=con.createStatement();
                rst=stmt.executeQuery("select idhealth_files, file_name from health_files where topic_id = "+topic_id);
                while(rst.next()){
                    Report report = new Report(rst.getInt("idhealth_files")+"",rst.getString("file_name"));
                    System.out.println(report.getReport_id()+".............");
                    list.add(report);
                    //list.add(rst.getInt("idhealth_files"));     
                }
                DbCon.closeConnection(con);
                
                
        }
        
        
        
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        return list;
        
        
    }
   
    
    
    public static ArrayList<HealthRecord> getSubmissionsByUserEmail(String email)
    {
       
        ArrayList<HealthRecord> lhr = new ArrayList<HealthRecord>();
        
        Connection con;//=DbCon.getDbConnection();
     
        try{
            
                con=DbCon.getDbConnection();

                ResultSet rst=null;
                Statement stmt=null;

                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from forum where social_worker_id = '"+email+"'");
                while(rst.next()){

                    
                    HealthRecord h=new HealthRecord(rst.getString("idforum"),rst.getString("topic"),rst.getString("social_worker_id"),rst.getString("problem_id"),rst.getString("problem_details"));
                    lhr.add(h);
                }
                DbCon.closeConnection(con);
        }
        
        
        
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        return lhr;
    
    }
    
    
    public static String insertImage(InputStream image,int topic_id)
    {
        try{
        
        Connection conn= DbCon.getDbConnection();
        
                PreparedStatement pstatement = null;

                String queryString = "INSERT INTO health_files(file,topic_id) VALUES (?,?)";
                pstatement = conn.prepareStatement(queryString);
                
                pstatement.setBlob(1, image);       
                pstatement.setInt(2, topic_id);  
                
                int updateQuery = pstatement.executeUpdate();
                
                DbCon.closeConnection(conn, pstatement);
                
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        
        
        return "OK";
    }
    
    // Called from UploadImage.java
    public static String insertImageWithName(InputStream image,int topic_id,String file_name)
    {
        try{
        
        Connection conn= DbCon.getDbConnection();
        
                PreparedStatement pstatement = null;

                String queryString = "INSERT INTO health_files(file,topic_id,file_name) VALUES (?,?,?)";
                pstatement = conn.prepareStatement(queryString ,pstatement.RETURN_GENERATED_KEYS);
                
                pstatement.setBlob(1, image);       
                pstatement.setInt(2, topic_id);  
                pstatement.setString(3, file_name);
                        
                
                int updateQuery = pstatement.executeUpdate();
                
                ResultSet my_keys = pstatement.getGeneratedKeys();
                while(my_keys.next())
                {
                	
                	return my_keys.getInt(1)+"";
                	
                }
                
                DbCon.closeConnection(conn, pstatement);
                
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        
        
        return "OK";
    }
    
    
    // called from CatchHealthIssue servlet
    
    public String insertHealthRecord()
    {
        try            
        {
               this.problem_id=User.getScientificName();
                Connection conn= DbCon.getDbConnection();
                PreparedStatement pstatement = null;

                String queryString = "INSERT INTO forum(topic,social_worker_id,problem_details,problem_id) VALUES (?,?, ?,?)";
                pstatement = conn.prepareStatement(queryString);
                
                pstatement.setString(1, this.topic);
                pstatement.setString(2, this.socialWorker_id);
                
                pstatement.setString(3, this.problem_details);
                pstatement.setString(4, this.problem_id);
                
                int updateQuery = pstatement.executeUpdate();
                
                DbCon.closeConnection(conn, pstatement);
            
        }
        catch(Exception e)
        {
            return e.toString();
        }
        return "OK";
    }   
    
    
    //added consent letter
    
    public String insertHealthRecord2()
    {
        try            
        {
               this.problem_id=User.getScientificName();
                Connection conn= DbCon.getDbConnection();
                PreparedStatement pstatement = null;

                String queryString = "INSERT INTO forum(topic,social_worker_id,problem_details,problem_id,consent_letter,approval) VALUES (?,?, ?,?,?,?)";
                pstatement = conn.prepareStatement(queryString);
                
                pstatement.setString(1, this.topic);
                pstatement.setString(2, this.socialWorker_id);
                
                pstatement.setString(3, this.problem_details);
                pstatement.setString(4, this.problem_id);
                pstatement.setBlob(5, consent_letter); 
                
                pstatement.setInt(6,0);
                
                int updateQuery = pstatement.executeUpdate();
                
                DbCon.closeConnection(conn, pstatement);
            
        }
        catch(Exception e)
        {
            return e.toString();
        }
        return "OK";
    }   
    
    // Currently using this function
    //getting scientific name externally 
    public String insertHealthRecord3(String sc_name)
    {
        try            
        {
        	   // In the constructor it was set as "0".         	
               this.problem_id=sc_name; 
                Connection conn= DbCon.getDbConnection();
                PreparedStatement pstatement = null;
                
                DateFormat dateFormat = new SimpleDateFormat("EEE, MMM d, ''yy");
                Date date = new Date();
                String upload_date = dateFormat.format(date).toString();

                String queryString = "INSERT INTO forum(topic,social_worker_id,problem_details,problem_id,consent_letter, upload_date) VALUES (?,?, ?,?,?,?)";
                pstatement = conn.prepareStatement(queryString, pstatement.RETURN_GENERATED_KEYS);
                
                pstatement.setString(1, this.topic);
                pstatement.setString(2, this.socialWorker_id);
                
                pstatement.setString(3, this.problem_details);
                pstatement.setString(4, this.problem_id);
                pstatement.setBlob(5, consent_letter);          
                pstatement.setString(6, upload_date);
                
                int updateQuery = pstatement.executeUpdate();
                
                ResultSet my_keys = pstatement.getGeneratedKeys();
                while(my_keys.next())
                {
                	
                	return my_keys.getInt(1)+"";
                	
                }
                
                DbCon.closeConnection(conn, pstatement);
            
        }
        catch(Exception e)
        {
            return e.toString();
        }
        return "OK";
    }   
  
  
    public static HealthRecord getHealthRecordByID(int id)
    {
        Connection con;//=DbCon.getDbConnection();
        String a="";
        HealthRecord h = new HealthRecord(a,a,a,a,0);   
        try{            
                con=DbCon.getDbConnection();
                ResultSet rst=null;
                Statement stmt=null;
                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from forum where idforum = "+id);                                   
                
                while(rst.next())
                {
                    h=new HealthRecord(id, rst.getString("topic"),rst.getString("social_worker_id"),rst.getString("problem_id"),rst.getString("problem_details"),rst.getInt("approved"));                           
                    break;
                }
                DbCon.closeConnection(con);
                
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        return h; 
    }
    
    public String insertSolution(int topic_id,String solution,String user)
    {
        try            
        {       Connection conn= DbCon.getDbConnection();
                PreparedStatement pstatement = null;
                
                DateFormat dateFormat = new SimpleDateFormat("EEE, MMM d, ''yy");
                Date date = new Date();
                String upload_date = dateFormat.format(date).toString();
               
                String queryString = "UPDATE forum SET solution_user = ? , solution_content = ? , solved = 1 , solution_date = ? WHERE idforum = "+topic_id;
                pstatement = conn.prepareStatement(queryString);
                
                pstatement.setString(1, user);
                pstatement.setString(2, "");
                pstatement.setString(3 , upload_date);
                
                int updateQuery = pstatement.executeUpdate();
                DbCon.closeConnection(conn, pstatement);            
        }
        catch(Exception e)
        {
            return e.toString();
        }                        
        return "OK";
    }    
    
    public HealthRecord(int topic_id, String topic, String patient_name, String solution_content, String solution_date, String solution_user, int solved)
    {
    	this.topic_id=topic_id+"";
    	this.topic=topic;
    	this.problem_id=patient_name;
    	this.solution_date=solution_date;
    	this.solved=solved;
    	this.solution_content=solution_content;
    	
    	
    }
     
    public static HealthRecord showSolution(int topic_id)
    {
        Connection con;//=DbCon.getDbConnection();
        String solution_user="";
        String solution_content="";
        
        HealthRecord h = null;
        
        try{
                con=DbCon.getDbConnection();

                ResultSet rst=null;
                Statement stmt=null;

                stmt=con.createStatement();
                rst=stmt.executeQuery("select topic,solved, solution_date , solution_user , problem_id,solution_content from forum where idforum = "+topic_id);
                while(rst.next()){
                	
                    solution_user=rst.getString("solution_user");
                    solution_content=rst.getString("solution_content");
// int topic_id, String topic, String patient_name, String solution_content, String solution_date, String solution_user, int solved                    
                    h= new HealthRecord(
                    		topic_id,
                    		rst.getString("topic"),
                    		rst.getString("problem_id"),
                    		rst.getString("solution_content"),
                    		rst.getString("solution_date"),
                    		rst.getString("solution_user"),
                    		rst.getInt("solved")     
                    );
                    break;
                }
                DbCon.closeConnection(con);
        }       
        catch(Exception e)
        {
            e.printStackTrace();
        }
                    
        return h;
    }   
    
    public static void main(String args[]) throws IOException
    {
    	ArrayList<HealthRecord> ahr = getAllUploadedHealthRecords();
    	System.out.println("************************8"+ahr.size());
    	for (HealthRecord r : ahr){
    		String my_date= r.getDate();
    		
    		System.out.println(r.getDate());
    	}
    }
    
   }
