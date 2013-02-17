<%@page import="org.udhc.gen.*"%>
<%@page import="org.udhc.gen.models.*"%>
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
	padding: 10px;
	font-size: 130%;
}

.form_container{
	width:50%;
	margin: auto; right:0;left:0;
	border: solid 2px #7895D7;
	padding: 50px;
	border-radius: 9px;
	background-color: #EAEFF1;	
	
}

.profile_container{
		width:50%;
	margin: auto; right:0;left:0;
	border: solid 2px #7895D7;
	padding: 40px;
	border-radius: 9px;
	background-color: #EAEFF1;	
	


}

label{
	font-size: 110;
	padding: 15px;
}

input#update_profile{
	
	background-color: #0055DE;
	color: white;
	padding: 5px;
	border-radius: 6px;

}

a.anchor{
	background-color: yellow;
	margin-top: 100px;
	margin-bottom: 100px;
	
	margin-left: 50%;
}

a.anchor_heading{
	background: white;
	border: solid 3px #0C76B7;
	color: black;
	padding: 10px;
	border-radius: 5px;
	text-decoration: none;
	margin-left: 40%;
}

a.anchor_heading:hover{
	background: #EAEFF1;
	border: solid 3px #0C76B7;
	color: black;
	padding: 10px;
	border-radius: 5px;
	text-decoration: none;
}

input{

	height: 35px;
	font-size: 120%;
	border-color: #0055E0;
	background-color: #E5E5E5;
	padding-left:5px;padding-right:5px;
	border-radius: 5px;
}

input:focus{

	border-color: #0055E0;
	background-color: white;

}

label{
	
	color: #0054DB;
	font-weight: bold;
	padding:10px;

}

img#profile_pic{
		
}

label.prof{

	font-size: 170%;
	color: #0153DB;
}


table{
	width:100%;
}
</style>


</head>

         <%@include file="../../LANDING/hpanel.jsp" %>
         
         <br><br><br><br><br><br><br>

<body>


<%

	String doctor_email= "";
	String req= request.getParameter("doctor_email");
	boolean ownProfile= false;
	boolean show = false;
	String loggedInUserEmail= User.getLoggedInUserEmail(request);
	DoctorDAO dao = new DoctorDAO();
	Doctor doctor = new Doctor();	
	
	// The profile of some other person is being viewed - no query parameters attached.
	
	if ( req == null ){
		if( !loggedInUserEmail.equals("GUEST") && (User.getLoggedInUserRole(request).equals("2") || User.getLoggedInUserRole(request).equals("-2")))
		{
			show=true;
			ownProfile = true;
			doctor_email = loggedInUserEmail;
			
		}
	}
	
	else {
		if( Math.abs(User.getLoggedInUserRole(req))==2){
			show= true;
			doctor_email = req;
			
			if( loggedInUserEmail.equals(req)){
				ownProfile=true;
			}
		}
		else{
			System.out.println("You are asking for a patient's profile.");
		}
	}
	
	if( show &&  User.checkUserPresence(doctor_email)){
		doctor = dao.getDoctorByEmail(doctor_email)	;
		if( doctor == null){
			doctor = new Doctor("Please Fill this ", doctor_email, "Please Fill this", "Please Fill this");
			System.out.println(dao.insert(doctor));
		}
		
	}
	
	if( show){
			
	
	/*
	
	if( ( doctor_email==null && !loggedInUserEmail.equals("GUEST"))|| (doctor_email!=null && loggedInUserEmail.equals(doctor_email))){
		ownProfile = true;	
		doctor_email= loggedInUserEmail;		
	}
		
	if ( !doctor_email.equals("GUEST") && User.getLoggedInUserRole(request).equals("2") ){
		System.out.println("IDentified as doctor");			
		dao = new DoctorDAO();
		doctor= dao.getDoctorByEmail(doctor_email);
		
			// doctor is seeing this page for the first time - profile is empty

			// the user needs to signed up before signed up & and the user has to be a doctor
			
			if( doctor == null 	&&  User.checkUserPresence(doctor_email)){
					doctor = new Doctor("Please Fill this ", doctor_email, "Please Fill this", "Please Fill this");
					System.out.println(dao.insert(doctor));
					
			}			
			
			else{ // nothiing to be done , just show him his data.
				System.out.println("not null :(");
				
			}
		
	*/
%>
<a class="anchor" name="profile"></a>

<br><br><br><br><br>



<div class="profile_container">

<%
	
	if( ownProfile && show){

%>
<a class="anchor_heading" href="#update">Update profile</a> <br><br>
<%

	}
%>

<table>
	<tr>
		<td width="70%">
		<img height="50px" src="<%=request.getContextPath()%>/STATICS/images/MA-logo.jpg"/> 
							<label>  ArogyaUDHC </label> <br>
							<label class="prof">Care-giver</label>
							
			
		</td>
		
		<td width="30%" align="right">
	<img id="profile_pic" width="80px" height="80px" src="<%=dao.getGravatarLink(doctor_email)%>"/><br><br>
		</td>
	
	
	</tr>


</table>
				<hr></hr>
<br><br>
				<label>Name </label> &nbsp;&nbsp;  <%=doctor.getDoctor_name() %> <br> <br>
				<label>Email </label> &nbsp;&nbsp; <%=doctor_email %><br> <br>
				<label>About</label> &nbsp;<br><br>
				
					 <%=doctor.getDoctor_about() %>
				
</div>

<br><br><br><br>

<a class="anchor" name="update"></a>

<br><br><br><br><br><br><br><br><br>

<%

	}
	if( ownProfile && show){

%>

<div class="form_container" >

<p>
<a class="anchor_heading" href="#profile">Back to My Profile</a>

	
</p>
<br><br>
	<form action="<%=request.getContextPath()%>/CatchProfileData" method="get">

				<label>Email </label> &nbsp; <input name="doctor_email" type="text" value="<%=doctor_email %>">  <br><br> 
				<label>Name </label> &nbsp;  <input name="doctor_name" type="text" value="<%=doctor.getDoctor_name() %>"> <br><br> 
				
				 
			
				<label>About me </label> <br> <br>
				
				<textarea rows="20" cols="70" name="doctor_about">
				
					 <%=doctor.getDoctor_about() %>
				
				</textarea>  <br><br>
				
				<input type="submit" id="update_profile" value=" SAVE UPDATES"> 
		
	</form>
	

</div>



<%
			}

	


%>
</body>
</html>