<%@page import="org.udhc.models.Solution"%>
<%@page import="org.udhc.models.HealthRecord"%>
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

table{
	margin-left: 1px;
	
	margin-bottom: 2px;
	padding-left: 2px;
	font-size: 100%;
	
}

div#table_container{

	
	max-height: 500px;
	padding: 1%;
	
	background-color:#F1F1F1;
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
	background-color: #73A000;
}

.patient_name a{
	text-decoration:none;
	/*
	font-size: 80%;
	*/
}


a.patient_profile:visited{
	color:white;
}


.topic_name{
    white-space: nowrap;	
	background-color: #DFDFDF ; 
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
	color: white;
	background-color:#3369E7;
}

.solution_box a:hover{
	text-decoration: none;
	padding: 10px;
	color: white;
	background-color:blue;
	
}

td.date{

	padding: 10px;

}
.solution_box{
     background-color:#3369E7;
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
		$("a.patient_profile").colorbox({iframe:true, innerWidth:1300, innerHeight:900});

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

<br>

<div id="table_container">

<table>

<%

	
	ArrayList<HealthRecord> ahr = HealthRecord.getAllSolvedHealthRecords();
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
  <td class="topic_name" width="500px">
  
  		<a href="<%=request.getContextPath()%>/INPUT/displayIssueGraphically.jsp?topic_id=<%=record.getTopic_id()%>"> <%= topic%> 
  		</a>
  		</td>
  		
  
 <%	
		SolutionDAO dao = new SolutionDAO();
		ArrayList<Solution> solutions = dao.getSolutionsByTopicId(Integer.parseInt(topic_id));
		for( Solution s : solutions){		
			String date = s.getSolution_date().split("[,]+")[1].trim();
		
%>
  		<td class="solution_box"> 
  		<a class="solution_link" href="<%=request.getContextPath()%>/SOLUTION/viewSolution.jsp?solution_id=<%=s.getSolution_id()%>&topic_id=<%=record.getTopic_id()%>"> 
  		
  		<%= s.getSolution_language().substring(0,3) %>(<Strong> <%=date %></Strong> )	 </a>
  		</td>
  		
  		
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
</html>