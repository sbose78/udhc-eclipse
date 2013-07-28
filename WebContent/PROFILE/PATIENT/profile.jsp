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

        
<%

	String patient_name= request.getParameter("patient_name");
%>   

<title>Profile - Care-seeker - <%=patient_name %> </title>
<style>

tr:hover{
	
	background-color: white;
	border-radius: 10px;

}
tr{
	padding-bottom:50px;
}

td{
	
	padding-top: 2%;
	width: 700px;  

}

td.left_column{
	
	width : 350px;
	
}

.input_date{
		color:white;
	padding:10px;
	
	border-radius: 6px;
	margin-right: 10px;
	background-color: #73A000;

}

p.summary_param{

	padding: 10px;

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


	font-size: 100%;
	border-color: #0055E0;
	background-color: #E5E5E5;
	/*
	padding-left:5px;padding-right:5px;
	*/
	
	padding: 5px;
	border-radius: 3px;
}

input.add_new{

	padding : 3px;
	height: 40px;

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
	margin-left: 1px;

	margin-bottom: 2px;
	padding-left: 2px;
	font-size: 100%;
}

.patient_name{
	color:white;
	padding:10px;
	width: 200px;
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

.summary_unit{
	font-size:120%;
	padding: 2%;
	border-radius: 3px;
	margin: 10px;
}

form.summary_form input{

	margin: 20px;
	height: 30px;

}

form.summary_form textarea{

	margin: 20px;
	height: 200px;
	width: 500px;

}


#load_wait
{
	position: fixed;
	margin: auto;
	top:0;bottom: 0; left: 0;right: 0;
	width:50%;
	height: 70%;
	background-color: black;
	color: white;
	opacity: 0.8;
	z-index: 666;	
	padding: 20%;
}

input.submit_button{

	padding: 5px;
	border-radius: 5px;
	font-size: 90%;
	background-color: #0278E7;
	color:white;
}


input.reset_button{

	padding: px;
	border-radius: 5px;
	font-size: 90%;
	background-color: #FE0000;
	color:white;
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
	
	function getPatientHistory()
	{
		$("div.history_list").each(function(){
		//	alert($(this).attr("info_type"));
			
			var info_type=$(this).attr("info_type");
			var patient_name=$(this).attr("patient_name");
			
			var current_div = $(this);
			$.ajax({
				
			      type: "GET",
			      url: "<%=request.getContextPath()%>/UpdatePatientSummary?patient_name="+patient_name+"&info_type="+info_type,
			      
			      success: function( response ) {
			    	 var count = 0 ;
			    	 
			    	 for(var history_item in response )
			    	 {
			    		//	 alert("--- here for ---"+info_type);
			    			//alert("history item "+ count++);
						 	add_content_to_section(current_div, response[history_item] );	
			    	 }
			      }
		   });
			
		});
		
		/*
		var history_list= $("div.history_list");
		for( history in history_list)
		{
			var history_item = history_list[history];
			alert($(history_item).attr("info_type"));
		}
		*/
		
	}
	
	
	function call_on_ready(){
		
		// get all patient history previously entered.
		
		$('form[class="summary_form"]').hide();
		$('input[type="submit"]').attr("class","submit_button").attr("value","SUBMIT");
		$('input[type="reset"]').attr("class","reset_button");

		
		getPatientHistory();
		
		$("a.solution_link").colorbox({iframe:true, innerWidth:1000, innerHeight:1000});
		
		$("input.add_new").click(function(){
			var info_type=$(this).attr("info_type");
			$("form[info_type=\'"+info_type+"\']").show();

		});
		
		$("form.summary_form").submit(function(event){
						
			event.preventDefault();
			$("#load_wait").show();
			$(this).hide();
		//	alert( $(this).serialize() );

			var content_section = $(this).parent();
			
		
			  $.ajax({
					      type: "POST",
					      url: $(this).attr( 'action' ),
					      data:  $(this).serialize(),
					      success: function( response ) {
					    	  $(this).find("input:reset").click();					          
					    	  add_content_to_section(content_section,response);
					      } ,
			  			complete:function(jqXHR, textStatus) {
	                 // alert("request complete "+textStatus);
	            	   $("#load_wait").hide();
	               },
	              error: function(xhr, textStatus, errorThrown){
	                //  alert('request failed->'+textStatus);
	            	  $("#load_wait").hide();
	              }   
	              
			  
			   });
		});

		var date = $('.event_date').datepicker({ dateFormat: 'd M yy' });	
		$("#load_wait").hide();
	}
	
	function add_content_to_section(content_section, response){
		
	//	alert("adding content to section ... "+$(content_section).attr("id"));
	//	alert(JSON.stringify(response));
		var count = 0;
		for ( content in response )
		{
			
		//	alert(count++);	
			var status = response[content].status;
			//alert(status);
			var summary_content = response[content].summary_content;
			var willBreakOut = false;
			
			if ( status == null ){
				//alert("it was null :( ) for "+ $(content_section).attr("id"));
				summary_content=response;
				willBreakOut=true;
			}
			
			var div = document.createElement("div");
			$(div).attr("class","summary_unit");
			var hr = document.createElement('hr');
			
			$.each( summary_content , function(key, value){
				
				
				//	 alert(key +"-"+ value);
					  
			         if( key!="patient_name" && key!="info_type" && key!="_id")
					 {
								var label = document.createElement('label');
								var p = document.createElement("p");
								$(p).attr("class","summary_param");
				
								var field_name = toProperCase(key);
								var field_value = value;
								
															
								$(label).text( field_name);
								$(p).text(field_value);
								
								$(div).append(label);
								$(div).append(p);	
						}
			   
						
			});
			
			$(div).append(hr);
			$(content_section).append(div);		
			if( willBreakOut )break;
		}
		
	}
	
	function toProperCase(anyString)
	{
		var words= anyString.split("_");
		
		var string = words[0];
		words[0]= string.charAt(0).toUpperCase() + string.slice(1);						
			
		return words.join(" ");
	}
</script>


</head>

         <%@include file="../../LANDING/hpanel.jsp" %>
         
         <br><br><br><br><br><br><br>
       

<body>

<a class="anchor" name="profile"></a>

<br><br><br>


<div id="load_wait">

<img src="<%=request.getContextPath()%>/STATICS/images/loading.gif"/>

</div>    


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

	<table id="patient_history">
		
		<tr>		
			<td class="left_column"> <label>Sex </label> </td>
			<td> TBF </td>
		</tr>
	
		<tr>
			<td  class="left_column"><label>Name </label> &nbsp;&nbsp; </td>
			<td><%=request.getParameter("patient_name") %></td>
		</tr>
		<tr>
				
				<td  class="left_column" valign="top"><label> History </label> 
						
						<input class="add_new" type="button" info_type="illness_history" id="add_new_problem" value="Add">
					
				</td>
				
				<td>
				
				   <div class="history_list" id="illness_history_div" info_type="illness_history" patient_name="<%=patient_name%>">
				
						<form class="summary_form" info_type="illness_history" action="<%=request.getContextPath()%>/UpdatePatientSummary">
						
								<input type="hidden" name="patient_name" value="<%=patient_name%>"/>
								<input type="hidden" name="info_type" value="illness_history">
							
							
								<input name="checkbox_history_Anaemia" type="checkbox" value="Anaemia">Anaemia &nbsp;
								<input name="checkbox_history_Jaundice" type="checkbox" value="Jaundice">Jaundice &nbsp;
							<br>	<input name="checkbox_history_Cyanosis" type="checkbox" value="Cyanosis">Cyanosis &nbsp;
								<input name="checkbox_history_Clubbing" type="checkbox" value="Clubbing">Clubbing &nbsp; 
								<input name="checkbox_history_Edema" type="checkbox" value="Edema">Edema &nbsp;
								
								<br>
							<input type= "submit" class="submit_form" /> <input type="reset"/>
						</form>
					</div>
				</td> 
		</tr>	
		
			<tr>
				
				<td  class="left_column" valign="top"><label> Addiction History </label>
				
								<input class="add_new" type="button"  info_type="addiction" id="add_new_problem" value="Add">		
				
				 </td>				
				<td>
				
				   <div class="history_list" id="addiction_div" info_type="addiction" patient_name="<%=patient_name%>">
				
						<form class="summary_form" info_type="addiction" action="<%=request.getContextPath()%>/UpdatePatientSummary">
								<input type="hidden" name="patient_name" value="<%=patient_name%>"/>
								<input type="hidden" name="info_type" value="addiction">
							
								<label>Type of addiction</label> &nbsp;
								
								<br><br>
								
								<input name="checkbox_type_Caffeine" type="checkbox" value="Caffeine">Caffeine &nbsp;
								<input name="checkbox_type_Absinthe" type="checkbox" value="Absinthe">Absinthe &nbsp;
								<input name="checkbox_type_Substance" type="checkbox" value="Substance">Substance &nbsp;
								
							<br><br>
								
								<label>Years of usage</label>
								
								<br><br>
								
								<input name="checkbox_usage" type="radio" value="past">past &nbsp;
								<input name="checkbox_usage" type="radio" value="present">present&nbsp;
								<input name="checkbox_usage" type="radio" value="NEVER">NEVER &nbsp;
								
								
								<br><br>
								
								<label>Type of addiction</label> &nbsp;
								<input name="checkbox_SpecificType_beedi" type="checkbox" value="beedi">beedi &nbsp;
								<input name="checkbox_SpecificType_cigarette" type="checkbox" value="cigarette">cigarette &nbsp;
								<br><input name="checkbox_SpecificType_paan" type="checkbox" value="paan">paan &nbsp;
							    <input name="checkbox_SpecificType_paan_masala" type="checkbox" value="paan_masala">paan_masala &nbsp;
								<input name="checkbox_SpecificType_zarda" type="checkbox" value="zarda">zarda &nbsp;
								<br><input name="checkbox_SpecificType_khaini" type="checkbox" value="khaini">khaini &nbsp;
								<input name="checkbox_SpecificType_other_tobacco" type="checkbox" value="Other tobacco">other tobacco &nbsp;
								<input name="checkbox_SpecificType_snuff" type="checkbox" value="snuff">snuff &nbsp;
								<br><input name="checkbox_SpecificType_modern_alcohol" type="checkbox" value="modern alcohol"> modern alcohol&nbsp;
								
								<br><br>
												
								<label>Counselling</label> 
								<input type="radio" value="yes" name="counselling"/> YES								
								<input type="radio" value="no" name="counselling"/> NO
								
								
								<br><br>
								
								<label>Any other addiction?</label>
								<input name="other_addiction" type="text"/> <br>
								
							
								<br>
																				
							<input type= "submit" class="submit_form" /> <input type="reset"/>
						</form>
					</div>
				</td> 
		</tr>			
		
		
		<tr>
				
				<td  class="left_column" valign="top"><label>Comorbidity</label> 
				
					<input class="add_new" type="button" info_type="Comorbidity" id="add_new_problem" value="Add">
				
				</td>
				
				
				<td>
				
				   <div class="history_list" id="Comorbidity_div" info_type="Comorbidity" patient_name="<%=patient_name%>">
				
						<form class="summary_form" info_type="Comorbidity" action="<%=request.getContextPath()%>/UpdatePatientSummary">
								<input type="hidden" name="patient_name" value="<%=patient_name%>"/>
								<input type="hidden" name="info_type" value="Comorbidity">
							
							
								<label>Comorbidity</label><br>
								<br>
								<input name="checkbox_Comorbidity_Diabetes_Mellitus" type="checkbox" value="Diabetes Mellitus">Diabetes Mellitus&nbsp;
								<input name="checkbox_Comorbidity_Severity_of_Hypertension" type="checkbox" value="Severity of Hypertension">Severity of Hypertension &nbsp;
								<br><input name="checkbox_Comorbidity_Severity_High_blood_pressure" type="checkbox" value="Severity High blood pressure">Severity High blood pressure &nbsp;
								<input name="checkbox_Comorbidity_Ischemic_Heart_Disease" type="checkbox" value="Ischemic_Heart_Disease">Ischemic Heart Disease &nbsp;
							<br>	<input name="checkbox_Comorbidity_HEART_DISEASE" type="checkbox" value="HEART_DISEASE">HEART DISEASE &nbsp;
								<input name="checkbox_Comorbidity_tb_disease_status" type="checkbox" value="tb_disease_status">tb disease status &nbsp;
								
								<br>								
								
							<input type= "submit" class="submit_form" /> <input type="reset"/>
						</form>
					</div>
				</td> 
		</tr>			
		
				
		<tr>
			<td class="left_column" valign="top"> <label> Major problems </label>
				
				<input class="add_new" type="button" info_type="major_problems" id="add_new_problem" value="Add">	
			
			</td>
			<td id="problems">
			
				<div class="history_list" id="major_problems_div" info_type="major_problems" patient_name="<%=patient_name%>">
				<form class="summary_form" info_type="major_problems" action="<%=request.getContextPath()%>/UpdatePatientSummary">
				
							<input type="hidden" name="patient_name" value="<%=patient_name%>"/>
							<input type="hidden" name="info_type" value="major_problems">
							
							<label>What was the problem/diagnosis/treatment?</label><br>
							
							<textarea name="description" rows="2" cols="20"></textarea>
							
							<br> 
							<label> Age when detected </label><br>
							<input type="text" name="age"/>
							<br>
							
							
							<label> Current Status </label><br>
							<input type="text" name="current_status"/>
							
						<br>
						<input type= "submit" class="submit_form" /> <input type="reset"/>
							
							</form>
						
				</div>
			
			</td>  
		
		
		</tr>
		
		
		<tr>
			<td  class="left_column" valign="top"> <label> Major surgeries </label>
				
				<input class="add_new" type="button" id="add_new_surgery" info_type="surgeries" value="Add">	
			
			</td>
			<td id="surgeries">
			
				<div class="history_list" id="surgeries_div" info_type="surgeries" patient_name="<%=patient_name%>">
					<form class="summary_form" info_type="surgeries" action="<%=request.getContextPath()%>/UpdatePatientSummary">
							<input type="hidden" name="info_type" value="surgeries">
							<input type="hidden" name="patient_name" value="<%=patient_name%>"/>
							<label> What was the procedure?  Current status? </label> <br>
							
							<textarea name="description" rows="2" cols="20"></textarea>
							
							<br>
							<label> Age when done?  </label> 
							<input type="text" name="age"/>
							<br>
							
							
							<label> Current Status </label> 
							<input type="text" name="current_status"/>
							
							<br>
							<input type= "submit" class="submit_form" /> <input type="reset"/>
					</form>
						
				</div>
			
			</td>  
		
		
		</tr>
		
		
			<tr>
			<td  class="left_column" valign="top"> <label> Family history </label>
				
				<input class="add_new" type="button" info_type="family_histories" id="add_new_family_history" value="Add">	
			
			</td>
			<td  id="family_histories_div" >
			
				<div class="history_list" id="family_histories_div" info_type="family_histories" patient_name="<%=patient_name%>">
					<form class="summary_form" info_type="family_histories"  action="<%=request.getContextPath()%>/UpdatePatientSummary">
							<input type="hidden" name="patient_name" value="<%=patient_name%>"/>
							<input type="hidden" name="info_type" value="family_histories">
							<label> What was the illness ? </label><br>
							
							<textarea name="description" rows="2" cols="20"></textarea>
							
							<br>
							<label> Age when diagnosed?  </label><br>
							<input type="text" name="age"/>
							<br>
							
							
							<br>
							<label> Relationship  </label><br>
							<input type="text" name="relationship"/>
							<br>
							
							
							
							<label> Current Status </label><br>
							<input type="text" name="current_status"/>
							<br>
							<input type= "submit" class="submit_form" /> <input type="reset"/>
						</form>
						
				</div>
			
			</td>  
		
		
		</tr>
				
				
		<tr>
			<td  class="left_column"  valign="top"> <label> Medication </label>
				
				<input class="add_new" type="button" info_type="medication" id="add_new_medication" value="Add">	
				
	
			</td>
			<td  class="left_column" info_type="medication" id="medications">
			
				<div class="history_list" id="medication_div" info_type="medication" patient_name="<%=patient_name%>">
					<form class="summary_form" info_type="medication" action="<%=request.getContextPath()%>/UpdatePatientSummary">
							<input type="hidden" name="patient_name" value="<%=patient_name%>"/>
							<input type="hidden" name="info_type" value="medication">
							
							
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
							<input type= "submit" class="submit_form" /> <input type="reset"/>
							
					</form>
						
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