<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>

<title> Welcome to the User-driven health network </title>

<style>



td{
	width:50%;
	vertical-align: top;
	overflow: hidden;
	
}




table{
	width:95%;
	margin: auto;
	left:0;right: 0;
}

body{
	background-color:white;
	margin-top:60px;
	
	width:100%;
}

.issue_brief{

	float:left;
	border: 1px solid black;
	height: 230px;
	margin-bottom: 10px;
	overflow:hidden;
	background: white;
	border-radius:5px;
	width: 100%;

}
.issue_description
{	
	
	height:90%;
	
	padding: 20px;
	overflow: hidden;
	color: black;
	font-size: 100%;
}

.issue_topic_link{
	background-color:#032945;
	opacity: 0.8;
	padding:5px;
		
	z-index:10;
	position:relative;
	top:-110px;
	max-height: 350px;
	overflow: hidden;
	

}

.issue_topic{
	
	font-size:130%;
	text-decoration: none;
	color: white;
	font-weight: bolder;
}


th{
  
  height: 59px;
  background-color: white ;
  color: black; 
  max-width: 30%;
  vertical-align: middle;
  font-size: 110%;

}


.user_type_div{
    border-radius:15px;
	font-size: 110%;
	color: rgb(255, 255, 255);
	background-color: rgb(3, 41, 69);
	padding: 10px;
	font-weight: bold;

}

.user_instruction
{
    border-radius:21px;
        background-color: rgb(214, 219, 222);
	padding: 20px;
	font-size: 100%;
	margin-bottom:20px;
	
	
	
}

