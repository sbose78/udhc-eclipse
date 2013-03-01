<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
<script src="<%=request.getContextPath()%>/LANDING/jquery.bxslider/jquery.bxslider.min.js"></script>
<link href="<%=request.getContextPath()%>/LANDING/jquery.bxslider/jquery.bxslider.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/INPUT/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/INPUT/colorbox/colorbox.css" />


<title> Welcome to the User-driven health network </title>

<style>

.large_size{
	font-size: 175%;
}


.info{
	position: relative;
	top:-110px;
}


.buttons_link{

		margin:auto;
    border-radius:18px;
	background-color: #0B75B2;
	padding: 11px;
	color:white;
	text-decoration: none;
	cursor: pointer;
	font-size: 100%;
	font-weight: bold;

}



#bxslider_container{
	margin:auto;
	right:0;
	left:0;
	width:80%;
}

.description_heading{

	font-size : 140%;

}


.header_link{
	
	text-decoration: none;
	color: blue;
		
}


body{
	
		background: rgb(246,248,249); /* Old browsers */
		background: -moz-linear-gradient(top, rgba(246,248,249,1) 0%, rgba(229,235,238,1) 50%, rgba(215,222,227,1) 51%, rgba(245,247,249,1) 100%); /* FF3.6+ */
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(246,248,249,1)), color-stop(50%,rgba(229,235,238,1)), color-stop(51%,rgba(215,222,227,1)), color-stop(100%,rgba(245,247,249,1))); /* Chrome,Safari4+ */
		background: -webkit-linear-gradient(top, rgba(246,248,249,1) 0%,rgba(229,235,238,1) 50%,rgba(215,222,227,1) 51%,rgba(245,247,249,1) 100%); /* Chrome10+,Safari5.1+ */
		background: -o-linear-gradient(top, rgba(246,248,249,1) 0%,rgba(229,235,238,1) 50%,rgba(215,222,227,1) 51%,rgba(245,247,249,1) 100%); /* Opera 11.10+ */
		background: -ms-linear-gradient(top, rgba(246,248,249,1) 0%,rgba(229,235,238,1) 50%,rgba(215,222,227,1) 51%,rgba(245,247,249,1) 100%); /* IE10+ */
		background: linear-gradient(to bottom, rgba(246,248,249,1) 0%,rgba(229,235,238,1) 50%,rgba(215,222,227,1) 51%,rgba(245,247,249,1) 100%); /* W3C */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f6f8f9', endColorstr='#f5f7f9',GradientType=0 ); /* IE6-9 */

}


#phr_button{
	padding: 10px;
	color: white;
	background-color: #0B75B2;
	font-size: 110%;
	text-decoration: none;
	border-radius: 8px;
	
}

</style>



<script>
	$(document).ready(call_on_ready);
	
	function call_on_ready(){
		
	//	$("a#phr_button").colorbox({iframe:true, innerWidth:1200, innerHeight:800});

		
		  $('.bxslider').bxSlider({
			 
			  
			  auto: true,
			  autoControls: true,
			  speed: 5000,
			  autoHover: true,
			  
			  
			
		  });
	}
	

</script>


</head>
         <%@include file="/LANDING/hpanel.jsp" %>



<body>
<br><br>
<br><br>


<div id="bxslider_container">

