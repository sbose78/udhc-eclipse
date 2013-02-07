<%--
    Document : displayInputs
    Created on : 9 Jun, 2012, 1:43:39 PM
    Author : root
--%>



<!DOCTYPE html>
<html>
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

<link rel="stylesheet" href="<%=request.getContextPath()%>/mystyle.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/script.js"></script>

<%@ page import="org.udhc.gen.*" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <head>
    

    <script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
 <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Health Records Interface</title>
    </head>
    
    <input id="context_path" type="hidden" value="<%=request.getContextPath()%>">
    
    <body>
        
        


        
                <div><%@include file="../hpanel.jsp" %></div>

        
        <div id="displayInputs_add_new" align="center">
        
         <a class="util_links" id="add_new_health_case" href="<%=request.getContextPath()%>/INPUT/care-seeker-input.jsp">ADD A NEW HEALTH CASE ?</a> &nbsp;&nbsp; &nbsp;
        
         <a class="util_links" href="displayMyInputs.jsp"> OPEN MY RECORDS </a>
                
                
                <br>
                <br>
                
         </div>
                
                <div align="center" id="displayInputs_heading"> <b>  Showing All records </b> </div>

      
        
        <div id="displayInputs_narrative_list">
            
            
<style>
  
 


          
          
          
</style>  
            
<%



        ArrayList<HealthRecord> alhr= HealthRecord.getAllHealthRecords();
        
         for (HealthRecord n : alhr)
         {
                      int topic_id=Integer.parseInt(n.getTopic_id());
                      String problem_id =n.getProblem_id();
                      String problem_title=n.getTopic();
                      String problem_topic_id=n.getTopic_id();
                       String con=request.getContextPath();

%>
           
            
            <div class="displayInputs_problems" onclick="showIssue(<%=problem_topic_id%>)">
		<%=problem_id.toLowerCase()%>           
              :<strong><%= problem_title.toUpperCase()%> </strong>
            </div>
        
            <% } %>
            
        </div>
        
        <div id="displayInputs_narrative_details">   
   
            
            
        </div>
        
        
             
             
    </body>
</html>