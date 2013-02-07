/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author root
 */
package org.udhc.gen;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
public class ForumPost {
    
    int topic_id;
    String post_data;
    int post_id;
    String email;
    int voteups;
    int votedowns;
    String date;
    
    public ForumPost(int post_id,int topic_id,String post_data,String email, int voteups, int votedowns , String date)
    {
        this.post_id=post_id;
        this.topic_id=topic_id;
        this.post_data=post_data;
        this.email=email;
        this.voteups=voteups;
        this.votedowns=votedowns;
        this.date=date;
    }
    
    
    
    public String insertForumPost()
    {
        try
        {
                Connection conn= org.udhc.gen.DbCon.getDbConnection();
                PreparedStatement pstatement = null;

                String queryString = "INSERT INTO forum_post(topic_id,post_data,email,voteups,votedowns,date) VALUES (?, ?,?,?,?,?)";
                pstatement = conn.prepareStatement(queryString);
                
                pstatement.setInt(1, this.topic_id);
                pstatement.setString(2, this.post_data);
                pstatement.setString(3, this.email);
                pstatement.setInt(4, this.voteups);
                pstatement.setInt(5, this.votedowns);
                pstatement.setString(6, this.date);               
                
                
                int updateQuery = pstatement.executeUpdate();
                
                org.udhc.gen.DbCon.closeConnection(conn, pstatement);
            
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
            return e.toString();
            
        }
        return "OK";
     
    }
    
    
    public int getTopic_id()
    {return this.topic_id;
    
    }
    public int getPost_id()
    {
        return post_id;
    }
    public String getPost_data()
    {
        return post_data;
    }
    public String getEmail()
    {
        return email;
    }
    public int getVoteups()
    {
        return voteups;
    }
    public int getVotedowns()
    {
        return votedowns;
    }
    public static ArrayList<ForumPost> getPostsByTopic_id(int topic_id)
    {
     
         ArrayList<ForumPost> lhr = new ArrayList<ForumPost>();
        
        Connection con;//=DbCon.getDbConnection();
     
        try{
            
                con=org.udhc.gen.DbCon.getDbConnection();  

                ResultSet rst=null;
                Statement stmt=null;

                stmt=con.createStatement();
                rst=stmt.executeQuery("select * from forum_post where topic_id = "+topic_id+" order by post_id asc");
                while(rst.next()){
                    
                        int post_id=rst.getInt("post_id");
                        int topic_id_local=rst.getInt("topic_id");
                        String post_data=rst.getString("post_data");
                        String email=rst.getString("email");
                        int voteups=rst.getInt("voteups");
                        int votedowns=rst.getInt("votedowns");
                        String date=rst.getString("date");
                        
                        System.out.println(post_data);
                                       
                        ForumPost fp=new ForumPost(post_id,topic_id_local,post_data,email,voteups,votedowns,date);
                        
                        lhr.add(fp);
                        
                }
                DbCon.closeConnection(con);
        }
        
        
        
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
        
        return lhr;
        
    }
    
    
               
    
            
}
