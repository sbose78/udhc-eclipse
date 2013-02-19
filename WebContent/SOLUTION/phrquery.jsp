<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

#phr_button{
	padding: 10px;
	color: white;
	background-color: #0B75B2;
	font-size: 110%;

}

#phr_textbox{
	
	font-size: 120%;
	height:28px;
	width:300px;
}


#phr_textbox:focus{

}

#content{
	
	background-color:#E9EEF1;
	border-width:2px;
	border-color:#0B75B2;
	border-style:solid;
	
	border-radius:8px;
	width:30%;
	padding:15px;
	margin: auto;
	left:0;right:0;
	position: relative;
	top:100px;
}

</style>


</head>
<body>

<div align="center" id="content">

	<form _name" method="get" action="<%=request.getContextPath()%>/PROFILE/PATIENT/profile.jsp">
							<input type="text" id="phr_textbox" name="patient_name">&nbsp;<br><br>
							<input type="submit" id="phr_button" value="OPEN PATIENT HEALTH RECORD">
						</form>
<br><br>
	ENTER THE BOTANICAL NAME

</div>


</body>
</html>