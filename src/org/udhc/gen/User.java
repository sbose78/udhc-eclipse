/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.udhc.gen;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.mysql.jdbc.UpdatableResultSet;

/**
 *
 * @author root
 */
public class User {
    
    int role ; // SOCIAL , SEEKER , GIVER
    public int getRole() {
		return role;
	}



	public void setRole(int role) {
		this.role = role;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public int getApproved() {
		return approved;
	}



	public void setApproved(int approved) {
		this.approved = approved;
	}



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}

	String email ; // only for GIVER and SEEKER
    int approved; 
    String userid;
    String name;
    
    // this constructor is used for the PATIENT table. 
    // name = scientific name of patient
    // email = email of social worker
    
    public User(String name, String email)
    {
        this.name=name;
        this.email=email;
               
    }
    

    
    public User(int role,String email,String name, int approved)
    {
        this.role=role;
        this.email=email;
        this.approved=approved;
        this.name= name;
        
    }
    
    
    
    
    public User(int role,String email,int approved,String name,String userid)
    {
        this.role=role;
        this.email=email;
        this.approved=approved;
        this.name=name;
        this.userid=userid;
    }
    
    
    
    public static String getScientificName()
    {
        
        Connection con;//=DbCon.getDbConnection();
     
        try{
            
                con=DbCon.getDbConnection();

                ResultSet rst=null;
                Statement stmt=null;

                stmt=con.createStatement();
                con.setAutoCommit(false);
                rst=stmt.executeQuery("select name from scientific_names where used = 0 ");
              
                while(rst.next()){
                    
                    
                        String name=rst.getString("name");
                          stmt.executeUpdate("UPDATE scientific_names SET used = 1  WHERE name= '"+name+"'");
                      //  System.out.println(name);
                    //    name=sanitizeName(name);
                        con.commit();
                        DbCon.closeConnection(con);
                        return name;
                }
                
                stmt = null;
                
                
                DbCon.closeConnection(con);
                
                
        }
        
        
        
        catch(Exception e)
        {
            System.out.println(e.toString());
        }       
        
        
        return "ERROR RETIEVING SCIENTIFIC NAME";
    }
    
    public static String[] getModeratorEmails()
    {
    	String arr[]={"sbose78@gmail.com", "shivika.ch@gmail.com ","rakesh7biswas@gmail.com",
      "pranab@pranab.in","tamoghnab@gmail.com","soumyadeepbhaumik@rediffmail.com","bera.kaustav@gmail.com" ,"rajibs123@yahoo.com" 
    			
    	};
    	return arr;
    }
    
    public static boolean isModerator(String email)
    {
    	String mods[]=getModeratorEmails();
    	for(String s: mods)
    	{
    		if(s.equalsIgnoreCase(email))
    		{
    			return true;
    		}
    	}
    	return false;
    }
    
    public static String sanitizeName(String s)
    {
        char original[]=s.toCharArray();
        char changed[]=new char[original.length];
        
        int j=0;
        for(int i=0;i<original.length;i++)
        {
            System.out.print(original[j]);
            if(Character.isLetter(original[i]))
            {
                changed[j++]=original[i];
            }
            else if(Character.isWhitespace(original[i]))
            {
                changed[j++]='_';
            }
                            
        }
        String updated=changed.toString();
        updated=updated.substring(0, j);
        System.out.println(updated);
        
        return updated;
    }
    
    public static boolean checkUserPresence(String email)
    {
        
        
        Connection con;//=DbCon.getDbConnection();
     
        try{
            
                con=DbCon.getDbConnection();

                ResultSet rst=null;
                Statement stmt=null;

                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from user_roles ");
                while(rst.next()){
                    if(rst.getString("email").equals(email))
                        return true;
                }
                DbCon.closeConnection(con);
        }
        
        
        
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        
        
        return false;
    }
    
    /*
    public ArrayList<User> getAllUsers()
    {
        
        ArrayList<HealthRecord> lhr = new ArrayList<HealthRecord>();
        
        Connection con;//=DbCon.getDbConnection();
     
        try{
            
                con=DbCon.getDbConnection();

                ResultSet rst=null;
                Statement stmt=null;

                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from health1.user_roles ");
                while(rst.next()){

                    
                    User =new HealthRecord(rst.getString("idforum"),rst.getString("topic"),"0","0",rst.getString("problem_details"));
                    lhr.add(h);
                }
        }
        
        
        
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        return lhr;
    }
    * 
    * 
    */
    
