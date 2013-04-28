<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

 <head>
 <title>Patient Inputs</title>
 
 		
 		<meta name="author" content="Shoubhik bose">
		
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
 
 		<script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
 		
    <script src="<%=request.getContextPath()%>/INPUT/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/INPUT/colorbox/colorbox.css" />

		
		
 		 <script type="text/javascript">
 		
 		$(document).ready(function(){
 			

 			$("#topic_details").hide();
 			$("div.patient_issue").live('click',function(){
 	 			$("#topic_details").show();

 				var topic_id = $(this).attr("topic_id");
 				fetchTopicDetails(topic_id);
 			});
 			
 			$("div.ExpandCollapse").live("click",function(){
 				//alert($(this).html());
 				var list = $(document).find("ul[patient_name='" +$(this).attr('patient_name')+ "']");
 				if($(this).html()=="+"){
 					
 					$(list).css("display","block");
 					$(this).html("-");
 				}
 				else{
 					$(this).html("+");
 					$(list).css("display","none");
 					
 				}
 				
 			});
 			
 			
 			
 			fetchAllRecords();
 			
 		})
 		
 		function fetchTopicDetails(topic_id){
 			$("#topic_details").html("<img width='100px'  height='100px' src='<%=request.getContextPath()%>/STATICS/images/loading2.gif'/>");
 			var finalUrl='<%=request.getContextPath()%>/INPUT/showIssue.jsp?topic_id='+topic_id;
			//alert( "fetching...");// with "+image_id);
		     var req=$.ajax({
		                   type:"GET",
		                   url:finalUrl,
		                   //contentType: "application/json; charset=utf-8",
		                   
		                   success: function(html){
		                	   //alert("OK");
		                 		$("div#topic_details").html(html);
		             			$(".report_image").colorbox({ photo:'true' , rel:'report_image', innerWidth:800, innerHeight:800});

		                	},
		               complete:function(jqXHR, textStatus) {
		            			// alert("request complete "+textStatus);
		               },
		              error: function(xhr, textStatus, errorThrown){
		                  		//alert('request failed->'+textStatus);
		              }   
		              
		              
		     });  

 			
 		}
 		
 		function fetchAllRecords(){
 			var finalUrl='<%=request.getContextPath()%>/getApprovedRecords';
			//alert( "fetching...");// with "+image_id);
		     var req=$.ajax({
		                   type:"GET",
		                   url:finalUrl,
		                   //contentType: "application/json; charset=utf-8",
		                   dataType:"JSON",
		                   success: function(all_records){
		                 		populateTree(all_records);
		                 //		alert("ok");
		                	},
		               complete:function(jqXHR, textStatus) {
		                 // alert("request complete "+textStatus);
		               },
		              error: function(xhr, textStatus, errorThrown){
		                //  alert('request failed->'+textStatus);
		              }   
		              
		              
		     });  

 		}
 		function populateTree(all_records){
 			var head_ul = $("ul#head_ul");
 			for(var patient in all_records){
 				var li = $(document.createElement('li'));
 				
 				var div_symbol=$(document.createElement('div')); 
 				div_symbol.attr('class','ExpandCollapse');
 				div_symbol.html("+");
 				div_symbol.attr('align','center');

 				div_symbol.attr('patient_name',all_records[patient].patient_name);

 				
 				var div_folder=$(document.createElement('div'));
 				div_folder.attr('class','Folder');
 				var link_to_timeline = "<%=request.getContextPath()%>/PROFILE/PATIENT/profile.jsp?patient_name="+all_records[patient].patient_name;
 				var actual_link="<a href='"+link_to_timeline+"'>"+all_records[patient].patient_name+"</a>"
 				div_folder.html(actual_link);

 				
 				li.append(div_symbol);
 				li.append(div_folder);
 				head_ul.append(li);

 				
 				// now add sub-list
 				
 				var sub_ul =  $(document.createElement('ul'));
 				sub_ul.css({ display: "none" });
 				sub_ul.attr("patient_name",all_records[patient].patient_name);
 				var my_issues = all_records[patient].issues; 
 				
 				for( var issue in my_issues ){
 					var sub_li = $(document.createElement('li'));
 	 				var div_issue=$(document.createElement('div'));
 	 				div_issue.html(my_issues[issue].topic_name);
 	 				div_issue.attr("class","patient_issue");
 	 				div_issue.attr("topic_id",my_issues[issue].topic_id);
 	 				
 	 				sub_li.append(div_issue);
 	 				sub_ul.append(sub_li);	
 				}
 				
 				li.append(sub_ul);

 			}
 		}
 		
 		</script>
 		
		
		<style type="text/css">
		
			div.Folder a {
				text-decoration: none;
				color: white;
			}
		
			.patient_issue{
				padding:5px;
				color:black;
				background-color: #ECE0C5;
				font-size: 100%;
				border: solid 4px white;
				width:450px;
				font-weight: bold;
				cursor: pointer;
			}
		
		
			.Folder {
				
				padding: 5px;
				background-color: #0867A7;
				color: white;
				font-size: 100%;
				border: solid 3px white;
				width: 490px;
				border-radius:6px;
				
			
			}
			.ExpandCollapse {
				float:left;
				margin-right:15px;
				width:20px;  
				font-size: 160%;
				border: solid 2px black;
				background-color: white;
				cursor:pointer;
			/*	padding: 5px;  */ 
			}
			ul#head_ul {
				list-style-type:none;
				
			}
			
			#topic_list{
				height: 650px;
				overflow : scroll;
			
			}
			
			#topic_details{
				border: solid 0.5px #7895D7;
				background-color: #EAEFF1; 
				border-radius: 5px;
				padding: 20px;
				
			}
			
			#main_table{
			
				margin:auto;
				left:30;right:0;
			
			}
			
			a.util_links{
				
				padding:8px;
				text-decoration:none;
				cursor:pointer;
				background-color: #DDE3E7;
				color: black ;
				font-weight:bold;
				border-radius: 3px;
			}
			
			
		</style>
		<script type="text/javascript">

			var GLOBAL_msg = null;
			function showRollover(e, msg) {
				if (!e) { 
					e = window.event;
				}
				if (GLOBAL_msg == null) {
					GLOBAL_msg = msg;
				}
				var clientX = e.clientX + 20;
				var clientY = e.clientY + 10;
				var rollover = document.getElementById('Rollover');
				rollover.innerHTML = GLOBAL_msg;
				rollover.style.marginTop = clientY + "px";
				rollover.style.marginLeft = clientX + "px";
				rollover.style.display = "inline";
				document.onmousemove = showRollover;
			}
			function clearRollover(e) {
				if (!e) { 
					e = window.event;
				}
				var rollover = document.getElementById('Rollover');
				rollover.style.display = "none";
				GLOBAL_msg = null;
				document.onmousemove = null;
			}

			function resolveSrcMouseover(e) {
				var node = e.srcElement == undefined ? e.target : e.srcElement;
				if (node.nodeName != "UL") {
					node.style.fontWeight= "bold";
					showRollover(e, node.innerHTML);
				}
			}
			function resolveSrcMouseout(e) {
				var node = e.srcElement == undefined ? e.target : e.srcElement;
				node.style.fontWeight = "normal";
				clearRollover(e);
			}
			function takeAction(e) {
				var node = e.srcElement == undefined ? e.target : e.srcElement;
				document.getElementById("DisplayInfo").innerHTML = "Clicked " + node.innerHTML;
				var id = node.getAttribute("id"); 
				if (id != null && id.indexOf("Folder") > -1) {
					if (node.innerHTML == "-") {
						node.innerHTML = "+";
						document.getElementById("ExpandCollapse" + id).style.display = "none";
					} else if (node.innerHTML == "+") {
						node.innerHTML = "-";
						document.getElementById("ExpandCollapse" + id).style.display = "block";
					}
				}
			}
		</script>
	</head>
	
	
         <%@include file="../LANDING/hpanel.jsp" %>

<br><br><br><br><br><br>
	
	<body>
	
	<table  id="main_table" width = "100%">
		<tr>
			<td valign="top"  align="left" width="45%">
			
			<div align="center">
			  <a class="util_links" id="add_new_health_case" href="<%=request.getContextPath()%>/INPUT/care-seeker-input.jsp">ADD A NEW HEALTH CASE </a> &nbsp;&nbsp; &nbsp;
        
         <a class="util_links" href="displayMyInputs.jsp"> OPEN MY RECORDS </a>
                
			</div >
			
		
			<div width="100%" id="topic_list">
			<ul id="head_ul"> 
						
		</ul>
			</div>
			</td>
			
			<td width="55%" valign="top" align="left">
				
				<div id="topic_details" width="100%">
				
			
				</div>
					
			
			
			</td>
		
		</tr>
	
	</table>
		

</body></html>