/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.udhc.gen;

/**
 *
 * @author root
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Properties;
public class DbCon {
    
    public static Connection getDbConnection()
    {
        Connection conn = null;
        try{
                System.out.println("MySQL Connection being established");
               
              
             /*   
             
                  
                String url = "jdbc:mysql://localhost:3306/";
                String dbName = "udhc_local_db";
                String driver = "com.mysql.jdbc.Driver";
                String userName = "root"; 
                String password = "qwerty";
               
        */
                            
                Properties properties = new Properties();
               	properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("credentials.properties"));
               	
                
                String url = "jdbc:mysql://"+ properties.getProperty("database_host")+":"+properties.getProperty("database_port")+"/";
                String dbName = properties.getProperty("database_database");
                String driver = "com.mysql.jdbc.Driver";
                String userName = properties.getProperty("database_user");
                String password = properties.getProperty("database_password");
                	
             	/*
             	
             	database_host=jdbc:mysql://localhost:3306/
             		database_port=udhc_local_db
             		database_user=com.mysql.jdbc.Driver
             		database_password=root
             		database_database=qwerty
             		
             		*/

                
                
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
    
    public static void main(String args[]) {
    	getDbConnection();
		
	}
    
}
