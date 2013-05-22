/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.udhc.models;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.udhc.gen.DbCon;


/**
 *
 * @author root
 */
public class Report {
    
    String social_worker_id;
    String patient_id;
    String description;
    InputStream image_report;
    String report_id;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public InputStream getImage_report() {
        return image_report;
    }

    public void setImage_report(InputStream image_report) {
        this.image_report = image_report;
    }

    public String getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(String patient_id) {
        this.patient_id = patient_id;
    }

    public String getReport_id() {
        return report_id;
    }

    public void setReport_id(String report_id) {
        this.report_id = report_id;
    }

    public String getSocial_worker_id() {
        return social_worker_id;
    }

    public void setSocial_worker_id(String social_worker_id) {
        this.social_worker_id = social_worker_id;
    }
    
    public Report( String report_id, String social_worker_id,String patient_id,String description,InputStream image_report)
    {
        this.image_report=image_report;
        this.description=description;
        this.patient_id=patient_id;
        this.report_id=report_id;
        this.social_worker_id=social_worker_id;
                
    }
    
    public Report(String social_worker_id,String patient_id,String description, InputStream image_report)
    {
    
        this.image_report=image_report;
        this.description=description;
        this.patient_id=patient_id;
        
        this.social_worker_id=social_worker_id;
                
    }
    
    // for getting image info
    
    // the filename gets mapped to the description
    
    public Report(String report_id  , String description )
    {
        this.report_id=report_id;
        this.description=description;
    }
    
    public String insertReport()
    {
        
        try            
        {
               
                Connection conn= DbCon.getDbConnection();
                PreparedStatement pstatement = null;

                String queryString = "INSERT INTO health1.report(social_worker_id,patient_id,description,image_report) VALUES (?,?, ?,?)";
                pstatement = conn.prepareStatement(queryString);
                
                pstatement.setString(1, this.social_worker_id);
                pstatement.setString(2, this.patient_id);
                
                pstatement.setString(3, this.description);
                
                pstatement.setBlob(4, this.image_report);                
                
                int updateQuery = pstatement.executeUpdate();
                
                DbCon.closeConnection(conn, pstatement);
            
        }
        catch(Exception e)
        {
            return e.toString();
        }
        

        
        
        return "OK";
    }
    
    
    public ArrayList<Report> getReportsByPatientID(String patient_id)
    {
        ArrayList<Report> alr=new ArrayList<Report>();
        
        
        Connection con;//=DbCon.getDbConnection();
     
        try{
            
                con=DbCon.getDbConnection();

                ResultSet rst=null;
                Statement stmt=null;

                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from health1.report where patient_id = '"+patient_id+"'");
                while(rst.next()){

                    //social_worker_id,patient_id,description,image
                    Report h=new Report(rst.getString("report_id"),rst.getString("social_worker_id"),rst.getString("patient_id"),rst.getString("description"),rst.getBinaryStream("image_report"));
                    alr.add(h);
                }
                DbCon.closeConnection(con);
        }
        
        
        
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        
        
        return alr;
        
    }
    
     public static ArrayList<Integer> getImagesList(int patient_id)
    {
        ArrayList<Integer> list=new ArrayList<Integer>();
        Connection con;
        
       try{
            
                con=DbCon.getDbConnection();

                ResultSet rst=null;
                Statement stmt=null;
                
              

                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from health1.report "  );
                while(rst.next()){
                    
                    list.add(rst.getInt("report_id"));     
                }
                DbCon.closeConnection(con);
        } 
        
        catch(Exception e)
        {
            System.out.println(e.toString());
        }      
        
        return list;     
    }
     
     
      public static byte[] getImageData(int idhealth_files)
    {
        Connection con;//=DbCon.getDbConnection();
        
          InputStream is;
          byte[] imgdata=null;
     
        try{
            
                con=DbCon.getDbConnection();

                ResultSet rst=null;
                Statement stmt=null;
                
              

                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from health1.report where report_id = "+idhealth_files);
                while(rst.next()){
                    
                        //is=rst.getBinaryStream("file");
                         Blob b=rst.getBlob("image_report");
                         imgdata=b.getBytes(1, (int)b.length());
                         break;
                         
                }
                DbCon.closeConnection(con);
                return imgdata;
        }
        
        
        
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        return null;
        
    }
    
    
    
    
    
}
