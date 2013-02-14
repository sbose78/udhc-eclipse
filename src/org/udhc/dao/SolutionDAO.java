package org.udhc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.udhc.gen.DbCon;
import org.udhc.gen.HealthRecord;
import org.udhc.gen.models.Solution;

public class SolutionDAO {
	
	
	public String insertSolution(Solution s)
	{  
		
		try{

		 	 
		         Connection conn= DbCon.getDbConnection();
		         PreparedStatement pstatement = null;
		         
		         DateFormat dateFormat = new SimpleDateFormat("EEE, MMM d, ''yy");
		         Date date = new Date();
		         String upload_date = dateFormat.format(date).toString();
		
		         String queryString = "INSERT INTO solution(topic_id, solution_user, solution_date, solution_content, solution_language) VALUES (?,?, ?,?,?)";
		         pstatement = conn.prepareStatement(queryString, pstatement.RETURN_GENERATED_KEYS);
		         
		         pstatement.setInt(1, s.getTopic_id());
		         pstatement.setString(2, s.getSolution_user());         
		         pstatement.setString(3, upload_date);
		         pstatement.setString(4,  s.getSolution_content());
		         pstatement.setString(5, s.getSolution_language());
		                   
		         
		         
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
	 return "OK";
	}
	
	public ArrayList<Solution> getSolutionsByTopicId(int topic_id){
		
		Connection con;//=DbCon.getDbConnection();
        String a="";
        ArrayList<Solution > solutions= new ArrayList<Solution>();
        try{            
                con=DbCon.getDbConnection();
                ResultSet rst=null;
                Statement stmt=null;
                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from solution where topic_id = "+topic_id);                                   
                
                while(rst.next())
                {
                	int solution_id = rst.getInt("solution_id");
                	String solution_content = rst.getString("solution_content");
                	String solution_date = rst.getString("solution_date");
                	String solution_user = rst.getString("solution_user");
                	String solution_language = rst.getString("solution_language");
                	
                	Solution s=new Solution(solution_id, topic_id, solution_content, solution_date, solution_user, solution_language);                           
                    solutions.add(s);
                }
                DbCon.closeConnection(con);
                
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        return solutions; 
	}
	
public static Solution getSolutionById(int solution_id){
	Solution s = new Solution();
		Connection con;//=DbCon.getDbConnection();
        String a="";
 //       ArrayList<Solution> solutions= new ArrayList<Solution>();
        try{            
                con=DbCon.getDbConnection();
                ResultSet rst=null;
                Statement stmt=null;
                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from solution where solution_id = "+solution_id);                                   
                
                while(rst.next())
                {
                	int topic_id= rst.getInt("topic_id");
                	String solution_content = rst.getString("solution_content");
                	String solution_date = rst.getString("solution_date");
                	String solution_user = rst.getString("solution_user");
                	String solution_language = rst.getString("solution_language");
                	
//int solution_id, int topic_id, String solution_content,String solution_date, String solution_user, String solution_language                	
                	 s=new Solution( solution_id, topic_id, solution_content,solution_date,  solution_user, solution_language);                           
                	 break;
                }
                DbCon.closeConnection(con);
                
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        return s;
	}

	

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		SolutionDAO dao = new SolutionDAO();

		for( int i=1 ;i<5;i++){
			Solution s= new Solution(1, "solution content2", "my date" , "solution_user", "solution_language");
			System.out.println(dao.insertSolution(s));
		}
		
	
		ArrayList<Solution> solutions = dao.getSolutionsByTopicId(1);
		for ( Solution s : solutions){
			System.out.println(s.getSolution_id());
		}
		

	}

}
