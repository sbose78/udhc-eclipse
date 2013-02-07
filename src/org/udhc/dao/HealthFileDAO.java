package org.udhc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.udhc.gen.DbCon;

public class HealthFileDAO {

	/**
	 * @param args
	 */
	
	// check
	public static int deleteHealthFile(int id)
	{
		// The table's primary key is idhealth_files

		int updateQuery =0;
    	try            
        {              
                Connection conn= DbCon.getDbConnection();
                PreparedStatement pstatement = null;

                                
                String queryString = "DELETE FROM health_files WHERE idhealth_files= ?";
                pstatement = conn.prepareStatement(queryString);                
                pstatement.setInt(1, id);                
                updateQuery = pstatement.executeUpdate();
               
                
                DbCon.closeConnection(conn, pstatement);            
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        	
           // return e.toString();
        }
    	return updateQuery;
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
