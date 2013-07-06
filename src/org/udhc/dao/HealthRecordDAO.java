package org.udhc.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.io.InputStream;

import org.json.simple.parser.*;
import org.json.simple.*;
import org.udhc.gen.DbCon;
import org.udhc.models.HealthRecord;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

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
	    
	    // REST client to access similar-cases service
	    
	    public static JSONArray getSimilarRecords(String search_key)
	    {
	    	try {
	    		 
	    		Client client = Client.create();
	     
	    		String post= "report="+search_key;
	    		
	    		
	    		WebResource webResource = client
	    		   .resource("http://health-nodejstest.rhcloud.com/similarity");
	     
	    		ClientResponse response = webResource.accept("application/json")
	                       .post(ClientResponse.class,post);
	     
	    		if (response.getStatus() != 200) {
	    		   throw new RuntimeException("Failed : HTTP error code : "+ response.getStatus());
	    		}
	     
	    		String output = response.getEntity(String.class);	    		
	    		JSONArray a = (JSONArray)(new JSONParser().parse(output));
	    		
	    		return a;
	     
	    	  } catch (Exception e) {
	     
	    		e.printStackTrace();
	     
	    	  }
	    	
	    	return null ;
	    }
	

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		System.out.println(getSimilarRecords("cancer"));
		

	}

}