    public static String getRole(String email)
    {
        
        return "SOCIAL";
    }
    
    public String insertUser()
    {
        try
        {
                Connection conn= DbCon.getDbConnection();
                PreparedStatement pstatement = null;        

                String queryString = "INSERT INTO user_roles(role,email,approved,name) VALUES (?, ?,?, ?)";
                pstatement = conn.prepareStatement(queryString);
                
                this.role *= -1;
               
                pstatement.setInt(1, this.role);
                pstatement.setString(2, this.email);
                
/*
 * 
 * 	  If a user claims to be a doctor or social worker 
 * 	  then he needs to get approved from the moderators.
 * 
 *   So , role =1,2,-1,-2    ->   approved = 0 or NOT APPROVED
 *        role =0  -> needs care-seeker or lowest privileges , hence can be approved.		
 * 
 */
                
                
                if( this.role !=0  )
                {
                	this.approved = 0;
                }
                else{
                	this.approved = 1;
                }
                pstatement.setInt(3, this.approved);
                pstatement.setString(4, this.name);
                
                int updateQuery = pstatement.executeUpdate();
                
                DbCon.closeConnection(conn, pstatement);
            
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
            return e.toString();
            
        }
        return "OK";
     
        
    }
    
    public static ArrayList<User> getPatientsBySocialWorkerID(String social_worker_id)
    {
        
        Connection con;//=DbCon.getDbConnection();
        
        ArrayList<User> user_al=new ArrayList<User>();
     
        try{
            
                con=DbCon.getDbConnection();

                ResultSet rst=null;
                Statement stmt=null;

                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from patient where social_worker_id = '"+social_worker_id+"'");
                while(rst.next()){
                    
                	System.out.println("Found atleast one");
                	
                    String social_worker=rst.getString("social_worker_id");
                    String name=rst.getString("name") ;
                    
                    
                    User user=new User(name,social_worker);
                    user_al.add(user);
                        //return true;
                }
                DbCon.closeConnection(con);
        }
        
        
        
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        
        return user_al;
    }
    
    
    
    
    public String insertSocialWorkerPatient()
    {
        String name=this.name;
        String social_worker_id=this.email;
         try
        {
                Connection conn= DbCon.getDbConnection();
                PreparedStatement pstatement = null;        

                String queryString = "INSERT INTO patient(name,social_worker_id) VALUES (?, ?)";
                pstatement = conn.prepareStatement(queryString);                
                
                pstatement.setString(1, name);                
                pstatement.setString(2, social_worker_id);
                
                int updateQuery = pstatement.executeUpdate();                
                DbCon.closeConnection(conn, pstatement);            
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
            return e.toString();
            
        }
                
        
     
        return "OK";
    }
    
    public static String getName(String email)
    {
        
                    Connection con;//=DbCon.getDbConnection();
                    String name="";

                            try{

                                    con=DbCon.getDbConnection();

                                    ResultSet rst=null;
                                    Statement stmt=null;

                                    stmt=con.createStatement();
                                    rst=stmt.executeQuery("SELECT name FROM user_roles where email = '"+email+"'");//'sbose78@gmail.com'");
                                    while(rst.next()){
                                        name= rst.getString("name");
                                    }
                                    DbCon.closeConnection(con);
                                    
                            }



                            catch(Exception e)
                            {
                                System.out.println(e.toString());
                            }
 
                               if(name.equals(""))
                               {
                                   name="ANONYMOUS";
                               }

                               
                            return name;

        
    }
    
    
    public static String getRedirectURL(HttpServletRequest request )
    {
        try{
            
            if(request.getSession()!=null)
            {
                String s=(String)request.getSession().getAttribute("redirect_url").toString();
                return s;        
            }

        }
        
        catch(Exception e )
        {
            return request.getContextPath()+"/home.jsp";
        }
        return request.getContextPath()+"/home.jsp";
        
    }
    
    public static String getLoggedInUserName( HttpServletRequest request )
    {
        try{
            
            if(request.getSession()!=null)
            {
                String s=(String)request.getSession().getAttribute("name").toString();
                return s;        
            }

        }
        
        catch(Exception e )
        {
            return "GUEST";
        }
        return "GUEST";
    }
    
