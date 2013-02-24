<%-- 
    Document   : index
    Created on : 28 Apr, 2012, 2:55:33 PM
    Author     : root - shoubhik bose
--%>

<%@page import="java.util.ArrayList"%>
<%@ page import="org.udhc.gen.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <script src="http://yui.yahooapis.com/3.5.0/build/yui/yui-min.js"></script>
    
    <head>    	<meta charset='utf-8'/>
                <script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
 <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
        
                	


<style>

#topic_div{
	background-color:  #CB2934;
	color: white;
	padding: 10px;
	font-size: 110%;
}




#care_seeker_form
{
	font-size: 110%;
	width: 80%;
	margin: auto;
	right: 0;left:0;

	
	
	border: solid 2px #7895D7;
	padding: 20px;
	border-radius: 9px;
	background-color: #EAEFF1;
	

}


input.text_box
{
	height:40px;
	font-size:14pt;
	width:500px;	
}

label{
	font-size: 120%;
}
#b
{
	padding:15px;
	background-color: #C93733;
	color: white;
	font-size: 110%;
	border-radius: 5px;
	cursor:pointer;
}

.image_div{

    margin-top: 10px;  
    padding:15px;
    vertical-align: middle;
    border-bottom: solid;
    border-color:black;
    
	
	
	width:60%;
	height:300px;
}

img.scans{

width:auto;
height: 300px;
position: relative;
z-index:20;
 

}

img.scans:hover{

width:auto;
height: 850px;
z-index: 214747


}

input.scan_button{
	cursor:pointer;
	z-index:3000;
	position:absolute;
	background-color: #C93733;
	color: white;
	width:100px;
	height: 30px;
}

.image_div img:hover input.scan_button{

}

#add_new_scan_section
{
	margin: auto;
	left: 0;right: 0;
	text-align: left; 
	font-size: 120%;	
	
	border: solid 2px #7895D7;
	padding: 20px;
	border-radius: 9px;
	background-color: #EAEFF1;
}

.file_upload_form_button{

	background-color:#064169 ;
	color: white;
	padding: 12px;
	cursor:pointer;
	font-size: 120%;
	
	
}

#image_request_button{
	cursor:pointer;

	background-color:#064169 ;
	color: white;
	padding: 12px;
	
	font-size: 120%;
		
	
}

#td_show_images
{
	padding: 15px;
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


#add_new_scan_section:hover{

	background-color: #FFF982;

}
h2{

	background: rgb(246,248,249); /* Old browsers */
background: -moz-linear-gradient(top, rgba(246,248,249,1) 0%, rgba(229,235,238,1) 50%, rgba(215,222,227,1) 51%, rgba(245,247,249,1) 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(246,248,249,1)), color-stop(50%,rgba(229,235,238,1)), color-stop(51%,rgba(215,222,227,1)), color-stop(100%,rgba(245,247,249,1))); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top, rgba(246,248,249,1) 0%,rgba(229,235,238,1) 50%,rgba(215,222,227,1) 51%,rgba(245,247,249,1) 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top, rgba(246,248,249,1) 0%,rgba(229,235,238,1) 50%,rgba(215,222,227,1) 51%,rgba(245,247,249,1) 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(top, rgba(246,248,249,1) 0%,rgba(229,235,238,1) 50%,rgba(215,222,227,1) 51%,rgba(245,247,249,1) 100%); /* IE10+ */
background: linear-gradient(to bottom, rgba(246,248,249,1) 0%,rgba(229,235,238,1) 50%,rgba(215,222,227,1) 51%,rgba(245,247,249,1) 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f6f8f9', endColorstr='#f5f7f9',GradientType=0 ); /* IE6-9 */

}

</style>                	
                	        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Health record form</title>
   




