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
  <script type="text/javascript" src="<%=request.getContextPath()%>/jqwidgets/jqxcore.js"></script>
    
    <script type="text/javascript" src="<%=request.getContextPath()%>/jqwidgets/jqxtabs.js"></script>
    
    <script src="<%=request.getContextPath()%>/INPUT/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/INPUT/colorbox/colorbox.css" />

<title>My control room</title>

<style type="text/css">

tr:hover{

	background-color: #DBE7F1;	
}


td{

	padding:7px;
	border-radius:3px;
	
	/*
	border-bottom: solid 2px black;
	*/
}

th{
	position:static;
	padding:8px;
	background-color: #0C4B80;
	color:white;
}

table{
	width: 90%;
	margin: auto;
	right:0 ; left :0;
	font-weight: 120%; 
}

.approved_css{

	border-radius:9px;
	margin:auto;left:0;right:0;
	cursor: pointer;
	padding: 7px;
	background-color:green;
	color: white;
	margin: 6px;
}

.not_approved_css{

	border-radius:9px;
	margin:auto;left:0;right:0;
	cursor: pointer;
	padding: 7px;
	background-color: red;
	color: white;
	margin: 6px;

}

.user_not_approved_button{

		border-radius:9px;
	margin:auto;left:0;right:0;
	cursor: pointer;
	padding: 7px;
	background-color:red;
	color: white;
	margin: 6px;

}

.user_approved_button{

		border-radius:9px;
	margin:auto;left:0;right:0;
	cursor: pointer;
	padding: 7px;
	background-color: green;
	color: white;
	margin: 6px;

}

#jqxtabs{

	margin: auto;left:0;right:0;
	width: 100%;
	font-weight: 100%;
	
	
}

#jqxtabs ul li{
		font-weight: 130%;	
	
}


.solution_box{
	
		border-radius: 5px;
		border: solid 2px black;
		padding: 8px;
		text-decoration: none;
		

}


</style>

<script type="text/javascript">

	$(document).ready(call_on_ready);
	
	function updateApprovalChangeOnPage(html,email,current_privilege,button){
		
		$(button).attr("approved", html[0].approved);
		$(button).attr("role",html[0].final_privilege );
		
	//	alert( $(button).attr("role") );
		if(html[0].approved == 1){
			$(button).attr("class","user_approved_button");
			$(button).attr("value","APPROVED");
			
		}
		
		else{
			$(button).attr("class","user_not_approved_button");
			$(button).attr("value","NOT APPROVED");

		}
	}
	
	function makeApprovalChange(email,current_privilege,button){
		var email1= encodeURIComponent(email);
		var finalUrl='<%=request.getContextPath()%>/UpdateUserPrivilegeAprroval?email='+email1+'&current_privilege='+current_privilege;
   		 var req=$.ajax({
                  type:"GET",
                  url:finalUrl,
                  //contentType: "application/json; charset=utf-8",
                  dataType:"JSON",
                  success: function(html){
                	 // alert(html[0].about);
                	 // $("#load_wait").hide();
                //	 alert(html);
                	 updateApprovalChangeOnPage(html,email,current_privilege,button)
                	                             
               },
              complete:function(jqXHR, textStatus) {
                // alert("request complete "+textStatus);
           	 //  $("#load_wait").hide();
              },
             error: function(xhr, textStatus, errorThrown){
               //  alert('request failed->'+textStatus);
           	//  $("#load_wait").hide();
             }   
		
			});
	}
	
	
	function call_on_ready(){
		
		$("a.solution_box").colorbox({iframe:true, innerWidth:900, innerHeight:700});
			
		$('#jqxtabs').jqxTabs({ position: 'top', width: '99%' , height: "auto", reorder: true });
			if(  $("input#user_approval_button").size() > 0 )
			{
				$("input#user_approval_button").click(function(){
					var approval_status= $(this).attr("class");
					var email=$(this).attr("email");
					var role = $(this).attr("role");
					//var approved =  $(this).attr("approved"); 
					$(this).attr("value"," WORKING....");
					
					// send request to server

					makeApprovalChange(email,role,this);
				
				});
				
				
			}
		
		
			if ( $("input#approval_button").size() > 0 ){
				
				$("input#approval_button").click(function(){
					
					var approval_status= $(this).attr("class");
					var topic_id=$(this).attr("topic_id");
					$(this).attr("value"," WORKING....");
				//	alert(approval_status);
					
					var approve_to="";
					var updatedApprovalStatus="";
					var updatedApprovalClass="";
					if( approval_status == "approved_css" )
					{
						approve_to="not_approve";
						updatedApprovalStatus=" NOT APPROVED";
						updatedApprovalClass="not_approved_css";
	
					}
					else{
						approve_to="approve";
						updatedApprovalStatus="APPROVED";
						updatedApprovalClass="approved_css";
	
					}
					
					var response= updateApprovalStatus(topic_id,approve_to,this,updatedApprovalStatus,updatedApprovalClass);
				//	alert(response[0]);
					if( response[0].status == 1)
					{
						$(this).attr("value",updatedApprovalStatus);
						$(this).attr("class",updatedApprovalClass);
						
					}
					
				});
				
				
			}
			
			
			
		}
		
		function updateApprovalButton(response,button,updatedApprovalStatus,updatedApprovalClass)
		{
		//	alert(response[0].status);
			if( response[0].status == 1)
			{
				$(button).attr("value",updatedApprovalStatus);
				$(button).attr("class",updatedApprovalClass);
				
			}
			
			
		}
		
		function updateApprovalStatus(topic_id, approve_to,button,updatedApprovalStatus,updatedApprovalClass)
		{
	
			var finalUrl='<%=request.getContextPath()%>/changeHealthIssueApprovalStatus?topic_id='+topic_id+'&approve_to='+approve_to;
	    	 var req=$.ajax({
	                   type:"GET",
	                   url:finalUrl,
	                   //contentType: "application/json; charset=utf-8",
	                   dataType:"JSON",
	                   success: function(html){
	                 	 // alert(html[0].about);
	                 	 // $("#load_wait").hide();
	                 //	 alert(html);
	                 	 updateApprovalButton(html,button,updatedApprovalStatus,updatedApprovalClass)
	                 	                             
	                },
	               complete:function(jqXHR, textStatus) {
	                 // alert("request complete "+textStatus);
	            	 //  $("#load_wait").hide();
	               },
	              error: function(xhr, textStatus, errorThrown){
	                //  alert('request failed->'+textStatus);
	            	//  $("#load_wait").hide();
	              }   
	              
	              
	    	 });  


	}
	


