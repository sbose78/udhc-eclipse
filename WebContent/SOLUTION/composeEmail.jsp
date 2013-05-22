<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


                <script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
 <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
        


<! CLEDITOR >

<style>



</style>

 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/cleditor/jquery.cleditor.css" /> 
 <script type="text/javascript" src="<%=request.getContextPath()%>/cleditor/jquery.cleditor.js"></script>

  <script type="text/javascript">                                         


					$(document).ready(function() 
					{
							$("#email_text").cleditor({
	
								width:870,
								height:400
	
							});
					});

			


			 </script>           

<style type="text/css">

input.email{

	width: 700px;

}
input.email:focus{

	border: solid 5px #EC9505;
	width: 700px;
	height:20px;
	border-radius: 5px;

}		

input.submit_button{

	background-color: #0C4B80;
	padding: 7px;
	border-radius: 5px;
	color: white;
	

}

</style>

<title>Email</title>
</head>
<body>


<%
	String topic_id=request.getParameter("topic_id");

%>

<form id="email" action="<%=request.getContextPath()%>/SendMail">
	
	To: &nbsp;  <input class="email" type="text" name="sendee_to" value="<%=request.getParameter("social_worker_id")%>"><br>
	
	( Currently, this supports only 1 email recipient - it will support multiple emails in a few days ).
	<br><br>
	<!--  
	CC: &nbsp;  <input class="email" type="hidden" name="sendee_cc" value="<%=request.getParameter("social_worker_id")%>"><br>
	BCC: &nbsp;  <input class="email" type="hidden" name="sendee_bcc" value="<%=request.getParameter("social_worker_id")%>"><br>
	-->
	
	 
	Subject: &nbsp; <input class="email"  type="text" name="subject">
	<br><br>
	
	
	
	<a href="<%=request.getContextPath()%>/INPUT/displayIssueGraphically.jsp?topic_id=<%=topic_id%>">
Health issue page
	</a>
	

	
		<br><br>
	
	
	
	<textarea id="email_text" name="email_text" rows="200" cols="70">
	
	
	
	
	</textarea>
	
	<input class="submit_button" type="submit" " value="send mail to notify patient">
	
	
	
	



</form>

</body>
</html>