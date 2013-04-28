<%@page import="org.udhc.gen.models.Solution"%>
<%@page import="org.udhc.gen.HealthRecord"%>
<%@page import="org.udhc.dao.*"%>

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
td{

	border: solid 1px black;
}
table{
	margin-left: 1px;
	
	margin-bottom: 2px;
	padding-left: 2px;
	font-size: 100%;
	
}

div#table_container{

	
	max-height: 500px;
	padding: 1%;
	
	
	color: black;
	background-color:white;
	overflow: scroll;
	overflow: auto;

}

.patient_name{
	cursor:pointer;
	color:white;
	padding:5px;
	border-radius: 6px;
	/*
	margin-right: 10px;
	*/
	
	color: black;
	background-color:white;
}

.patient_name a{
	text-decoration:none;
	/*
	font-size: 80%;
	*/
}


a.patient_profile:visited{
	color:black;
}


.topic_name{
    white-space: nowrap;	
	
	color: black;
	background-color:white;
	padding:10px;
	/*
	margin-left: 20px;
	*/
}

.topic_name a{
	text-decoration: none;
}

.solution_box{
	  white-space: nowrap;
	width: 800px;
}

.solution_box a{
	text-decoration: none;
	padding: 10px;
	color: black;
	background-color:white;
}

.solution_box a:hover{
	text-decoration: none;
	padding: 10px;
	
	color: black;
	background-color:white;
}

td.date{
	  white-space: nowrap;
	padding: 10px;

}
.solution_box{
     
	color: black;
	background-color:white;
}


#info{
	font-size: 120%;
	padding: 1%;
	background: black;
	color: white;
	cursor: pointer;	
}


</style>

<script type="text/javascript">

	$(document).ready(call_on_ready);
	
	function call_on_ready(){
		$("a.solution_link").colorbox({iframe:true, innerWidth:1000, innerHeight:900});
		$("a.patient_profile").colorbox({iframe:true, innerWidth:1300, innerHeight:900});
		$("div#info").click(function(){
			selectText("table_container");
		});

	}	
	
	function selectText(element) {
	    var doc = document
	        , text = doc.getElementById(element)
	        , range, selection
	    ;    
	    if (doc.body.createTextRange) { //ms
	        range = doc.body.createTextRange();
	        range.moveToElementText(text);
	        range.select();
	    } else if (window.getSelection) { //all others
	        selection = window.getSelection();        
	        range = doc.createRange();
	        range.selectNodeContents(text);
	        selection.removeAllRanges();
	        selection.addRange(range);
	    }
	}


</script>


</head>

         <%@include file="../LANDING/hpanel.jsp" %>

<br><br><br><br><br><br>
<body>



<div id="info" align="center">


	Click here to select the full table ( do a Ctrl + C and finally a Ctrl + V to Excel after that)

</div>

<br>
<div id="table_container">
<table>

<%

	
	ArrayList<HealthRecord> ahr = HealthRecord.getAllUploadedHealthRecords();
	for ( HealthRecord record : ahr)
	{
		String topic_id = record.getTopic_id()	;
		String topic = record.getTopic();
		if(topic.length()>=65){
			topic = topic.substring(0, 64)+"...";
		}
		
%>		
<tr >
  		<td class="patient_name">
  		
  		<a class="patient_profile" href="<%=request.getContextPath()%>/PROFILE/PATIENT/profile.jsp?patient_name=<%= record.getProblem_id()%>">
  		<%= record.getProblem_id() %>
  		</a>
  		
  		
  		
  		
  		</td>
  <td class="topic_name" >
  		<a href="<%=request.getContextPath()%>/INPUT/displayIssueGraphically.jsp?topic_id=<%=record.getTopic_id()%>"> <%= topic %> 
  		</a>
  		</td>
  		<td>
  			<%= record.getDate() %>
  		</td>
  		
  
 <%	
		SolutionDAO dao = new SolutionDAO();
		ArrayList<Solution> solutions = dao.getSolutionsByTopicId(Integer.parseInt(topic_id));
		for( Solution s : solutions){		
			String date = s.getSolution_date().split("[,]+")[1].trim();
		
%>
  		<td class="solution_box"> 
  		<a class="solution_link" href="<%=request.getContextPath()%>/SOLUTION/viewSolution.jsp?solution_id=<%=s.getSolution_id()%>&topic_id=<%=record.getTopic_id()%>"> 
  		
  		<%= s.getSolution_language().substring(0,3) %></a>
  		</td>
  		
  		<td class="date" width="100px"><%= date %></td>
  		
  		
<%
		}
%>  		
  		
  		
  		
  </tr>
  
  <%
	}
  %>
	</table>
	</div>
</body>