<script type="text/javascript">

	
	$(document).ready(function() {
  // Handler for .ready() called.

  			
  		$("#load_wait").hide();
  		//$("#patient_name_text").hide();
  		//alert("loaded");
  		
		$("#button1").click(function(){
			//event.preventDefault();
			for(var i =1;i<15;i++)
			{
				var image_icon= document.createElement("img");
				image_icon.setAttribute("src","<%=request.getContextPath()%>/STATICS/images/chrome-button.png");
				image_icon.setAttribute("class", "scans");
				image_icon.setAttribute("image_id",i);
				
				var image_button=document.createElement("input");
				image_button.setAttribute("type","button");
				image_button.setAttribute("value","DELETE "+i );
				image_button.setAttribute("class","scan_button");
				image_button.setAttribute("image_id",i);
				//image_button.setAttribute("height","20px");
				
				var image_div= document.createElement("div");
				image_div.setAttribute("image_id",i);
				image_div.setAttribute("class","image_div");

				image_div.appendChild(image_icon);				
				image_div.appendChild(image_button);
								
				$("#images_list").append(image_div);
				/*
				
				*/
			}		
			
		});
		
		/*
		$('#images_list').on('click', 'img.scans', function(){
			
			alert($(this).attr("image_id"));
			$(this).remove();
		});
		
		*/
		
		
		$('#images_list').on('click', 'input.scan_button', function(){
				//alert($(this).attr("image_id"));
			    var image_id=$(this).attr("image_id");
			   // alert(image_id);
			    
			    deleteImage(image_id);
			    
			  //  $("div[image_id='"+image_id+"']").remove();				
				//$(this).remove();
		});
		
		$('#image_request_button').click(function(){
			
			var node = document.getElementById("images_list");
			while (node.hasChildNodes()) {
			    node.removeChild(node.lastChild);
			}
			fetchAllImageIDs();
		});
		
		$('.popup_login').click(function(){
       	 alert("Please make sure Pop-ups are enabled in your browser");
       	  var auth_win=window.open("<%=request.getContextPath()%>/AUTH/auth.jsp","Auth", "width=1400,height=500,scrollbars=no");
       	  var timer = setInterval(function() {   
       		    if(auth_win.closed) {  
       		        clearInterval(timer);  
       		        window.location.reload(); 
       		    }  
       		}, 1000);
      	                 	  
         });  
  		
  		
	});
  		
  		
</script>

