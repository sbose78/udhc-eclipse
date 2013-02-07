<%-- 
    Document   : process
    Created on : 13 Jun, 2012, 10:36:40 PM
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



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/mystyle.css" type="text/css" />
<script type="text/javascript" src="script.js"></script>

<%@ page import="org.udhc.gen.*" %> 
<%@ page import="java.util.*" %> 

<!DOCTYPE html>
<html>
    <head>
    
    <script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
 <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PROCESS</title>
    </head>

            <div><%@include file="../hpanel.jsp" %></div>

    <%

    /*
      2 = doctor
      This page will be visible only to doctors and moderators.
      */
    
if(   User.getLoggedInUserRole(request).equals("2") || User.isModerator(User.getLoggedInUserEmail(request)) )
{
	


%>

    <div id="process_button_panel" align="center" onmouseover="open_()" > DISPLAY HEALTH RECORDS' LIST        
    </div>
    <div id="process_dropdown" align="center">
        
        <div align="center">
            <button onclick="close_()">CLOSE</button>
        </div>
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
            
    <div id="process_input"></div>
    <div id="process_process"></div>

      <%
}
    
else{
      %>
      
      <div align="center">
      
      <p>
       YOU ARE NOT AUTHORISED TO VIEW THIS PAGE
      
      </p>
      
      <img src="<%=request.getContextPath()%>/STATICS/images/blocked.jpeg" alt="YOU ARE NOT AUTHORISED TO VIEW THIS PAGE"/>
      
      </div>
      
<%

}
%>      
      
      
      
    
</html>
