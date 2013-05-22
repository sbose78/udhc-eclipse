

<%@page import="org.udhc.models.*"%>
<%@page import="java.util.*"%>

<style>



.discussion_post
{
	
	
	background-color: #D8DDE8;
	
}

.discussion_author
{
	height: 10px;
	padding:2%;
	background-color: #2D3038;
	color: #FA8B19 ;
}

.discussion_author_info
{
	padding:2%;
	width:6%;
	background-color: #D8DDE8;
	position:absolute;
	
	height:auto;
	float: none;	
}

.discussion_content
{
	padding:5%;
	margin-left:21%;
	background-color: white;
	
		
}
.makeup
{
 background-color: white;
}

</style>

 <%
        	//      out.println("<div class='div_posts_list'>");
					int topic_id=Integer.parseInt(request.getParameter("topic_id"));

                    ArrayList<ForumPost> posts = ForumPost.getPostsByTopic_id(topic_id);
                //    out.println("<br><B>"+topic_id+"</B>");
                     for (ForumPost f : posts)
                     {
                    	 String author = f.getEmail();
                    	 String postData= f.getPost_data();
                    	 
                        
                     
                     
                     //out.println("</div>");
        %>

		

		 <div class="discussion_post">
			 	<div class="discussion_author">
			 		<%= author %>
			 	</div>
			 	<div id="makeup">
			 	<div class="discussion_author_info">
			 	
			 		<a href="#">
			 		<img width="60px" height="60px" src="https://canv.as/static/img/default_avatar_4.png">
			 		</a> <br>
			 		12 posts 
			 	</div>
			 	<div class="discussion_content">
			 	  <%= postData %> 
			 	</div> 
			 	
			 	</div>
		</div><br>
		<div>
		
		</div>
		<br><br>
		<br><br>

		
		
		<%
		
		
                     }
		%>
		
		<br><br>
