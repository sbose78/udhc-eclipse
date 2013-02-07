<%-- 
    Document   : mySocialUploads
    Created on : 2 May, 2012, 3:46:26 PM
    Author     : root
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="org.udhc.gen.*" %> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        

        
            <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  <script type="text/javascript" src="thickbox.js"></script>
  
  <link rel="stylesheet" href="thickbox.css" type="text/css" media="screen" />
  
   <script>
  $(document).ready(function() {
    $("#accordion").accordion();
  });
  </script>
  
        <title>My submissions</title>
        
        
    </head>
    
     
    
    
    <div align='right'>
    
    You are signed in as <%=org.udhc.gen.User.getLoggedInUserEmail(request)%>
    
    </div>

    
    <%@include file="hpanel.jsp" %>
        
    <body align="center">
        
       
        
        
        <%
                ArrayList<HealthRecord> list = HealthRecord.getSubmissionsByUserEmail(User.getLoggedInUserEmail(request));
                
                out.println("<div id='accordion'>");
                
                for(HealthRecord healthRecord : list)
                {
                    String topic=healthRecord.getTopic();
                    String topic_id=healthRecord.getTopic_id();
                    String problem_id =healthRecord.getProblem_id();
                    
                    
                    out.println("<h3><a href='#'>"+problem_id+" : "+topic+" </a></h3>");                                  
                    out.println("<div>");
                  //  out.println("<a href='"+request.getContextPath()+"/updateHealthRecord.jsp?topic_id="+topic_id+"'>UPDATE</a>");
%>
<div align="center">  
           
            <a href="<%=request.getContextPath()%>/showIssue.jsp?topic_id=<%=topic_id  %>"> Care-seeker narrative  </a>         
            &nbsp;&nbsp; ||&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/network.jsp?topic_id=<%=topic_id %>"> Network processing page  </a> 
            &nbsp;&nbsp; ||&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/SOLUTION/solution.jsp?topic_id=<%=topic_id  %>"> Solution page </a> 


            <br><br>     Upload more files?

         <form action="<%=request.getContextPath()%>/UploadImage" method="post" enctype="multipart/form-data" >
             <input name="topic_id" value="<%=topic_id%>" type="hidden">
            <input name="f" type="file" id="f">
            <input type="submit" value="Upload image">
         </form>
    
    
            

            
            <br><br>

<%
                    
                    
                    ArrayList<Integer> images=HealthRecord.getImagesList(Integer.parseInt(topic_id));
                    int i=0;
                    for(Integer image : images )
                    {   i++;
                        out.println("<a href='"+request.getContextPath()+"/ViewImage?file_id="+image+"'>Attached image "+i+"</a> &nbsp,&nbsp");
                    }
                    out.println("</div></div>");
                }
                
                out.println("</div>");
            
        
        %>
        
    </body>
</html>
