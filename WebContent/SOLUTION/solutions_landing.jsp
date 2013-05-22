<%@page import="org.udhc.dao.SolutionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.udhc.models.Solution"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<style>

.add{

	padding: 14px;
	background-color: green;
	color: white;
	border-radius:7px;
	text-decoration: none;

}

.edit{
	padding: 10px;
	background-color: blue;
	color: white;
	
	border-radius:7px;
	text-decoration: none;

}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Let's do something with the output</title>
</head>
<body>

<%
	String topic_id = request.getParameter("topic_id");
%>
<p align="center">

<a class="add" href="<%=request.getContextPath()%>/SOLUTION/submitSolutionLocal.jsp?topic_id=<%=topic_id%>">ADD  OUTPUT</a>

<br><br>
<br><br>
<br><br>
<br><br>


  
  <br><br><br><br>

<%
	ArrayList<Solution> solutions = (new SolutionDAO()).getSolutionsByTopicId(Integer.parseInt(topic_id));
	for ( Solution s : solutions){
		
	 	int solution_id = s.getSolution_id();

%>

<a class="edit" href="<%=request.getContextPath()%>/SOLUTION/edit_solution.jsp?solution_id=<%=solution_id%>"><%=s.getSolution_language()%></a>


<%
	}
%>	



</body>
</html>