    public static String getLoggedInUserEmail( HttpServletRequest request )
    {
        try{
            if(request.getSession()!=null)
            {
                String s=(String)request.getSession().getAttribute("email").toString();
                return s;        
            }
        }
        catch(Exception e)
        {
            return "GUEST";
        }
        return "GUEST";
    }
    
    public static String getLoggedInUserRole( HttpServletRequest request )
    {
        try
                {
                if(request.getSession()!=null)
                {
                    String s=(String)request.getSession().getAttribute("role").toString();
                    return s;        
                }

        }
       catch(Exception e)
        {
            return "0";
        }
        return "0";
    }
    
    
     public static int getLoggedInUserRole( String email )
     {
            Connection con;//=DbCon.getDbConnection();
                    String name="";
                    int n=0;

                            try{

                                    con=DbCon.getDbConnection();

                                    ResultSet rst=null;
                                    Statement stmt=null;

                                    stmt=con.createStatement();
                                    rst=stmt.executeQuery("SELECT role FROM user_roles where email = '"+email+"'");//'sbose78@gmail.com'");
                                    while(rst.next()){
                                        n= rst.getInt("role");
                                    }
                                    DbCon.closeConnection(con);
                                    
                            }



                            catch(Exception e)
                            {
                                System.out.println(e.toString());
                            }
 
                              
                            return n;
    }
     
    public static int approvePrivilege(String email, int current_privilege){
     
    	int final_privilege = current_privilege*(-1);
    	System.out.println("Final: "+ final_privilege);
    	int no_of_rows_updated = 0;
    	int approved = 1;
    	if( final_privilege < 0){
    		approved = 0;
    	}
       
         try
        {
                Connection conn= DbCon.getDbConnection();
                PreparedStatement pstatement = null;        

                String queryString = "UPDATE user_roles set role = ? , approved  = ? where email  = ?";
                pstatement = conn.prepareStatement(queryString);                
                
                pstatement.setInt(1,final_privilege);
                pstatement.setInt(2,approved);
                pstatement.setString(3, email);
                
               no_of_rows_updated = pstatement.executeUpdate();                
                DbCon.closeConnection(conn, pstatement);            
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
         
        }
         
         if( no_of_rows_updated >0 ){
        	 return final_privilege;
         }
         return current_privilege;
         
    }
    
    public static String getUserPrivilegeName(int privilege){
    	
    	if( Math.abs(privilege) == 1 )
    	{
    		return "Social worker";
    	}

    	if( Math.abs(privilege) == 2 )
    	{
    		return "Doctor";
    	}
    	
    	else if( privilege == 0){
    		return "patient";
    	}
    	
    		
    		return null;
    }
    
    public static ArrayList<User> getAllUsers(){
    	
    	   Connection con;//=DbCon.getDbConnection();

           ArrayList<User> all_users= new ArrayList<User>();

           int n=0;

                   try{

                           con=DbCon.getDbConnection();

                           ResultSet rst=null;
                           Statement stmt=null;

                           stmt=con.createStatement();
                           rst=stmt.executeQuery("SELECT * FROM user_roles");//'sbose78@gmail.com'");
                           
                           
                           while(rst.next()){
                          //     System.out.println("here");
                        	   User user = new User( rst.getInt("role"), rst.getString("email"), rst.getString("name"), rst.getInt("approved"));
                        	   all_users.add(user);
                           }
                           DbCon.closeConnection(con);
                   } catch(Exception e)
                   {
                       System.out.println(e.toString());
                   }
                   return all_users;    	
    }
    
    public static void signout(HttpServletRequest request)
    {
        request.getSession(true).setAttribute("email", "GUEST");
        request.getSession(true).setAttribute("role", "0");
    }
    
    public String toString() {
    	
    	return "EMAIL: "+ this.email +" Approved: "+this.approved+ " Privilege: "+this.role;
		
	}
    
    public static void main(String args[])
    {
    	 ArrayList<User> all_users = User.getAllUsers();
    	 for ( User u : all_users){
   // 		 System.out.println("here");
    		 System.out.println(u);
    	 }
    	
    }            
}
