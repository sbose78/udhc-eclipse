<%-- 
    Document   : chain
    Created on : 15 Jun, 2012, 1:53:40 AM
    Author     : root
--%>


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

<script type="text/javascript" src="script.js"></script>

<%@ page import="org.udhc.gen.*" %> 
<%@ page import="java.util.*" %> 



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <div><%@include file="../hpanel.jsp" %></div>

    
    <div id="chain_buttonpanel" onmouseover="open_()" align="center" >DISPLAY HEALTH RECORDS' LIST</div>
    <div id="chain_dropdown" align="center"> 
        <div align="left"> <button onclick="close_()">   CLOSE  </button></div>
        
        
                  
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
          
            <div class="process_problem_list" onclick="showIssue(<%= topic_id %>)"> <%=problem_id%> : <%= problem_title %> </div>
            
    <%  
         }
    %>
            
          
           
      
        
    </div>
    <div id="chain_input" onmouseover="focus_input()"></div>
    <div id="chain_process"  onmouseover="focus_process()"></div>
    <div id="chain_solution" onmouseover="focus_solution()" ></div>
    
    
    
</html>
