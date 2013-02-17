package org.udhc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.udhc.gen.DbCon;

public class UserDAO {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		UserDAO dao = new UserDAO();
		System.out.println(dao.updateModerator("saurabh_11483@yahoo.com", true));

	}
	
	
	public String updateModerator(String email, boolean isModerator){
		
		 int updateQuery=0;
			try            
	        {
	              
	                Connection conn= DbCon.getDbConnection();
	                PreparedStatement pstatement = null;
	                
	                int moderator = isModerator?1:0;
	                
	                String queryString = "UPDATE user_roles SET moderator = ? where email = ?";
	                pstatement = conn.prepareStatement(queryString); 
	                
	                pstatement.setInt(1, moderator);   
	                pstatement.setString(2, email);
	               
	                System.out.println(pstatement);
	                updateQuery = pstatement.executeUpdate();
	                
	                DbCon.closeConnection(conn, pstatement);
	            
	        }
	        catch(Exception e)
	        {
	        	e.printStackTrace();
	        	return e.toString();
	        	
	           // return e.toString();
	        }
			
			return updateQuery+"";
		
	}

}
