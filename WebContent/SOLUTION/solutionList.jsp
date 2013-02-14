<%@page import="org.udhc.gen.HealthRecord"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

     <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>

        	 <link rel="stylesheet" href="<%=request.getContextPath()%>/jqwidgets/styles/jqx.base.css" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
    
    <script src="<%=request.getContextPath()%>/INPUT/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/INPUT/colorbox/colorbox.css" />

<title>Solutions</title>

<style type="text/css">

table{
	margin-left: 5%;
	margin-right:5%;
	margin-bottom: 2px;
	padding-left: 150px;
	font-size: 120%;
}

.patient_name{
	color:white;
	padding:10px;
	
	border-radius: 6px;
	margin-right: 10px;
	background-color: #73A000;
}

.topic_name{
	background-color: #DFDFDF ; 
	padding:10px;
	margin-left: 20px;
}

.topic_name a{
	text-decoration: none;
}
.solution_box a{
	text-decoration: none;
	padding: 10px;
	color: white;
	background-color:#3369E7;
}

.solution_box a:hover{
	text-decoration: none;
	padding: 10px;
	color: white;
	background-color:blue;
}


#info{
	font-size: 120%;
	padding: 1%;
	background: #F1F1F1;		
}

</style>

<script type="text/javascript">

	$(document).ready(call_on_ready);
	
	function call_on_ready(){
		$("a.solution_link").colorbox({iframe:true, innerWidth:1000, innerHeight:900});
		
	}		


</script>


</head>

         <%@include file="../LANDING/hpanel.jsp" %>

<br><br><br><br><br><br>
<body>



<div id="info" align="center">

<img width="50px"  height="50px" src="<%=request.getContextPath()%>/STATICS/images/solved.jpeg"/>
&nbsp;&nbsp;

	The following health issues have been solved by our team

</div>

<br><br><br>

<table>

<%

	ArrayList<HealthRecord> ahr = HealthRecord.getAllSolvedHealthRecords();
	for ( HealthRecord record : ahr)
	{
		
	
%>

  <tr >
  		<td class="patient_name"><%= record.getProblem_id() %></td>
  		<td class="topic_name"><a href="<%=request.getContextPath()%>/INPUT/displayIssueGraphically.jsp?topic_id=<%=record.getTopic_id()%>"> <%= record.getTopic() %> </a></td>
  		<td class="solution_box"> <a class="solution_link" href="<%=request.getContextPath()%>/SOLUTION/viewSolution.jsp?topic_id=<%=record.getTopic_id()%>"> Solution</a> </td>
  		<td class="topic_name"> <%=record.getSolution_date() %> </td>
  		
  </tr>
  
  <%
	}
  %>
	</table>
</body>
</html>