<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.udhc.gen.*"%>
<%@page import="java.util.LinkedHashMap"%>

<%@page import="java.util.Properties"%>
<%@page import="org.udhc.models.Solution"%>
<%@page import="org.udhc.dao.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



 <script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
 <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>


<script src="<%=request.getContextPath()%>/LANDING/jquery.bxslider/jquery.bxslider.min.js"></script>
<link href="<%=request.getContextPath()%>/LANDING/jquery.bxslider/jquery.bxslider.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/INPUT/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/INPUT/colorbox/colorbox.css" />

<title>Update profile - Care-seeker</title>
<style>

td{
	
	padding: 2%;

}

.input_date{
		color:white;
	padding:10px;
	
	border-radius: 6px;
	margin-right: 10px;
	background-color: #73A000;

}

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
		width:80%;
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

	border-color: #0055E0;lem
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
	margin-left: 1px;

	margin-bottom: 2px;
	padding-left: 2px;
	font-size: 100%;
}

.patient_name{
	color:white;
	padding:10px;
	
	border-radius: 6px;
	margin-right: 10px;
	background-color: #73A000;
}

.topic_name{
	background-color: white ; 
	padding:10px;
	margin-left: 20px;
	
}

.topic_name a{
	text-decoration: none;
	background-color: white ;
	color: black; 
	
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




<script>
	$(document).ready(call_on_ready);
	
	function add_new_past_problem_form(){
		
	//	alert("clicked");
		
		var add_new_past_problem_form_html = $("#sample_problem_form").html();
		//alert(add_new_past_problem_form_html);
		
		
		var div_problem =document.createElement("div");
		$(div_problem).html(add_new_past_problem_form_html);
		
		$("#problems").append(div_problem);
		
	}
	
	function add_new_past_surgery_form(){
		
		//	alert("clicked");
			
			var add_new_past_problem_form_html = $("#sample_surgery_form").html();
			//alert(add_new_past_problem_form_html);
			
			
			var div_problem =document.createElement("div");
			$(div_problem).html(add_new_past_problem_form_html);
			
			$("#surgeries").append(div_problem);
			
		}
	
	function call_on_ready(){
		
		$("a.solution_link").colorbox({iframe:true, innerWidth:1000, innerHeight:1000});
		$("input#add_new_problem").click(function(){
			add_new_past_problem_form();
		});
		
		$("input#add_new_surgery").click(add_new_past_surgery_form);
		var date = $('.event_date').datepicker({ dateFormat: 'd M yy' });
		
	
	}
	

</script>


</head>

         <%@include file="../../LANDING/hpanel.jsp" %>
         
         <br><br><br><br><br><br><br>
         
<%

	String patient_name= request.getParameter("patient_name");
%>         

<body>

<a class="anchor" name="profile"></a>

<br><br><br>



<div class="profile_container">

<table>
	<tr> 
		<td width="70%">
		<img height="50px" src="<%=request.getContextPath()%>/STATICS/images/MA-logo.jpg"/> 
							<label>  ArogyaUDHC </label> <br>
							<label class="prof">Care-seeker  &nbsp;
							
							<a href="<%=request.getContextPath()%>/TIMELINE/timeline.jsp?patient_name=<%=patient_name%>">
									<img src="<%=request.getContextPath()%>/STATICS/images/stopwatch.png">
							</a>
							 
							</label>
							
			
		</td>
		
		<td width="30%" align="right">
	<img id="profile_pic" width="80px" height="80px" src=""/><br><br>
		</td>
	
	
	</tr>


</table>
				<hr></hr>
<br><br>

	<table>
		
		<tr>		
			<td> <label>Sex </label> </td>
			<td> TBF </td>
		</tr>
	
		<tr>
			<td><label>Name </label> &nbsp;&nbsp; </td>
			<td><%=request.getParameter("patient_name") %></td>
		</tr>
		<tr>
				
				<td valign="top"><label> History </label> </td>
				<td>
					<input name="history" type="checkbox" value="Anaemia">Anaemia<br>
					<input name="history" type="checkbox" value="Jaundice">Jaundice<br>
					<input name="history" type="checkbox" value="Cyanosis">Cyanosis<br>
					<input name="history" type="checkbox" value="Clubbing">Clubbing<br>
					<input name="history" type="checkbox" value="Edema">Edema<br>
				</td> 
		</tr>			
		<tr>
			<td valign="top"> <label> Major problems </label><br>
				
				<input type="button" id="add_new_problem" value="Add">	
			
			</td>
			<td id="problems">
			
				<div class="problem_form" id="sample_problem_form">
							<label>What was the problem/diagnosis/treatment?</label><br>
							
							<textarea name="description_problem" rows="2" cols="20"></textarea>
							
							<br>
							<label> Age when detected </label><br>
							<input type="text" name="age_problem"/>
							<br>
							
							
							<label> Current Status </label><br>
							<input type="text" name="current_status_problem"/>
						<hr></hr>
				</div>
			
			</td>  
		
		
		</tr>
		
		
		<tr>
			<td valign="top"> <label> Major surgeries </label><br>
				
				<input type="button" id="add_new_surgery" value="Add">	
			
			</td>
			<td id="surgeries">
			
				<div class="surgery_form" id="sample_surgery_form">
							<label> What was the procedure?  Current status? </label><br>
							
							<textarea name="description_surgery" rows="2" cols="20"></textarea>
							
							<br>
							<label> Age when done?  </label><br>
							<input type="text" name="age_surgery"/>
							<br>
							
							
							<label> Current Status </label><br>
							<input type="text" name="current_status_surgery"/>
						<hr></hr>
				</div>
			
			</td>  
		
		
		</tr>
		
		
			<tr>
			<td valign="top"> <label> Dynamic list of family history </label><br>
				
				<input type="button" id="add_new_family_history" value="Add">	
			
			</td>
			<td id="family_histories">
			
				<div class="family_history_form" id="sample_family_history_form">
							<label> What was the procedure?  Current status? </label><br>
							
							<textarea name="description_family_history" rows="2" cols="20"></textarea>
							
							<br>
							<label> Age when diagnosed?  </label><br>
							<input type="text" name="age_family_history"/>
							<br>
							
							
							<br>
							<label> Relationship  </label><br>
							<input type="text" name="age_family_relationship"/>
							<br>
							
							
							
							<label> Current Status </label><br>
							<input type="text" name="current_status_family_history"/>
							
							
													
						<hr></hr>
				</div>
			
			</td>  
		
		
		</tr>
				
				
		<tr>
			<td valign="top"> <label> Medication </label><br>
				
				<input type="button" id="add_new_medication" value="Add">	
				
	
			</td>
			<td id="medications">
			
				<div class="medication_form" id="sample_medication_form">
							<label> What was the procedure?  Current status? </label><br>
							
							<br>
							<label> Medicine name  </label><br>
							<input type="text" name="medicine_name"/>
							<br>
							
							
							
							<br>
							<label> Dosage  </label><br>
							<input type="text" name="dosage"/>
							<br>
							
							
							<br>
							<label> Frequency </label><br>
							<input type="text" name="frequency"/>
							<br>
							
							
							
							<label> Currently taking? </label><br>
							<input type="radio" name="current_medication_status" value="male">Yes<br>
							<input type="radio" name="current_medication_status" value="female">No
							
							<br>
							
							<label> Start date </label><br>
							<input type="text" name="medication_start_date" class="event_date"/>
							
							<br>
							<label> End date </label><br>
							<input type="text" name="medication_end_date" class="event_date"/>
							
							<br>
							
							
							
							
						<hr></hr>
				</div>
			
			</td>  
		
		
		</tr>		
				
				
				
				
				
				
				
				
		
	</table>
			<br><br><br><br>	
<table>				
				
<%

	LinkedHashMap<Integer, Object> my_phr =  PHR.getPHR(patient_name);
	Integer topic_ids[]=new Integer[my_phr.keySet().size()];
			my_phr.keySet().toArray(topic_ids);
	for( Integer topic_id:topic_ids){
		HashMap<String, Object> topic_data= (HashMap<String, Object>)my_phr.get(topic_id);
		String topic=(String)topic_data.get("topic");
		String upload_date = (String)topic_data.get("upload_date");
		
%>		
	<tr>
		<td class="patient_name"><%=upload_date %>
		</td>
		
		<td  class="topic_name">
		
<a href="<%=request.getContextPath()%>/INPUT/displayIssueGraphically.jsp?topic_id=<%=topic_id%>"> <%= topic %> </a>		
		

		</td>
<%
		ArrayList<Solution> solutions = (ArrayList<Solution>)topic_data.get("solutions");
		int arr[]= {0,0,0};
		int i =0;
		for(Solution solution:solutions )
		{	
		
	
%>		
		
		<td class="solution_box">
		
		<a class="solution_link" href="<%=request.getContextPath()%>/SOLUTION/viewSolution.jsp?solution_id=<%=solution.getSolution_id()%>&topic_id=<%=topic_id%>"> 
  		
  		<%= solution.getSolution_language() %></a> 
		

		</td>
		<%}
		%>
			
	</tr>
<%

	}
%>		
	</table>			
</div>

<br>

</body>
</html>