.user_instruction a {
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

.user_instruction a:hover{
	background-color: black;
}


.user_type_div a{
	color: white;
}

</style>

<script>
	$(document).ready(call_on_ready);
	
	function fill_featured_articles(recent_articles){
		
 	   $("#left_column").html("");

		for ( var i = 0 ; i < 3; i++){
			
			
			
			var div_issue_brief = document.createElement("div");
			div_issue_brief.setAttribute("class",'issue_brief');
			
			var div_issue_description= document.createElement("div");
			div_issue_description.setAttribute("class","issue_description");
			
			var div_issue_topic_link= document.createElement("div");
			div_issue_topic_link.setAttribute("class","issue_topic_link");
			
			
		//	alert(recent_articles[0].description);
			$(div_issue_description).html(recent_articles[i].description);
			
			var topic_link = '<%=request.getContextPath()%>/INPUT/displayIssueGraphically.jsp?topic_id='+recent_articles[i].id;
			
			
			
			$(div_issue_topic_link).html("<a class='issue_topic' href='"+topic_link+"'> Patient name: "+recent_articles[i].patient_name+"</a> ");
			
			div_issue_brief.appendChild(div_issue_description);
			div_issue_brief.appendChild(div_issue_topic_link);
			
			
			
			$("#left_column").append(div_issue_brief);
			
			
		}
	}
	
	function get_featured_articles()
	{
		var finalUrl='<%=request.getContextPath()%>/GetFeed';
	//	alert( "getting data...");// with "+image_id);
	
		$("#left_column").html("<img src='<%=request.getContextPath()%>/STATICS/images/loading.gif' width='250'/>");
	    
		var req=$.ajax({
	                   type:"GET",
	                   url:finalUrl,
	                   //contentType: "application/json; charset=utf-8",
	                   dataType:"JSON",
	                   success: function(recent_articles){
	                	   //$("#left_column").html("");
	                		fill_featured_articles(recent_articles);
	                 	  
	                },
	               complete:function(jqXHR, textStatus) {
	                 // alert("request complete "+textStatus);
	               },
	              error: function(xhr, textStatus, errorThrown){
	                //  alert('request failed->'+textStatus);
	              }   
	              
	              
	     });  
	}
	
	function fill_recent_articles(recent_articles){
		
		for ( var i = 0 ; i < 3; i++){
			
				
				
				var div_issue_brief = document.createElement("div");
				div_issue_brief.setAttribute("class",'issue_brief');
				
				var div_issue_description= document.createElement("div");
				div_issue_description.setAttribute("class","issue_description");
				
				var div_issue_topic_link= document.createElement("div");
				div_issue_topic_link.setAttribute("class","issue_topic_link");
				
				
			//	alert(recent_articles[0].description);
				$(div_issue_description).html(recent_articles[i].description);
				$(div_issue_topic_link).html("<a class='issue_topic' href='#'> Pain in thennnn worth mentioning that on the way up that slope, Probably worth mention worth mentioning that on the way up that slope, Probably worth mention worth mentioning that on the way up that slope, Probably worth mention worth mentioning that on the way up that slope, Probably worth mention</a> ");
				
				div_issue_brief.appendChild(div_issue_description);
				div_issue_brief.appendChild(div_issue_topic_link);
				
				
				
				$("#middle_column").append(div_issue_brief);
				
				
		}

	}
	
	function get_recent_articles()
	{
	
		var finalUrl='<%=request.getContextPath()%>/GetFeed';
		//alert( "getting data...");// with "+image_id);
	    
		var req=$.ajax({
	                   type:"GET",
	                   url:finalUrl,
	                   //contentType: "application/json; charset=utf-8",
	                   dataType:"JSON",
	                   success: function(recent_articles){
		            	   $("#left_column").html("");

	                		fill_recent_articles(recent_articles);
	                 	  
	                },
	               complete:function(jqXHR, textStatus) {
	                 // alert("request complete "+textStatus);
	               },
	              error: function(xhr, textStatus, errorThrown){
	                //  alert('request failed->'+textStatus);
	              }   
	              
	              
	     });  
	     
		
	}
	
	function get_recent_users(){
	}
	
	function call_on_ready(){
		// get featured articles .
		
		get_featured_articles();
				
		// get recent articles
		
	//	get_recent_articles();
		
		// get recent activity
		
		get_recent_users();
		
	
	}


</script>


</head>
         <%@include file="/LANDING/hpanel.jsp" %>



<body>
<br><br>
<table>

	<th> Featured narratives </th>
	
	

	
	<th> Physicians and users </th>

	<tr>
		<td id="lc"> 
		
		 <div class ="user_type_div"> We shall share your <a href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2528047/figure/fig1/">de-identified</a> data with your 'informed consent'    </div>
   			 
   			 <div class="user_instruction" align="center">
   			               
   			               <br>
   			               DOWNLOAD THE LETTER OF CONSENT HERE 
   			               
   			               <br><br>
                        
                        
                       <a href="<%=request.getContextPath()%>/STATICS/docs/udhc-hindi.pdf">Hindi</a> &nbsp;
                       <a href="<%=request.getContextPath()%>/STATICS/docs/udhc-bengali.pdf">Bengali</a>&nbsp;
                       <a href="<%=request.getContextPath()%>/STATICS/docs/udhc-english.pdf">English</a>&nbsp;
                         
   			               
   			 </div>
		
			<div id="left_column">
			
									
								
						</div>
			</td>
		
		
		
		
		<td id="rc">
			
				<div id="right_column">
				
							<div class="user_type_div"> The workflow of the User-driven healthcare system</div>
						
						<div class="user_instruction" align="center">
						
						<img src="<%=request.getContextPath()%>/STATICS/images/how-it-works-info.jpg" width="500px"/>
						
						</div>
				
							<div class ="user_type_div"> Are you a care-seeker / patient ?     </div>
				                
				                <div class="user_instruction">
				                
						                <p>
						                We would love to help you with our team of physicians, care-givers and volunteers.
						                You can submit your health issue anonymously by carefully removing all your identifiers.
						                Be rest assured, your personal details will <strong>never</strong> be revealed
						                </p>
						                <br>
						                 <a href="<%=request.getContextPath()%>/INPUT/care-seeker-input.jsp">ADD YOUR HEALTH ISSUE </a>
				                
				                </div>
				                
				                <div class ="user_type_div"> Are you a care-giver / physician ?     </div>
				               
				                <div class="user_instruction">
				                
						                
						               <br>
						               	We have care-seekers submitting their health issues. Your opinion is valuable and may provide a crucial breakthrough towards
						               	solving the health issue.
						               	
						               	Here is a list of uploaded health issues which require your opinion: <br><br>
						               	<a href='<%=request.getContextPath() %>/INPUT/displayInputs.jsp'> Uploaded health issues</a>
						               
						               <br>
						                <br>
						                
						                You could also contribute your unsolved as well as solved health issues that
						                 can be further processed by our network and eventually serve as an online source of knowledge	<br><br>	                
						                 <a href="<%=request.getContextPath()%>/INPUT/care-seeker-input.jsp"> ADD A HEALTH ISSUE</a>
				                
				                </div>
				                
				                <div class ="user_type_div"> Are you a social worker ?     </div>
				                	
				                <div class="user_instruction">
				                
						                <p>
						               
						               You could help us by helping care-givers remove patient-identifiers. Also, you could upload health issues 
						               of care-seekers/patients on their behalf.
						               
				                                <br><br>
						                 <a href="<%=request.getContextPath()%>/INPUT/care-seeker-input.jsp">ADD A HEALTH ISSUE</a>  
				                                  
						                </p>
						                
				                
				                </div>				
			</div>
		
		
		</td>	
	</tr>
</table>

</body>
</html>