package org.udhc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import org.udhc.gen.DbCon;
import org.udhc.models.*;

public class EventDAO {

	public int insert(Event event){
		
		
		 Connection conn= DbCon.getDbConnection();
         PreparedStatement pstatement = null;
         
         
         String queryString = "INSERT INTO event(publisher_role,publisher,patient_name,date,event) VALUES (?,?,?,?,?)";
         
         try{

             pstatement = conn.prepareStatement(queryString, pstatement.RETURN_GENERATED_KEYS);
             
             pstatement.setInt(1,event.getPublisher_role());
             pstatement.setString(2, event.getPublisher());         
             pstatement.setString(3, event.getPatient_name());
             pstatement.setString(4, event.getDate());
             pstatement.setString(5, event.getEvent());
             
             
             int updateQuery = pstatement.executeUpdate();
             
             ResultSet my_keys = pstatement.getGeneratedKeys();
             while(my_keys.next())
             {
             	
             	return my_keys.getInt(1);
             	
             }
             
             
          }
         catch(Exception e){
        	 e.printStackTrace();        	 
         }
         finally{
        	 DbCon.closeConnection(conn, pstatement);
         }
		 return -1;
	}
	
	public ArrayList<Event> getAllPosts(String patient_name){
		
		ArrayList<Event> all_posts = new ArrayList<Event>();
		
		
		Connection con;//=DbCon.getDbConnection();
        String a="";
 //       ArrayList<Solution> solutions= new ArrayList<Solution>();
        try{            
                con=DbCon.getDbConnection();
                ResultSet rst=null;
                Statement stmt=null;
                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from event where patient_name = '"+patient_name+"' ORDER BY date ASC");                                   
                
                while(rst.next())
                {
                	int id= rst.getInt("id");
                	String date = rst.getString("date");
                	date = formatMySQLDateToString(date);
                	
                	String event_data = rst.getString("event");
                	String publisher = rst.getString("publisher");
                	int role= rst.getInt("publisher_role");
                	String event_story = rst.getString("event");
                	Event event = new Event(id, role, publisher,patient_name,date,event_story );
                	System.out.println(id);
                	all_posts.add(event);
                	
                	
//int solution_id, int topic_id, String solution_content,String solution_date, String solution_user, String solution_language
                	
                	                         
                	 
                }
                DbCon.closeConnection(con);
                
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
            return null;
        }
        
        return all_posts;
		
	}
	
	public JSONArray getAllPosts_json(String patient_name){
		
		ArrayList<Event> all_posts = getAllPosts(patient_name);
		JSONArray array = new JSONArray();
		
		for ( Event event : all_posts ){
			JSONObject object=new JSONObject();
			object.put("id", event.getId());
			object.put("event_story", event.getEvent());
			object.put("date", event.getDate());

			array.add(object);
		}
		
		
		return array;
		
	}
	
	
	public void insertDate(String date){
			

		 Connection conn= DbCon.getDbConnection();
       PreparedStatement pstatement = null;
       
       
       String queryString = "INSERT INTO test(name, date) VALUES (?,?)";
       
       try{

           pstatement = conn.prepareStatement(queryString, pstatement.RETURN_GENERATED_KEYS);
           
          
           pstatement.setString(1,"shoubhik_bose");         
           //java.sql.Date date1 = new java.sql.Date();
           
           
                        pstatement.setString(2, date);
           
           
           int updateQuery = pstatement.executeUpdate();
           
           ResultSet my_keys = pstatement.getGeneratedKeys();
                        
           
        }
       catch(Exception e){
      	 e.printStackTrace();        	 
       }
       finally{
      	 DbCon.closeConnection(conn, pstatement);
       }
	}
	
	public static String formatMySQLDateToString(String mysql_date){
		//2013-04-21
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date  date = sdf.parse(mysql_date);
			System.out.println(date.toString());
			
			sdf= new SimpleDateFormat("MMM d, yyyy");
			return sdf.format(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		
	}

	public String getDate(){
		
		Connection con;//=DbCon.getDbConnection();
        String a="";
 //       ArrayList<Solution> solutions= new ArrayList<Solution>();
        try{            
                con=DbCon.getDbConnection();
                ResultSet rst=null;
                Statement stmt=null;
                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from test ORDER BY DATE DESC");                                   
                
                while(rst.next())
                {
                	//int id= rst.getInt("id");
                	String date = rst.getString("date");
                	return date;
                	
                	
//int solution_id, int topic_id, String solution_content,String solution_date, String solution_user, String solution_language
                	
                	                         
                	 
                }
                DbCon.closeConnection(con);
                
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
            return null;
        }
        
        return "";
		
		
		

	}
	
	public static void main(String args[]){
		System.out.println(formatMySQLDateToString("2013-09-11"));
	}
		
}
