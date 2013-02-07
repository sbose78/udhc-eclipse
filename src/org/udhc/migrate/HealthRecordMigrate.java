package org.udhc.migrate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.udhc.gen.DbCon;
import org.udhc.gen.HealthRecord;

public class HealthRecordMigrate {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrayList<HealthRecord>  lhr= getAllHealthRecords();
		insertAllHealthRecords(lhr);

	}
	
	
	
	public static ArrayList<HealthRecord> getAllHealthRecords()
    {
        ArrayList<HealthRecord> lhr = new ArrayList<HealthRecord>();
        
        Connection con;//=DbCon.getDbConnection();
     
        try{
            
                con=SourceDB.getDbConnection();

                ResultSet rst=null;
                Statement stmt=null;

                stmt=con.createStatement();
                rst=stmt.executeQuery("select idforum, topic, social_worker_id, problem_id, problem_details from forum");
                while(rst.next()){
                	System.out.println("****");
                    HealthRecord h=new HealthRecord(rst.getString("idforum"),rst.getString("topic"),rst.getString("social_worker_id"),rst.getString("problem_id"),rst.getString("problem_details"));
                    lhr.add(h);
                }
                SourceDB.closeConnection(con);
        }
        
        
        
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        
        
        return lhr;
    }
	
	
	public static void insertAllHealthRecords(ArrayList<HealthRecord> lhr)
	{
		for ( HealthRecord hr : lhr )
		{System.out.println("++++");
			insertHealthRecord(hr);
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	public static void insertHealthRecord(HealthRecord hr)
	{
		int status=0;
		 try            
	        {
	        	   // In the constructor it was set as "0".         	
	              // this.problem_id=sc_name; 
	                Connection conn=DestinationDB.getDbConnection();
	                PreparedStatement pstatement = null;

	                String queryString = "INSERT INTO forum(topic,social_worker_id,problem_details,problem_id) VALUES (?,?, ?,?)";
	                pstatement = conn.prepareStatement(queryString, pstatement.RETURN_GENERATED_KEYS);
	                
	                pstatement.setString(1, hr.getTopic());
	                pstatement.setString(2, hr.getSocialWorker_id());
	                
	                pstatement.setString(3, hr.getProblem_details());
	                pstatement.setString(4, hr.getProblem_id());
	                //pstatement.setBlob(5, consent_letter);                

	                status = pstatement.executeUpdate();
	                
	                System.out.println("Inserted ? "+status );
	                
	                DestinationDB.closeConnection(conn, pstatement);
	            
	        }
	        catch(Exception e)
	        {
	           e.printStackTrace();
	        }
	        
	}
    

}