<script>

		function deleteImage( image_id )
		{
			var finalUrl='<%=request.getContextPath()%>/DeleteHealthFile?health_file_id='+image_id;
			alert( "Deleting image...");// with "+image_id);
		     var req=$.ajax({
		                   type:"GET",
		                   url:finalUrl,
		                   //contentType: "application/json; charset=utf-8",
		                   dataType:"JSON",
		                   success: function(deletion_status){
		                 	  //alert(html[0].about);
		                 	  
		                 //	  deletion_status = jQuery.parseJSON(deletion_status);
		                 	 // alert( deletion_status[0].status);       
		                 	  if ( parseInt(deletion_status[0].status) > 0)
		                 	  {
		                 		 $("div[image_id='"+image_id+"']").remove();
		                 		 alert(" Successfully removed");
		                 	  }
		                 	  else{
		                 		  alert( " Server error . Could not be deleted");
		                 	  }
		                 	  
		                },
		               complete:function(jqXHR, textStatus) {
		                 // alert("request complete "+textStatus);
		               },
		              error: function(xhr, textStatus, errorThrown){
		                //  alert('request failed->'+textStatus);
		              }   
		              
		              
		     });  
		     
		}



		function fetchAllImageIDs(){
			   alert("FETCHING ALL Image uploads");
			   $("#load_wait").show();
			 
				var finalUrl='<%=request.getContextPath()%>/GetAllImagesIDs?topic_id=<%=request.getParameter("topic_id")%>';
		     var req=$.ajax({
		                   type:"GET",
		                   url:finalUrl,
		                   //contentType: "application/json; charset=utf-8",
		                   dataType:"JSON",
		                   success: function(html){
		                 	 // alert(html[0].about);
		                 	  $("#load_wait").hide();
		                 	  addAllImages(html);                            
		                },
		               complete:function(jqXHR, textStatus) {
		                 // alert("request complete "+textStatus);
		            	   $("#load_wait").hide();
		               },
		              error: function(xhr, textStatus, errorThrown){
		                //  alert('request failed->'+textStatus);
		            	  $("#load_wait").hide();
		              }   
		              
		              
		     });  
		     
		}
		
		function addSingleImage(image_info)
		{
			   var image_icon= document.createElement("img");
				image_icon.setAttribute("src",'<%=request.getContextPath()%>/ViewImage?file_id='+image_info.image_id);
				
				image_icon.setAttribute("class", "scans");
				image_icon.setAttribute("image_id",image_info.image_id);
				
				
				var image_button=document.createElement("input");
				image_button.setAttribute("type","button");
				image_button.setAttribute("value","DELETE " );
				image_button.setAttribute("class","scan_button");
				image_button.setAttribute("image_id",image_info.image_id);
				//image_button.setAttribute("height","20px");
				
				var image_div= document.createElement("div");
				image_div.setAttribute("image_id",image_info.image_id);
				image_div.setAttribute("class","image_div");
		
				image_div.appendChild(image_button);
				image_div.appendChild(image_icon);				
				
								
				$("#images_list").append(image_div);	
		}
		
		function addAllImages(image_info_list)
		{
			   
			   for(var i =0 ; i< image_info_list.length ; i++ )
			   {
				addSingleImage(image_info_list[i]);		   
			   }
			   //alert(image_id+","+about);
			   /*
			   var image_icon= document.createElement("img");
			   	
				image_icon.setAttribute("src","<%=request.getContextPath()%>/STATICS/images/chrome-button.png");
				image_icon.setAttribute("class", "scans");
				image_icon.setAttribute("image_id",i);
				*/
		}


		
		function display_image_data(image_data)
		{
			var obj = jQuery.parseJSON(image_data); 
			//alert( obj.image_id);
			addSingleImage(obj);
		}


			
			var handleSuccess_sendImage = function(o){
				   $("#load_wait").hide();

					alert("Successfully uploaded");
					
					//alert(o.responseText);
					display_image_data(o.responseText);
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
			     //       sendPostStatus.innerHTML="POSTED SUCCESSFULLY";
			
						//fetchPosts();
			
			        }
			};
			
			var handleFailure_sendImage = function(o){
				$("#load_wait").hide();
				alert("Upload failed - please try again. If the issue persists, please contact sbose78@gmail.com");
			                YAHOO.log("The failure handler was called.  tId: " + o.tId + ".", "info", "example");
			
			        if(o.responseText !== undefined){
			/*                            
			                div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
			                div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
			                div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
			
			                */
			       }
			};
			
			var callback_sendImage =
			{
					  upload:handleSuccess_sendImage,

			argument:['foo','bar']
			};
			
			//var sUrl = "assets/post.php";
			
			
			function sendImage(){
			    
			//    sendPostStatus.innerHTML="POSTING....";
						   $("#load_wait").show();

			    var formObject=document.getElementById("form_image");
			    YAHOO.util.Connect.setForm(formObject,true);
			    var cObj = YAHOO.util.Connect.asyncRequest('POST', '<%=request.getContextPath() %>/CatchImageUpload', callback_sendImage);
			 //   YAHOO.log("Initiating request; tId: " + request.tId + ".", "info", "example");
			
			}

</script>




       <script src="http://yui.yahooapis.com/3.5.0/build/yui/yui-min.js"></script>
  
    
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/menu/assets/skins/sam/menu.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/container/assets/skins/sam/container.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/editor/assets/skins/sam/editor.css" />
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/element/element-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/container/container-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/menu/menu-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/button/button-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/editor/editor-min.js"></script>



<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/fonts/fonts-min.css" />
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/yahoo/yahoo-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/event/event-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/connection/connection-min.js"></script>

<script src="http://yui.yahooapis.com/3.5.0/build/yui/yui-min.js"></script>