<ul class="bxslider">
   
  
 <li>  

	<div id="care_giver_slide">
	
		<table>
			<td align="center" valign="middle"  width="36%"> 
			
				Are you a <br><br><br>
				<div class="large_size">Patient </div> or 
				<div class="large_size">a social worker ?</div>
			
			
			
			
			</td></div>
			<td width="64%" >
			
				<div>
					<ul>
						<li>
							<div class="description_heading">
								Share your 
								<a class="header_link" href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2528047/figure/fig1/">de-identified</a> 
								
								
								data with your 'informed consent' 							
							</div>   <hr></hr>
							Our doctors will help solve your health issue with your consent.
							<br><br>
   			               Please download the letter of  CONSENT in any of the 3 languages below:
   			               
   			               <br><br> 
                        
                        
                       <a class="buttons_link" href="<%=request.getContextPath()%>/STATICS/docs/udhc-hindi.pdf">Hindi</a> &nbsp;
                       <a class="buttons_link" href="<%=request.getContextPath()%>/STATICS/docs/udhc-bengali.pdf">Bengali</a>&nbsp;
                       <a class="buttons_link" href="<%=request.getContextPath()%>/STATICS/docs/udhc-english.pdf">English</a>&nbsp;
							<br><br>	<br>	
						</li>
						<li>
							<div class="description_heading">
								
								Add your health narrative and reports for review 
																
							</div>		<hr></hr>
							Write a narrative of your problem and upload your scanned health reports.
							<br><br>	<br><br>
							
					&nbsp;&nbsp;&nbsp;		 <a class="buttons_link" href="<%=request.getContextPath()%>/INPUT/care-seeker-input.jsp">ADD YOUR HEALTH ISSUE </a>
							<br><br><br>
												
						</li>
						<li>
						
						<div class="description_heading">
								
								Patient health records 
																
						</div>		<hr></hr>
						<br>
						 &nbsp;<br><br> 
						<a id="phr_button"  href="<%=request.getContextPath()%>/SOLUTION/phrquery.jsp">
						
						Open Patient Health Record 
						
						</a>
						
						
					
						
						</li>
						 
						
					</ul>
				
				
				</div>
			
			</td>
		</table>	
	</div>



 </li>
  <li>  
<div id="care_giver_slide">
<table>
			<td align="center" valign="top"  width="36%"> 
			
				Are you a  <br><br><br>
				<div class="large_size">Care-giver </div>
				<br>  a<br><br>
				
				<div class="large_size">Doctor ?</div>
				
				<br> or a<br><br>
				
				<div class="large_size">Medical student ?</div>
				
			
			</td>
			<td width="64%">
			
			
			<ul>
				
				<li>
					<div class="description_heading"> 
						Provide your valuable opinion on uploaded health issues. </div>
											   <hr></hr>
						Let us collaborate to disseminate better medical advice
						
						<br><br>	<br>			
													
						
						&nbsp;&nbsp;&nbsp;
						<a class="buttons_link" href='<%=request.getContextPath() %>/INPUT/displayInputs.jsp'>Open Uploaded health issues</a>
						
						<br><br>						<br><br>
												
						
						
						
				
				</li>
				
				
				<li>
					<div class="description_heading">   Translate health issues to English </div>
					   <hr></hr>
					   Please drop an email to <font color="red"> kaustav.bera@udhc.co.in </font> and <br>we shall add you as a <strong> data processor </strong>
					   
					   .<br><br>.<br><br>						<br><br>
					   						
					   
				</li>
				
				
				<li>	
				<div class="description_heading">
						Add a new health Q & A 
				</div>					   <hr></hr>
				Every health issue serves as a resource for the common good.
				
						<br><br>						<br><br>
												
						
						
					&nbsp;&nbsp;&nbsp;
					<a class="buttons_link" href="<%=request.getContextPath()%>/INPUT/care-seeker-input.jsp"> ADD A HEALTH ISSUE</a>
								
						<br><br>	<br><br>
															

													
				</li> 
			
			
			</ul>
				
				
			
			</td>
		</table>	

</div>

</li>

<li>
	<table>
		<tr>
			<td align="center" valign="middle"  width="45%">
				
				This is
				
				<div class="large_size">how it all works </div>
			
			</td>
			
			<td valign="middle"  width="55%">
				 <img height="450px" width="450px" src="<%=request.getContextPath()%>/STATICS/images/how-it-works-info.jpg"/>
			
			
			</td>
		
		
		</tr>
	
	
	</table>


</li>


</ul>

<div class="info">
<strong>( Hover to stop and read )</strong>
</div>

</div>



</body>
</html>