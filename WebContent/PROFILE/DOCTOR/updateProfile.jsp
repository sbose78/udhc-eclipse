<%@page import="org.udhc.gen.*"%>
<%@page import="org.udhc.models.*"%>
<%@page import="org.udhc.dao.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<title>Update profile - doctor</title>
<style>
textarea{
	position: relative;
	
}

.form_container{
	width:50%;
	margin: auto; right:0;left:0;
	border: solid 2px #7895D7;
	padding: 50px;
	border-radius: 9px;
	background-color: #EAEFF1;	
	
}

label{
	font-size: 110;
	
}

input#update_profile{
	
	background-color: #0055DE;
	color: white;
	padding: 5px;
	border-radius: 6px;

}


</style>


</head>

         <%@include file="../../LANDING/hpanel.jsp" %>
         
         <br><br><br><br><br><br><br>

<body>


<%
	String loggedInUserEmail= User.getLoggedInUserEmail(request);
	String doctor_email= loggedInUserEmail;
	
	
	DoctorDAO dao = new DoctorDAO();
	Doctor doctor= dao.getDoctorByEmail(doctor_email);

	
	if( doctor == null){
		
		// doctor is seeing this page for the first time . maybe
		
		if( User.checkUserPresence(doctor_email) && User.getLoggedInUserRole(doctor_email)==2){
			doctor = new Doctor("Fill this", doctor_email, "Fill this", "Fill this");
			System.out.println(dao.insert(doctor));
			
		}
		
	}
	else{
		System.out.println("not null :(");
	}
	

%>


<div class="form_container" >

	<form action="">

				<label>Email </label> &nbsp; <input name="doctor_email" type="text" value="<%=doctor_email %>">  <br><br>
				<label>Name </label> &nbsp;  <input name="doctor_name" type="text" value="<%=doctor.getDoctor_name() %>"> <br><br>
				
				 
				<label>Display picture URL </label> &nbsp; <input name="doctor_dp" type="text" value="<%=doctor.getDoctor_dp()%>"> <br><br>
				
				<label>About me </label> <br>  <textarea rows="30" cols="80" name="doctor_about">
				
					 <%=doctor.getDoctor_about() %>
				
				</textarea>  <br><br>
				
				<input type="button" id="update_profile" value=" SAVE UPDATES"> 
		
	</form>
	

</div>


</body>
</html>