package org.udhc.migrate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class SourceDB {

	/**
	 * @param args
	 */
	
	
	 public static Connection getDbConnection()
	    {
	        Connection conn = null;
	        try{
	                System.out.println("MySQL Connection being established");
	               
	                
	                String url = "jdbc:mysql://instance7904.db.xeround.com:5950/";
	                String dbName = "health1";
	                String driver = "com.mysql.jdbc.Driver";
	                String userName = "sbose78_db1"; 
	                String password = "qwerty";
	                
	                /*
	                
	                String url = "jdbc:mysql://localhost:3306/";
	                String dbName = "udhc_local_db";
	                String driver = "com.mysql.jdbc.Driver";
	                String userName = "root"; 
	                String password = "qwerty";  */
	                Class.forName(driver).newInstance();
	                conn = DriverManager.getConnection(url+dbName,userName,password);
	                System.out.println("Connected to the database");

	        }
	          
	          catch (Exception e) 
	            {
	                e.printStackTrace();
	                
	            }
	          
	          return conn;
	    }
	    
	    public static String closeConnection(Connection con, PreparedStatement ps)
	    {
	        try{
	        ps.close();
	        con.close();
	        }
	        catch(Exception e)
	        {
	            return e.toString();
	        }
	        return "OK";
	        
	    }
	    
	    public static String closeConnection(Connection con)
	    {
	        try{
	        //ps.close();
	        con.close();
	        }
	        catch(Exception e)
	        {
	            return e.toString();
	        }
	        return "OK";
	        
	    }
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
