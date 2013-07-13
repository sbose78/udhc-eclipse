

<%@page import="org.udhc.models.*"%>
<%@page import="java.util.*"%>

<html>
<head>
<meta charset='utf-8' />


<script type="text/javascript"
	src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>

<script
	src="<%=request.getContextPath()%>/INPUT/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/INPUT/colorbox/colorbox.css" />
<%
	int health_record_id=Integer.parseInt(request.getParameter("topic_id"));                
HealthRecord issue= HealthRecord.getHealthRecordByID(health_record_id);
String loggedInUser= User.getLoggedInUserEmail(request);

String issue_details = issue.getProblem_details();
issue_details= issue_details.replace("\n", "").replace("'", " ");
System.out.println( issue_details);

/*
		Only moderator , uploader can view the issue if the issue is not approved yet 
		So if approved, one can view without a login also.

*/

if( issue.getApproved()==1 || (issue.getApproved()==0 && (User.isModerator(User.getLoggedInUserEmail(request)) || issue.getSocialWorker_id().equals(loggedInUser)))) 
{

%>




<title><%=issue.getTopic()%></title>
<style type="text/css">
/* jQuery lightBox plugin - Gallery style */
#gallery {
	margin: auto;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	padding: 5px;
	z-index: 1;
	width: 40%;
	height: 300px;
	overflow: auto;
}

#gallery ul {
	list-style: none;
}

#gallery ul li {
	display: inline;
}

#gallery ul img {
	border: 5px solid #3e3e3e;
	border-width: 5px 5px 20px;
}

#gallery ul a:hover img {
	border: 5px solid #fff;
	border-width: 5px 5px 20px;
	color: #fff;
	width: auto;
	height: 650px;
	border-style: solid;
	border-color: black;
	margin: auto;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	position: absolute;
	z-index: 900;
}


#comments_guidelines {
	background-color: #FAFAFA;
	color: #021C33;
	font-size: 100%;
	padding: 1%;
	margin-left: 10%;
	margin-right: 10%;
	border-color: #021C33;
	border: medium;
	border-width: 1px;
	border-style: solid;
	font-weight: 2px;
}

.comments_guidelines a {
	color: #3482C2;
}

#b {
	background-color: #4084F2;
	color: white;
	font-size: 120%;
	padding: 12px;
	
}


.discussion_div {
	margin-right: 10%;
	margin-left: 10%;
}

#issue_metadata {
    border-radius:10px;
	background-color: #FAFAFA;
	color: #021C33;
	font-size: 110%;
	padding: 1%;
	margin-left: 10%;
	margin-right: 10%;
	border-color: #021C33;
	border: medium;
	border-width: 1px;
	border-style: solid;
	font-weight: 2px;
}



#edit_link
{
	text-decoration: none;
	padding: 10px;
	font-size: 120%;
	background-color: #032844;
	color: white;
	
}

div#topic_div{
	background-color:white;
	color: #032844;
	padding: 12px;
	font-size: 120%;
    border-radius: 15px;
}

div#similar_issues_div{

	padding: 10px;


}

div#similar_issues_list{
	
	
	font-size: 110%;
}
div.similar_issues_entry{

	margin: 20px;
	
}

a.similar_issues_link{
	
	
}

</style>



<link rel="stylesheet" href="<%=request.getContextPath()%>/mystyle.css"
	type="text/css" />
<%@page import="org.udhc.models.HealthRecord"%>
<%@page import="java.util.ArrayList"%>



<script src="http://yui.yahooapis.com/3.5.0/build/yui/yui-min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://yui.yahooapis.com/2.9.0/build/menu/assets/skins/sam/menu.css" />
<link rel="stylesheet" type="text/css"
	href="http://yui.yahooapis.com/2.9.0/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css"
	href="http://yui.yahooapis.com/2.9.0/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css"
	href="http://yui.yahooapis.com/2.9.0/build/container/assets/skins/sam/container.css" />
<link rel="stylesheet" type="text/css"
	href="http://yui.yahooapis.com/2.9.0/build/editor/assets/skins/sam/editor.css" />
<script type="text/javascript"
	src="http://yui.yahooapis.com/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript"
	src="http://yui.yahooapis.com/2.9.0/build/element/element-min.js"></script>
<script type="text/javascript"
	src="http://yui.yahooapis.com/2.9.0/build/container/container-min.js"></script>
<script type="text/javascript"
	src="http://yui.yahooapis.com/2.9.0/build/menu/menu-min.js"></script>
<script type="text/javascript"
	src="http://yui.yahooapis.com/2.9.0/build/button/button-min.js"></script>
<script type="text/javascript"
	src="http://yui.yahooapis.com/2.9.0/build/editor/editor-min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://yui.yahooapis.com/2.9.0/build/fonts/fonts-min.css" />
