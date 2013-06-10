package org.udhc.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.io.InputStream;

import org.udhc.gen.DbCon;
import org.udhc.models.HealthRecord;

public class HealthRecordDAO {
	
	
	
	   public static ArrayList<HealthRecord> getAllHealthRecords() throws IOException
	    {
	    	 
	    	
	     	
	        ArrayList<HealthRecord> lhr = new ArrayList<HealthRecord>();
	        
	        Connection con;//=DbCon.getDbConnection();
	     
	        try{
	            
	                con=DbCon.getDbConnection();

	                ResultSet rst=null;
	                Statement stmt=null;

	                stmt=con.createStatement();
	                rst=stmt.executeQuery("select * from forum where approved = 1 order by problem_id");
	                while(rst.next()){

	                    
	                    HealthRecord h=new HealthRecord(rst.getString("idforum"),rst.getString("topic"),rst.getString("social_worker_id"),rst.getString("problem_id"),rst.getString("problem_details"));
	                    lhr.add(h);
	                }
	                DbCon.closeConnection(con,stmt);
	        }
	        
	        
	        
	        catch(Exception e)
	        {
	            System.out.println(e.toString());
	        }
	        
	        
	        
	        return lhr;
	    }
	   
	    public InputStream getConsentLetter(int topic_id){
	    	
	    	InputStream consent_letter=null;
	    	Connection con;//=DbCon.getDbConnection();
		     
	        try{
	            
	                con=DbCon.getDbConnection();

	                ResultSet rst=null;
	                Statement stmt=null;

	                stmt=con.createStatement();
	                rst=stmt.executeQuery("select consent_letter from forum where idforum = "+topic_id);
	                while(rst.next()){
	                	consent_letter= rst.getBinaryStream("consent_letter");
	                	 
	                }
	                DbCon.closeConnection(con,stmt);
	        }
	        
	        
	        
	        catch(Exception e)
	        {
	            System.out.println(e.toString());
	        }
	        
	    	
	    	return consent_letter;
	    }
	

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
