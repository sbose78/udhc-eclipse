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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
public class DbCon {
	
	public static Connection getPooledDbConnection() throws NamingException, SQLException
	{
		
		Context initContext = new InitialContext();
		DataSource ds   = (DataSource)initContext.lookup("java:/comp/env/jdbc/TestDB");
		Connection conn = ds.getConnection();
		
		System.out.println(conn.toString());
		//use conn
		//conn.close();
		return conn;
		
	}
    
	
    public static Connection getDbConnection()
    {
        Connection conn = null;
        try{/*
                System.out.println("MySQL Connection being established");     
                
                Context initContext = new InitialContext();
        		DataSource ds   = (DataSource)initContext.lookup("java:/comp/env/jdbc/awsDB");
        		conn = ds.getConnection();
        		
        		
        		
        		System.out.println(conn.toString());
        		//use conn
        		//conn.close();
        		return conn;
        		*/
                
        
                            
                Properties properties = new Properties();
               	properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("credentials.properties"));
               	
                
                String url = "jdbc:mysql://"+ properties.getProperty("database_host")+":"+properties.getProperty("database_port")+"/";
                String dbName = properties.getProperty("database_database");
                String driver = "com.mysql.jdbc.Driver";
                String userName = properties.getProperty("database_user");
                String password = properties.getProperty("database_password");
                	
             
                
                Class.forName(driver).newInstance();
                conn= DriverManager.getConnection(url+dbName+"?user="+userName+"&password="+password+"&characterEncoding=utf8");
                
                //conn = DriverManager.getConnection(url+dbName,userName,password);
                
                System.out.println("Connected to the database");
                
           
               return conn;
                

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
    
    public static String closeConnection(Connection con,Statement ps)
    {
        try{
        ps.close();
        con.close();
        }
        catch(Exception e)
        {
            return e.toString();
        }
        finally{
        
        	ps=null;
        	con=null;
        }
        
        return "OK";
        
    }
    
    public static String closeConnection(Connection con,Statement ps, ResultSet rs)
    {
        try{
        rs.close();
        ps.close();
        con.close();
        }
        catch(Exception e)
        {
            return e.toString();
        }
        finally{
        	rs=null;
        	ps=null;
        	con=null;
        }
        
        return "OK";
        
    }
    public static String closeConnection(Connection con,PreparedStatement ps, ResultSet rs)
    {
        try{
        rs.close();
        ps.close();
        con.close();
        }
        catch(Exception e)
        {
            return e.toString();
        }
        finally{
        	rs=null;
        	ps=null;
        	con=null;
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
    	
		
	}
    
}
