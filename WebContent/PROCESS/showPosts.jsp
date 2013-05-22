<%-- 
    Document   : showPosts
    Created on : 1 May, 2012, 12:56:13 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="org.udhc.models.*" %> 
<%@ page import="java.util.*" %> 

       
    
    <div class='div_posts_list'>

        <%
        	//      out.println("<div class='div_posts_list'>");
                    int topic_id=Integer.parseInt(request.getParameter("topic_id"));
                    ArrayList<ForumPost> posts = ForumPost.getPostsByTopic_id(topic_id);
                //    out.println("<br><B>"+topic_id+"</B>");
                     for (ForumPost f : posts)
                     {
                        out.println("<br><div class='process_post_author'>"  );   
                        out.println( f.getEmail() +" said, </div><br>"  );
                        out.println("<div class='process_post_content'>"+f.getPost_data() + "<br> </div>");
                     }
                     
                     //out.println("</div>");
        %>
        </div>
  