</script>


</head>

         <%@include file="../LANDING/hpanel.jsp" %>

<br><br><br><br><br><br>
<body >

<%

	if( User.isModerator(User.getLoggedInUserEmail(request))){
		
		
%>


<div id="jqxtabs" align="center">
	 <ul>
               
                <li style="margin-left: 37%;">HEALTH ISSUE APPROVAL </li>
                <li> USER APPROVAL </li>
     </ul>
     
     <div>
     
     	<h3 align="center">	Health issues </h2>
     
   

<table>

<th width="20%"> SOLUTION  </th>

<th width="15%">PATIENT</th><th width="25%">HEALTH ISSUE</th><th width="10%">APPROVAL STATUS</th><th width="15%">UPLOADED BY </th> <th width="20"%>Date</th>


<%
	ArrayList<HealthRecord> all_records = HealthRecord.getAllUploadedHealthRecords();
	for( HealthRecord record:all_records)
	{
		String topic_id=record.getTopic_id();

%>

<tr>
	
	<td valign="middle">
	
		&nbsp
		<%
		
			String solved_image= request.getContextPath()+"/STATICS/images/solved.jpeg";
			if( record.getSolved() == 0){
				solved_image= request.getContextPath()+"/STATICS/images/unsolved.jpeg";				
			}
			
		%> 
		<img src="<%=solved_image %>" alt="image" width="50px" height="50px"/>

<%
String loggedInUser = User.getLoggedInUserEmail(request);

	if(loggedInUser.equals("sbose78@gmail.com") || equals("bera.kaustav@gmail.com") || loggedInUser.equals("rakesh7biswas@gmail.com")){
		
	
%>		
		
		&nbsp 		
		<a class="solution_box" href="<%=request.getContextPath()%>/SOLUTION/submitSolution.jsp?topic_id=<%=record.getTopic_id()%>">Update</a> 
		&nbsp
		<a class="solution_box"  href="<%=request.getContextPath()%>/SOLUTION/composeEmail.jsp?topic_id=<%=record.getTopic_id()%>&social_worker_id=<%=record.getSocialWorker_id()%>">EMAIL</a>
		
<%
	}
%>
	
	</td>

	<td>
		
	
		<%=record.getProblem_id() %>
	</td>
	
	<td>
		<a href="<%=request.getContextPath()%>/UPLOADER/care-seeker-input-edit.jsp?topic_id=<%=topic_id%>">
			<img width="29px" src="<%=request.getContextPath() %>/STATICS/images/edit_icon.jpeg"/>
		</a>
		
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=request.getContextPath()%>/INPUT/displayIssueGraphically.jsp?topic_id=<%=topic_id%>"><%=record.getTopic() %></a>
		
		<br>
	
		
		
	</td>
	
	<td align="center">
		 
		 <%
		 	int approved = record.getApproved();
		 	String button_value = approved == 1 ? "APPROVED" : " NOT APPROVED ";
		 	String button_class = approved == 1 ? "approved_css" : "not_approved_css";
		 	
		 %>
		 
		 <input class="<%=button_class%>" id="approval_button" type="button" value="<%=button_value%>" topic_id=<%=record.getTopic_id() %>> 
	</td>
	
	<td>
		<%=record.getSocialWorker_id() %>
	</td>
	
	<td>
		<%=record.getDate() %>
	</td>
	
</tr>

<%
	}
%>



</table>

</div>

<div>
	<h3 align="center">	Care-seekers, care-givers and social workers </h2>


<div align="center">

<%
	ArrayList<User> all_users= User.getAllUsers();
	
	
%>

	
		
		<br><br>
		
		<table>
			<th > Email </th>  <th>Name</th> <th>Role</th>  <th>Approval status</th>
<%
	for( User user : all_users){
%>			
			<tr>
			
			
			<td> <%= user.getEmail() %></td>
			<td><%= user.getName() %></td>
			<td><%= User.getUserPrivilegeName(user.getRole())%></td>
			<td>
			
					<%
						String button_class = "user_approved_button";
						String button_value= " APPROVED"; 
						if( user.getApproved()==0){
							button_class= "user_not_approved_button";
							button_value="NOT APPROVED";
						}
					
					%>
					
					<input email="<%=user.getEmail()%>" role="<%=user.getRole() %>" approved="<%=user.getApproved() %>" type="button" class="<%=button_class%>" id="user_approval_button" value="<%=button_value%>">
			
			</td>
	   </tr>
			
<%
	}
%>			
		
		
		</table> 
		
	</div>
</div>

</div>




<%
	}
%>

<div align="center"><br><br><br><br>
	THE DASHBOARD IS CURRENTLY AVAILABLE ONLY FOR MODERATORS.<br>
	
</div>

</body>
</html>