<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Timeline - <%=request.getParameter("patient_name")%></title>


	<meta charset='utf-8'/>
        <script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
 		<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
 		<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
 

		 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/cleditor/jquery.cleditor.css" /> 
		 <script type="text/javascript" src="<%=request.getContextPath()%>/cleditor/jquery.cleditor.js"></script>
		 
		 <script>
		 

			$(document).ready(function() {
		  // Handler for .ready() called.
		  
		  		//var date = $('#event_date').datepicker({ dateFormat: 'd M yy' }).val();
		  		var date = $('#event_date').datepicker({ dateFormat: 'd M yy' }).datepicker('setDate',new Date()).val();
// $('#fromdate').datepicker().datepicker('setDate',new Date());val();
		  
		  		$("div#progress_bar").hide();
		  		$("div#status_message").hide();
		  		
		  		var patient_name = "<%=request.getParameter("patient_name")%>";
		  		getAllTimelinePosts(patient_name);
		  
		  		$("div#timeline_post_form").hide();
		  		$("button#share").click(function(){
			  		$("div#status_message").hide();
		  			$("div#timeline_post_form").show();					  			
		  		});
		  
		  		$("#editor").cleditor({			
						width:800,
						height:150			
				});
		  		$("#timelineForm").submit(function(event) {
			  			/* stop form from submitting normally */
			  			event.preventDefault();
			  			$("div#progress_bar").show();
			  			$("div#status").hide();
		  				$("div#timeline_post_form").hide();		

			  			/* get some values from elements on the page: */
			  			var $form = $( this ),
			  			event_data = $form.find( 'textarea[id="editor"]' ).val(),
			  			patient= $form.find( 'input[name="patient_name"]' ).val(),
			  			e_date= $form.find( 'input[name="event_date"]' ).val()
			  			url = $form.attr( 'action' );
			  			
			  			
			  			/* Send the data using post */
			  			var posting = $.post( url, { event_data : event_data , patient_name :  patient , event_date : e_date} );
			  			/* Put the results in a div */
			  			posting.done(function( data ) {
			  				//addTimelinePost(data[0]);
			  				$("div#progress_bar").hide();
			  				$("div#status_message").show();
			  				$("div#timeline_post_form").hide();
			  				
			  				getAllTimelinePosts(patient_name);
			  				
			  				
			  				
			  				//alert("done");
		  				});
		  		});
		  
			});
			
			function getAllTimelinePosts(patient){
				$("div#post_list").empty();
				$("div#progress_bar").show();
				
				var url = "<%=request.getContextPath()%>/GetTimelinePosts";
				var posting = $.post( url, { patient_name :  patient} );
	  			/* Put the results in a div */
	  			posting.done(function( data ) {
	  				
	  				for( var i = 0 ; i < data.length ; i++ ){
	  					addTimelinePost(data[i]);	
	  				}
	  				$("div#progress_bar").hide();
	  				$("div#timeline_post_form").hide();
	  				
	  				//alert("done");
  				});
			}
			
			function addTimelinePost(data){
				
				var post=document.createElement('div');
				$(post).attr("class","post");
				
				var calendar = document.createElement('div');
				$(calendar).attr("class","calendar");
							
				var table = "<table>";
				
				var image_link= "<%=request.getContextPath()%>/STATICS/images/calendar.png";
				table=table+"<tr><td> <img src='"+ image_link +"'></td><td>"+data.date+"</td></tr>";
				table=table+"</table>";
				
				$(calendar).html(table);
				$(post).append(calendar);
				
				var hr = "<hr></hr>";
				$(post).append(hr);
				
				$(post).append(data['event_story']);
				
				
				$("div#post_list").append(post);
				
				//$("div#status_message").show();
				
			}
			
			
		 
		 </script>

<style>

.post{
	
	border-radius:5px;
	border: solid 1px #CCD7EA;
	margin-left:20%;
	margin-right:20%;
	padding: 2%;
	margin-top: 30px;
	background-color: #EAEFF1;

}  

div#patient_name{
	margin-left:20%;

}

div#patient_name a{
	background-color: #73A000;
	padding: 5px;
	color: white;
	text-decoration: none;
	border-radius: 2px;
	font-size: 120%;
}

div#timeline_post_form{
	margin-left: 20%;
	margin-right: 20%;
	margin-bottom: 10px;
	padding: 20px;
	border: solid 1px #CCD7EA;
	background-color: #EAEFF1;
	
}

input#submit_timeline_post{
	background-color: #FF0000 ;
	padding: 10px;
	border-radius: 4px;
	color: white;
	
}

button#share{
	background-color: black;
	color: white;
	padding: 10px;
	cursor: pointer;
}

div#progress_bar{
	margin-left: 20%;
}
div#status_message{
	margin-left: 20%;
	padding: 10px;
	border-radius:4px;
	color: black;
	font-size: 120%;
	
	margin-bottom:20px;
	
	
}
</style>


</head>
    <%@include file="../LANDING/hpanel.jsp" %>

<br><br><br><br><br><br>
<body>

<button id="share">Add a new timeline post ?</button>

<div id="progress_bar">
		<img src="<%=request.getContextPath()%>/STATICS/images/progress.gif">&nbsp;

</div>

<div id="status_message" width="10%">
		
				
</div>

<div id="timeline_post_form">

Add a new update to the patient timeline

<br><br>
   <form id="timelineForm" action="<%=request.getContextPath()%>/CatchTimelinePost" method="post">		
   		
   			<input type="hidden" name="patient_name" value="<%=request.getParameter("patient_name") %>"> 
   			Date ( change if required ) : <input id="event_date" type="text" name="event_date" readonly>
   			<textarea id="editor" name="problem_details" rows="10" cols="55" >		                        
		   </textarea> <input id="submit_timeline_post" type="submit" value = "SUBMIT">
   </form>

</div>



<div id="patient_name">

	<a href="<%=request.getContextPath()%>/PROFILE/PATIENT/profile.jsp?patient_name=<%=request.getParameter("patient_name") %>">
		
		<%=request.getParameter("patient_name") %>
		
	</a>

</div>
	<div id="post_list">
				<div class="post">
					<div class="calendar">
									<table>
										<td>		
											<img src="<%=request.getContextPath()%>/STATICS/images/calendar.png">&nbsp;
										</td>
										<td>
											April 19. '13
										</td>	
									</table>
							
					</div>
					
					
				
					<hr></hr>
					
					<br>
					
					I want to use up/down icons like the ones used by "mail" in the 
					upper-right corner when you're viewing a specific message. Are these icons available for free anywhere?
				
				Beyond that, are there any sites with free navigation bar, toolbar, or tab bar icons?
				
				Thank you!
					
					
				</div>
	</div>		
				
</body>
</html>