<%@ page import="org.udhc.gen.*" %>



     </head>
     <div>
         
         
        < <%@include file="../LANDING/hpanel.jsp" %>
     </div>
     
     <br><br><br><br>
    
<div id="load_wait">

<img src="<%=request.getContextPath()%>/STATICS/images/loading.gif"/>

</div>    
    <body   class="yui-skin-sam" >
    
            
           
                  
            <h2 align="center"> PART 1 - ADD OR DELETE HEALTH ISSUE FILES   
           
          </h2>
          <br><BR>
          <div style="{font-size: 120%}"align="center">
       
         Share using this permament link : <a href="<%=request.getContextPath()%>/INPUT/displayIssueGraphically.jsp?topic_id=<%=request.getParameter("topic_id")%>"> http://care.udhc.co.in/<%=request.getContextPath()%>/INPUT/displayIssueGraphically.jsp?topic_id=<%=request.getParameter("topic_id")%> </a>
      
            </div>
            <br><BR>
             
          
            

<%
	String loggedInUserEmail=org.udhc.gen.User.getLoggedInUserEmail(request);
	
	

	 if(org.udhc.gen.User.getLoggedInUserEmail(request).equals("GUEST"))
    {
        
        String redirect_url=request.getContextPath()+"/INPUT/care-seeker-input.jsp";
        request.getSession(true).setAttribute("redirect_url", redirect_url);
 %>
 
 
 	<div class="popup_login" align='center'>
  		<strong> PLEASE LOGIN TO CONTINUE  		</strong> <br><br>
  		<a href="#">
  		
  		<img src="<%=request.getContextPath()%>/STATICS/images/openid.png">
  		
  		</a>
  	</div>
  		
  		
        
<%        
       // response.sendRedirect(request.getContextPath()+"/account.jsp?message=YOU ARE NOT SIGNED IN");        
        //String link=request.getContextPath()+"/login_float.jsp";
        
        
    }
    else 
    {
    	if( request.getParameter("topic_id")!=null  )
    	{
    		    	
	    	int topic_id=Integer.parseInt(request.getParameter("topic_id"));    
	    	
		    System.out.println( User.getLoggedInUserRole(request));
		    HealthRecord record = HealthRecord.getHealthRecordByID(topic_id);
		    
		    String patient_name=record.getProblem_id();
		    String problem_details  =record.getProblem_details();
		    String topic=record.getTopic();
		    int approved = record.getApproved();
		    if(User.isModerator(User.getLoggedInUserEmail(request)) || User.getLoggedInUserEmail(request).equals(record.getSocialWorker_id())){
		    	
		    
%>


                
<div align='center'>

  <Strong> <div id="topic_div"><%= topic %> </div></Strong>

 <hr></hr>
    
    
    <table>       
    	<tr>
         <td align="left" id="td_show_images">
         
         			<br>
			
			<div align='center'>
			<button id="image_request_button">SHOW UPLOADED FILES</button>
			</div>
            <div id="images_list" align="left">
			( Images will appear here )
			
			</div>

			       
	     </td>
	     <td align="center" valign="top" >
	     <div id="add_new_scan_section">		       
			            
    <strong><h3>Add a new health report / scan  </h3></strong>
    
    <p style="{color:red;}">
    
    <font color="red">Files should be in image formats : JPEG/JPG/PNG only </font> 
    
    </p>
    
	<form  action="<%=request.getContextPath()%>/CatchImageUpload" method="post" enctype="multipart/form-data" id="form_image" name="form_image">
			            <input name="topic_id" id="topic_id" value="<%=request.getParameter("topic_id")%>" type="hidden">         
			           
			             About the image: <input name="file_name" type="text" id="file_name">  <br>           
			         Choose File ( any image within 2 MB ): <input name="f" type="file" id="f">   <br><br> 
			            <input type="button" class="file_upload_form_button" onclick="sendImage()" value="Upload scanned image"><br>
			        
			</form>
	</div>		 
			</td>
	    </tr>
	   
	   </table>

</div>    
<br><br>
<br><br><br>
  <hr></hr>
  
  

<style>

#edit_status{

	color: red;
	font-weight:bolder;
	padding:20px;
	font-size: 120%;

}

</style>
                  

<h2 align="center"> PART 2 - UPDATE THE HEALTH ISSUE NARRATIVE -</h2>

 <div id="edit_status" align="center" >   </div>
            
<div id="care_seeker_form" align="center">


  <form method="post" action="<%=request.getContextPath() %>/CatchUpdateHealthIssue" name="form1" id="form1"  enctype="multipart/form-data">

           <input type="hidden"  name="topic_id" value="<%=topic_id %>">
        
                        <label>
                         Health issue topic : 
                      		<input type="text" class="text_box" value="<%=topic%>"  name="topic"><br>
                        </label>                       
  	<br>
     				 <label> Patient name: <input class="text_box" name="patient_name" value="<%=patient_name %>" type="text"></label>                        
                        <br><br>
                        
                        
                 <%
                		if( User.isModerator(User.getLoggedInUserEmail(request)))
                		{
                %>		
                
                 <label>                        
                       <input name="approved" type="radio" value="1" checked="checked" />
                       
                       This Health issue will be publicly viewable.
                       
                       </label>
                       
                       
                      <br> <label> 
                       <input name="approved" type="radio" value="0" />
                       
                       The health issue will NOT be publicly viewable.
                       
                        </label>
           <%
           
                		}
                 
                		else{
           %>
            		<br><input type="hidden" name="approved" value="<%=approved%>"><br>
           
           <% 
                			// embed hidden field
                		}
				                        	
            %>
                        
                       
                        <br><br>
                        <label> <strong>Narrative</strong></label><br><br>
                        <textarea id="editor" name="editor" rows="20" cols="75" >
                        
                        <%=problem_details %>
                        
                        </textarea>         
                   <br>   <input type='button' id="b" VALUE= " SAVE UPDATES">
                        
                        <br><br><br><br><br>
                      
                        <input type="hidden" id="v" name="problem_details">     
  </form>
      </div>            
</body>
    
    
</html>
                <script>

                        (function() {
                            var Dom = YAHOO.util.Dom,
                                Event = YAHOO.util.Event;

                            var myConfig = {
                                height: '180px',
                                width: '1000px',
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
                              //   document.form1.submit(); 
                              sendHealthIssueUpdate();
                                
                            });
                        })();
                        
                        function sendHealthIssueUpdate()
                        {
                          alert("Updating..");
          				$("#load_wait").show();

                        	var formObject=document.getElementById("form1");
                            YAHOO.util.Connect.setForm(formObject);
                            var cObj = YAHOO.util.Connect.asyncRequest('POST', '<%=request.getContextPath() %>/CatchUpdateHealthIssue', callback_sendHealthIssueUpdate);
                                                   
                        }
                        
                        var handleSuccess_sendHealthIssueUpdate = function(o){
                            YAHOO.log("The success handler was called.  tId: " + o.tId + ".", "info", "example");
            				$("#load_wait").hide();

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
                            
                            alert("YOUR UPDATES WERE SUCCESSFULLY SAVED");
                            var sendHealthIssueUpdateStatus=document.getElementById("edit_status");
                              sendHealthIssueUpdateStatus.innerHTML="<Strong>EDITS SAVED!</strong>";

                            }
                    };

                    var handleFailure_sendHealthIssueUpdate = function(o){
        				$("#load_wait").hide();

                                    YAHOO.log("The failure handler was called.  tId: " + o.tId + ".", "info", "example");

                            if(o.responseText !== undefined){
    /*                            
                                    div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
                                    div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
                                    div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";

                                    */
                           }
                    };

                    var callback_sendHealthIssueUpdate =
                    {
                    success:handleSuccess_sendHealthIssueUpdate,
                    failure:handleFailure_sendHealthIssueUpdate,
                    argument:['foo','bar']
                    };
                        
                        
                </script>
        
       
<%			}
    	}	
    }
%>        
    
