


<%-- 
    Document   : problem_list
    Created on : 28 Apr, 2012, 5:47:27 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="org.udhc.gen.*" %> 
<%@ page import="java.util.*" %> 



<html>
    
    <head>
 <script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
 <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
         
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All health cases </title>
        
</head>  
    
          
    <body>      
        
      <div id="content_space">

          <div><%@include file="hpanel.jsp" %></div>
          
          
            
  <script>
  $(document).ready(function() {
//	  alert("hi");
      $(".accordion").accordion();
  }); 
      </script>
      
          
        <h3 align='center'> All Care-Seeker records </h3>
        
        <%
                ArrayList<HealthRecord> alhr= HealthRecord.getAllHealthRecords();        

         %>
        
       
          
        
    </body>
</html>
