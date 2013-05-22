package org.udhc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.udhc.gen.DbCon;
import org.udhc.models.Doctor;
import org.udhc.models.Patient;

public class PatientDAO {
	
	
				public String insert(Patient patient){
					
							try
							{
					
							 	 
						         Connection conn= DbCon.getDbConnection();
						         PreparedStatement pstatement = null;
						         
						         DateFormat dateFormat = new SimpleDateFormat("EEE, MMM d, ''yy");
						         Date date = new Date();
						         String upload_date = dateFormat.format(date).toString();
						
						         String queryString = "INSERT INTO patient(name,age,sex,weight) VALUES (?, ?,?,?)";
						         pstatement = conn.prepareStatement(queryString, pstatement.RETURN_GENERATED_KEYS);
						         
						         pstatement.setString(1, patient.getPatient_name());
						         pstatement.setString(2, patient.getAge());         
						         pstatement.setString(3, patient.getSex());
						         pstatement.setString(4, patient.getWeight() );
						         
						         int updateQuery = pstatement.executeUpdate();
						         
						         ResultSet my_keys = pstatement.getGeneratedKeys();
						         while(my_keys.next())
						         {
						         	return my_keys.getInt(1)+"";
						         }
						         
					                DbCon.closeConnection(conn,pstatement);
					
							}
							catch(Exception e)
							{
								return e.toString();
							}
					
					
			
							return "";
					}
				
				
			public Patient  getPatientByID(int patient_id){
				Patient patient= new Patient();
				Connection con;
		        String a="";
		        try{            
		                con=DbCon.getDbConnection();
		                ResultSet rst=null;
		                Statement stmt=null;
		                stmt=con.createStatement();
		                rst=stmt.executeQuery("select * from patient where patient_id = "+patient_id);                                   
		                
		                while(rst.next())
		                {
		                	
		                	String date_of_joining = rst.getString("date_of_joining");
		                	String patient_name = rst.getString("name");
		                	String sex = rst.getString("sex");
		                	String weight = rst.getString("weight");
		                	String age = rst.getString("age");
		
		                	String social_worker_id = rst.getString("social_worker_id");
		                	
		                	
		                	patient=new Patient(patient_id, patient_name, social_worker_id, sex, age, weight, date_of_joining);
		                	
		                	                       
		                	 break;
		                }
		                DbCon.closeConnection(con,stmt,rst);
		                
		        }
		        catch(Exception e)
		        {
		            System.out.println(e.toString());
		            return null;
		        }
		        
		        return patient;
				
			}
	
			
			
			
			public String update(Patient patient){
				 int updateQuery=0;
				try            
		        { 
		                Connection conn= DbCon.getDbConnection();
		                PreparedStatement pstatement = null;
		                
		                //name,age,sex,weight
		                
		                String queryString = "UPDATE patient SET name  = ? ," +
		                		"sex = ? " +
		                		"weight = ? " +
		                		"age = ? " +
		                		"WHERE patient_id = ?";
		                pstatement = conn.prepareStatement(queryString); 
		                
		                pstatement.setString(1,patient.getPatient_name());
		                pstatement.setString(2, patient.getSex());
		                pstatement.setString(3, patient.getWeight());
		                pstatement.setString(4, patient.getAge());
		                pstatement.setString(5, patient.getSex());
		                
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
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
