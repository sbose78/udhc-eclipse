<%-- 
    Document   : viewSolution
    Created on : 17 May, 2012, 12:53:26 AM
    Author     : root
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.udhc.dao.SolutionDAO"%>
<%@page import="org.udhc.models.HealthRecord"%>
<%@page import="org.udhc.models.*"%>

<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<head>
<style type="text/css">

#solution_box{

	margin:7%;
	padding: 20px;
	border: solid 1px black;
	border-radius: 6px;

}

table{
	width:100%;
	margin: auto;
	left:0;right:0;
	
}

header{

	margin-top: 20px;
}

#patient_details{
	background-color: #E3E8EC;
	padding: 10px;
	padding: 5%;
	margin: 10%;
	
}

</style>

</head>


<%
	int topic_id= Integer.parseInt( request.getParameter("topic_id"));
	int solution_id  = Integer.parseInt( request.getParameter("solution_id"));
	HealthRecord record = HealthRecord.showSolution(topic_id);
	Solution solution = SolutionDAO.getSolutionById(solution_id);
	if( record!=null){
		
	
%>

<header>

<table>

		
	<tr>

<td id="logo" align="center" width="25%">
<img width="90px" height="90px" src="<%=request.getContextPath()%>/STATICS/images/MA-logo.jpg"/><br>
<a href="http://www.missionarogya.com">www.missionarogya.org</a>

<br><br>

  <strong> ArogyaUDHC </strong> <br> User-driven Health Care <br>
  <a href="http://care.udhc.co.in">care.udhc.co.in</a>
  
  
  </td>

	
		
		<td align="left" width="50%" >
			<div id="patient_details">
	
		ArogyaUDHC Health Issue ID :  
			
		<Strong>	<%= record.getTopic_id() %>  </Strong>  
			
		<br><br>
		   ( Botanical ) Name of the patient: &nbsp;
		   
		   <strong> <%= record.getProblem_id() %></strong>
		     <br><br> Solution dated : &nbsp;
		  <strong> <%= solution.getSolution_date() %> </strong>
		    
		
			</div>
		</td>

		<td  align="right" width="25%" style="{vertical-align:top; }">
		<p>
		
		<a href="javascript:window.print()"><img src="<%=request.getContextPath()%>/STATICS/images/click-here-to-print.jpg" alt="print this page" id="print-button" /></a>
		
		</p>
		
		</td>
	</tr>

</table>

<br>

<%

	String domain = getServletContext().getInitParameter("domain_url").toString();
	domain = domain.substring(0, domain.length()-1 );
	System.out.println(domain);

%>

<div align="center">

Health issue inputs URL : &nbsp;

<a class="solution_link" href="<%=request.getContextPath()%>/INPUT/displayIssueGraphically.jsp?topic_id=<%=record.getTopic_id()%>&solution_id=<%=solution_id%>">

<%=domain%><%=request.getContextPath()%>/INPUT/displayIssueGraphically.jsp?topic_id=<%=record.getTopic_id()%>


</a>

<br><br>Health Issue solution URL : &nbsp; 


<a class="solution_link" href="<%=request.getContextPath()%>/SOLUTION/viewSolution.jsp?topic_id=<%=record.getTopic_id()%>&solution_id=<%=solution_id%>">
<%=domain%><%=request.getContextPath()%>/SOLUTION/viewSolution.jsp?topic_id=<%=record.getTopic_id()%>&solution_id=<%=solution_id%>
</a> 
	
</div>

</header>






<div id="solution_box" >
    
    <%=solution.getSolution_content()%>    
    
</div>

<%
	}

%>