<script type="text/javascript"
	src="http://yui.yahooapis.com/2.9.0/build/yahoo/yahoo-min.js"></script>
<script type="text/javascript"
	src="http://yui.yahooapis.com/2.9.0/build/event/event-min.js"></script>
<script type="text/javascript"
	src="http://yui.yahooapis.com/2.9.0/build/connection/connection-min.js"></script>

<script>
            
 		  // jQuery.noConflict();  
		
            
 		$(document).ready(function() {
            	           //  $('#gallery a').lightBox();
                 	$(".report_image").colorbox({rel:'report_image', top: 100, photo:'true', transition:"none", width:"auto", height:"1000px"});
                    fetchPosts();
                    fetchSimilarCases();
            			//	alert("touched");
            			
                    		             			

            });
 		
 		function fetchSimilarCases()
 		{
 			var issue_description =  '<%=issue_details%>';
 			var values = "issue_description="+escape(issue_description);
 			
 		    var req=$.ajax({
 			        url: "<%=request.getContextPath()%>/GetSimilarCases",
 			        type: "post",
 			        data: values,
 			        success: function(health_cases_json_array){
 			          // alert("success");	             
 			            display_similar_health_cases(health_cases_json_array);
 			        },
 			        error:function(){
 			            alert("failure");	           
 			        }   
 		     }); 			
 		}
 		
 		function display_similar_health_cases(similar_health_cases)
 		{
 			//alert(similar_health_cases[0].title )
 			
 			  
 			for( health_case in similar_health_cases  )
 				
 			{
 				
 					alert(similar_health_cases[health_case].title);
 					var similar_issues_entry=document.createElement("div");
 	 	 			var similar_issues_url=document.createElement("a");
 	 	 			
 	 	 			$(similar_issues_url).append( similar_health_cases[health_case].title);
 	 	 			$(similar_issues_url).attr("href", similar_health_cases[health_case].url);
 	 	 			$(similar_issues_url).attr("class", "similar_issues_link");
 	 	 			$(similar_issues_entry).attr("class", "similar_issues_entry");
 	 	 			$(similar_issues_entry).append(similar_issues_url);
 	 	 			
 	 	 			var parent_div = document.getElementById("similar_issues_list");
 	 	 			$(parent_div).append(similar_issues_entry);
 	 			
 			
 			}
 			
 		}
            
        function fetchPosts()
        {
            	//alert("Please wait while we refresh")
            	var finalUrl='<%=request.getContextPath()%>/PROCESS/showPostsGraphical.jsp?topic_id=<%=request.getParameter("topic_id")%>';
                var req=$.ajax({
                              type:"GET",
                              url:finalUrl,
                           //   dataType:"script",
                              success: function(html){
                           // 	  alert('Request sucessful.');
                            	  $(".discussion_div").html(html);
                           // 	  alert(html);
                                 
                           },
                          complete:function(jqXHR, textStatus) {
                            // alert("request complete "+textStatus);
                          },
                         error: function(xhr, textStatus, errorThrown){
                           //  alert('request failed->'+textStatus);
                         }             
                });  
                     
          }

            </script>


</head>






<div><%@include file="../LANDING/hpanel.jsp"%></div>

<br>
<br>
<br>
<br>
<br>
<br>



<%
	int topic_id=Integer.parseInt(request.getParameter("topic_id"));
%>




<%
	ArrayList<Report> images=HealthRecord.getImagesListAndInfo(topic_id);

		if( images.size()!=0)
                 {
%>


<div id="gallery">
	<ul>
		<%
			int i = 0;
		                           for(Report image : images )
		                           {        i++;
		                     //              out.print("<a href='"+request.getContextPath()+"/ViewImage?file_id="+image+"'><img src='"+request.getContextPath()+"/ViewImage?file_id="+image+"' height='50px' width='50px' /> "+i+"</a>,");
		%>

		<li><a class="report_image"
			href="<%=request.getContextPath()%>/ViewImage?file_id=<%=image.getReport_id()%>&scale=800"
			title="<%=image.getDescription()%>"> <img
				src='<%=request.getContextPath()%>/ViewImage?file_id=<%=image.getReport_id()%>&scale=500'
				height='200px' width='200px' />
		</a></li>


		<%
			}
		%>
	</ul>
</div>

<%
	}
%>



<strong> <br>
<br>
<br>


<br>


	<div align="center" id="issue_metadata">

		<br>
		<a id="edit_link"
			href="<%=request.getContextPath()%>/UPLOADER/care-seeker-input-edit.jsp?topic_id=<%=topic_id%>">Edit
			health issue? </a> <br>
		<br>

	<div id="topic_div">
		<%=issue.getTopic()%>
	</div>
	<hr></hr>
		
</strong>

<br>
<br> Patient name : &nbsp;

