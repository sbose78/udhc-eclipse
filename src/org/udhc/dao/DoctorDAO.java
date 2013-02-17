package org.udhc.dao;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.print.Doc;

import org.udhc.gen.DbCon;
import org.udhc.gen.models.*;

public class DoctorDAO {
	
	
		public String insert(Doctor doctor){
				
						try
						{
			
						 	 
					         Connection conn= DbCon.getDbConnection();
					         PreparedStatement pstatement = null;
					         
					         DateFormat dateFormat = new SimpleDateFormat("EEE, MMM d, ''yy");
					         Date date = new Date();
					         String upload_date = dateFormat.format(date).toString();
					
					         String queryString = "INSERT INTO doctor(doctor_name, doctor_email, doctor_about, doctor_date) VALUES (?, ?,?,?)";
					         pstatement = conn.prepareStatement(queryString, pstatement.RETURN_GENERATED_KEYS);
					         
					         pstatement.setString(1, doctor.getDoctor_name());
					         pstatement.setString(2, doctor.getDoctor_email());         
					         pstatement.setString(3, doctor.getDoctor_about());
					         pstatement.setString(4, upload_date );
					         
					                   
					         
					         
					         int updateQuery = pstatement.executeUpdate();
					         
					         ResultSet my_keys = pstatement.getGeneratedKeys();
					         while(my_keys.next())
					         {
					         	
					         	return my_keys.getInt(1)+"";
					         	
					         }
					         
					         DbCon.closeConnection(conn, pstatement);
			    
						}
						catch(Exception e)
						{
							return e.toString();
						}
				
				
				
				return "";
			}
		
		public Doctor getDoctorByEmail(String doctor_email){
			Doctor doctor = null;
			Connection con;//=DbCon.getDbConnection();
	        String a="";
	 //       ArrayList<Solution> solutions= new ArrayList<Solution>();
	        try{            
	                con=DbCon.getDbConnection();
	                ResultSet rst=null;
	                Statement stmt=null;
	                stmt=con.createStatement();
	                rst=stmt.executeQuery("select * from doctor where doctor_email = '"+doctor_email+"'");                                   
	                
	                while(rst.next())
	                {
	                	int doctor_id= rst.getInt("doctor_id");
	                	String doctor_date = rst.getString("doctor_date");
	                	String doctor_about = rst.getString("doctor_about");
	                	String doctor_dp = rst.getString("doctor_dp");
	                	String doctor_name = rst.getString("doctor_name");
	                	
	                	
	//int solution_id, int topic_id, String solution_content,String solution_date, String solution_user, String solution_language
	                	
	                	 doctor=new Doctor(doctor_name, doctor_email, doctor_about,
	                				doctor_dp, doctor_id);                           
	                	 break;
	                }
	                DbCon.closeConnection(con);
	                
	        }
	        catch(Exception e)
	        {
	            System.out.println(e.toString());
	            return null;
	        }
	        
	        return doctor;
			
		}
		
		
		public String update(Doctor doctor){
			 int updateQuery=0;
			try            
	        {
	              
	                Connection conn= DbCon.getDbConnection();
	                PreparedStatement pstatement = null;
	                
	                
	                
	                String queryString = "UPDATE doctor SET doctor_about = ? ," +
	                		"doctor_name = ?  ," +
	                		"doctor_dp = ? " +
	                		"WHERE doctor_email = ?";
	                pstatement = conn.prepareStatement(queryString); 
	                
	                pstatement.setString(1, doctor.getDoctor_about());   
	                pstatement.setString(2, doctor.getDoctor_name());
	                pstatement.setString(3, doctor.getDoctor_dp());
	                pstatement.setString(4, doctor.getDoctor_email());
	                
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
		
		public String getMD5Hash(String name){
			
			String plaintext =name;
			MessageDigest m;
			String hashtext="";

			try {
				m = MessageDigest.getInstance("MD5");
				m.reset();
				m.update(plaintext.getBytes());
				byte[] digest = m.digest();
				BigInteger bigInt = new BigInteger(1,digest);
				hashtext = bigInt.toString(16);
				// Now we need to zero pad it if you actually want the full 32 chars.
				while(hashtext.length() < 32 ){
				  hashtext = "0"+hashtext;
				}
				System.out.println(hashtext);
				
				
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return hashtext;
			
		}
		
		public String getGravatarLink(String email){
			return "http://www.gravatar.com/avatar/"+getMD5Hash(email);
		}
				


	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	

	}

}
