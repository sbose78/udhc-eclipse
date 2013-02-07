<%-- 
    Document   : submitSolution.jsp
    Created on : 28 Apr, 2012, 2:55:33 PM
    Author     : root - shoubhik bose
--%>



          <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  
  
       <script src="http://yui.yahooapis.com/3.5.0/build/yui/yui-min.js"></script>
  
    
    
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/menu/assets/skins/sam/menu.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/container/assets/skins/sam/container.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/editor/assets/skins/sam/editor.css" />
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/element/element-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/container/container-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/menu/menu-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/button/button-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/editor/editor-min.js"></script>



<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/fonts/fonts-min.css" />
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/yahoo/yahoo-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/event/event-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/connection/connection-min.js"></script>

    <script src="http://yui.yahooapis.com/3.5.0/build/yui/yui-min.js"></script>        



<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/fonts/fonts-min.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/SOLUTION/scripts.js"></script>



    

    

<%@ page import="org.udhc.gen.*" %> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    
    <head>
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Health record form</title>
    </head>
    
    <%
        	int topic_id=Integer.parseInt(request.getParameter("topic_id"));
        %>
    <input type="hidden" value="<%=topic_id%>" id="topic_id">
    <input type="hidden" value="<%=request.getContextPath()%>" id="context_path">
    
      <div><%@include file="../hpanel.jsp" %></div>
      
      <h3 align="center">
          
          <%
                    	org.udhc.gen.HealthRecord hr=org.udhc.gen.HealthRecord.getHealthRecordByID(topic_id);
                                String topic=hr.getTopic();
                    %>
          
          Solution for health case : <%= topic  %>
          
      </h3>
    
   <body>  <br><br>
       <div align='center'>
                    <button  onclick="show_solution_list('<%=request.getContextPath()%>/SOLUTION/viewSolution.jsp?topic_id=<%=topic_id%>')">SHOW SOLUTION</button>
                    <button  onclick="show_solution_box('<%=request.getContextPath()%>/SOLUTION/submitSolution.jsp')">ADD SOLUTION</button>
                    <button  onclick="showPosts(<%= topic_id %>)">VIEW MEDICAL HEALTH RECORD</button>
                    
        </div>
       
                    
       <div id="sendSolutionStatus" align="center">  
       </div>
                    
                    
       <div id="solution_box" align="center">  
           
         
           
       </div>
                    
                                         <div id="posts" onload="showPosts(<%= topic_id %>)"></div>

      <script>
       
       window.onload=function(){
           
           show_solution_list('<%=request.getContextPath()%>/SOLUTION/viewSolution.jsp?topic_id=<%=topic_id%>');
           
       }
          
       </script>
                                             
                                             
                    
                    
                        
                        
    </body>
</html>
