
<%@page import="org.udhc.gen.models.Report"%>
<%@page import="org.udhc.gen.*"%>
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
<%
	int health_record_id=Integer.parseInt(request.getParameter("topic_id"));                
HealthRecord issue= HealthRecord.getHealthRecordByID(health_record_id);
String loggedInUser= User.getLoggedInUserEmail(request);

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

#topic_div{
	background-color:  #CB2934;
	color: white;
	padding: 12px;
	font-size: 120%;
    border-radius: 15px;
}


</style>



<link rel="stylesheet" href="<%=request.getContextPath()%>/mystyle.css"
	type="text/css" />
<%@page import="org.udhc.gen.HealthRecord"%>
<%@page import="java.util.ArrayList"%>

<script type="text/javascript">
            
 		  // jQuery.noConflict();  

            $(function() {
            	           //  $('#gallery a').lightBox();
                 	$(".report_image").colorbox({rel:'report_image', top: 100, photo:'true', transition:"none", width:"auto", height:"1000px"});
                    		fetchPosts();
            			//	alert("touched");
            			
                    		             			

            });
            
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
			href="<%=request.getContextPath()%>/ViewImage?file_id=<%=image.getReport_id()%>&scale=500"
			title="<%=image.getDescription()%>"> <img
				src='<%=request.getContextPath()%>/ViewImage?file_id=<%=image.getReport_id()%>&scale=800'
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
	
		<img src="<%=request.getContextPath()%>/STATICS/images/blocked.jpeg">

</div>	

	
	<%
	
}

%>


</html>