<a class="patient_profile" href="<%=request.getContextPath()%>/PROFILE/PATIENT/profile.jsp?patient_name=<%=issue.getProblem_id()%>">
  		<%= issue.getProblem_id() %>
  		</a>
  		

<br>

<!-- Uploaded by: <%=issue.getSocialWorker_id()%>  -->
<br>


<br>
<br>

<div align="left">

	<%=issue.getProblem_details()%>

</div>

<script type="text/javascript">
	

</script>

<hr></hr>

<div id="similar_issues_div" align="left">
	
	<h2> Similar health cases from <a href="http://www.bmj.com/">BMJ </a> </h2>
	<div id="similar_issues_list">
		
		
	
	</div>
</div>


</div>

<br>
<br>



<br>
<br>


<%

if(  User.getLoggedInUserRole(request).equals("2") )
{
	


%>


<div class="discussion_div"></div>


<div align="center" id="send_post_status"></div>



<div align="left" id="comments_guidelines">

	<strong> Please share your thoughts (with online accessible
		evidence based links) to help better manage further care for this
		patient.Depending on your comment-input, you will be named as one of
		the caregivers of our UDHC team in the summary management plan that we
		may hand over to this patient and her/his primary care-giver." Check <a
		href="<%=request.getContextPath()%>/HOW/how.jsp"> Sample case </a> for
		a better understanding of the workflow .


	</strong>


</div>

<br>
<br>
<br>
<br>
<div class="yui-skin-sam">


	<form method="post"
		action="<%=request.getContextPath()%>/CatchForumPost" name="form1"
		id="form1">

		<p align='center'>

			<input type="button" name="b" id="b" value="POST COMMENT"> <br>
			<br>

			<textarea id="editor" name="editor" rows="20" cols="75">
                                        </textarea>

			<input type="hidden" id="v" name="post_data"> <input
				type="hidden" id="topic_id" name="topic_id"
				value="<%=request.getParameter("topic_id")%>"> <br>
		</p>

	</form>

</div>

arg0
<br>

<script>
        
        var sendPostStatus = document.getElementById("send_post_status");
        
         (function() {
                            var Dom = YAHOO.util.Dom,
                                Event = YAHOO.util.Event;

                            var myConfig = {
                                height: '400px',
                                width: '800px',
                                dompath: true,
                                focusAtStart: true
                            };

                            YAHOO.log('Create the Editor..', 'info', 'example');
                            var myEditor = new YAHOO.widget.SimpleEditor('editor', myConfig);
                            myEditor.render();
                            
                         //Inside an event handler after the Editor is rendered
                            YAHOO.util.Event.on('b', 'click', function() {
                                //Put the HTML back into the text area
                                myEditor.saveHTML();

                                //The var html will now have the contents of the textarea
                                var html = myEditor.get('element').value;
                                document.getElementById("v").value=html;
                                //document.form1.submit();
                                
                                sendPost();
                            });
                        })();
               
            
            

                var handleSuccess_sendPost = function(o){
                        YAHOO.log("The success handler was called.  tId: " + o.tId + ".", "info", "example");
                        if(o.responseText !== undefined){

                            /*
                                div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
                                div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
                                div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
                                div.innerHTML += "<li>HTTP headers received: <ul>" + o.getAllResponseHeaders + "</ul></li>";
                                div.innerHTML += "<li>PHP response: " + o.responseText + "</li>";
                                div.innerHTML += "<li>Argument object: Array ([0] => " + o.argument[0] +
                                                                " [1] => " + o.argument[1] + " )</li>";

                        */
                            sendPostStatus.innerHTML="POSTED SUCCESSFULLY";

							fetchPosts();

                        }
                };

                var handleFailure_sendPost = function(o){
                                YAHOO.log("The failure handler was called.  tId: " + o.tId + ".", "info", "example");

                        if(o.responseText !== undefined){
/*                            
                                div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
                                div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
                                div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";

                                */
                       }
                };

                var callback_sendPost =
                {
                success:handleSuccess_sendPost,
                failure:handleFailure_sendPost,
                argument:['foo','bar']
                };

                //var sUrl = "assets/post.php";


                function sendPost(){
                    
                    sendPostStatus.innerHTML="POSTING....";

                    var formObject=document.getElementById("form1");
                    YAHOO.util.Connect.setForm(formObject);
                    var cObj = YAHOO.util.Connect.asyncRequest('POST', '<%=request.getContextPath()%>/CatchForumPost',callback_sendPost);
                }
		//   YAHOO.log("Initiating request; tId: " + request.tId + ".", "info", "example");

	
</script>





<%
	}
}
else{
	%>
	
<div align="center">

<div><%@include file="../LANDING/hpanel.jsp"%></div>

<br><br><br><br><br><br>
	
		<img src="<%=request.getContextPath()%>/STATICS/images/blocked.jpeg"> &nbsp; <br><br>Moderators please login
		

</div>	

	
	<%
	
}

%>


</html>
