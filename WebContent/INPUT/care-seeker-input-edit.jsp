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


.text_box
{
	height:20px;
	font-size:14pt;
	width:500px;	
}

label{
	
	font-size: 110%;
	font-style: italic;
	

}
#b
{
	height: 60px;
	width: 30%;
	background-color: #0047F1;
	color: white;
	font-size: 110%;
	border-radius: 5px;
	
}


#load_wait
{
	margin: auto;
	top:0;bottom: 0; left: 0;right: 0;
	width:50%;
	height: 50;
	background-color: black;
	color: white;
	opacity: 0.7;
	z-index: 666;
}

</style>                	
                	        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Health record form</title>
   



<script src="<%=request.getContextPath()%>/INPUT/js/jquery.js"></script>

<script type="text/javascript">

	
	$(document).ready(function() {
  // Handler for .ready() called.

  
  		//$("#patient_name_text").hide();
  		//alert("loaded");
	});
  		
  		
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
         
         
      <%@include file="../LANDING/hpanel.jsp" %>
     </div>
    
    <br><br><br><br>
    <div id="load_wait">
     
     WORKING. PLEASE WAIT....
    
    </div>
    
    
    <body   class="yui-skin-sam" >
    
            
                  
            <h2 align="center"> PLEASE MAKE THE CHANGES AND CLICK SAVE </h2>
            <br>
            
            <div id="edit_status" align="center" >
            
            
            </div>
            
<style>

#openid_login{


}

</style>            
             
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
%>


            
<div id="care_seeker_form" align="center">

  <form method="post" action="<%=request.getContextPath() %>/CatchUpdateHealthIssue" name="form1" id="form1"  enctype="multipart/form-data">

           <input type="hidden"  name="topic_id" value="<%=topic_id %>">
        
                        <label>
                         Health issue topic : 
                      		<input type="text" class="text_box" value="<%=topic%>"  name="topic"><br>
                        </label>                       
  	<br>
     				 <label> Patient name: <input name="patient_name" value="<%=patient_name %>" type="text"></label>                        
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
                        <textarea id="editor" name="problem_details" rows="20" cols="75" >
                        
                        <%=problem_details %>
                        
                        </textarea>         <br><br>
                      
                   <br>   <input type='button' id="b" VALUE= " SAVE UPDATES">
                        
                        
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
                        	var formObject=document.getElementById("form1");
                            YAHOO.util.Connect.setForm(formObject);
                            var cObj = YAHOO.util.Connect.asyncRequest('POST', '<%=request.getContextPath() %>/CatchUpdateHealthIssue', callback_sendHealthIssueUpdate);
                                                   
                        }
                        
                        var handleSuccess_sendHealthIssueUpdate = function(o){
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
                            
                            alert("YOUR UPDATES WERE SUCCESSFULLY SAVED");
                            var sendHealthIssueUpdateStatus=document.getElementById("edit_status");
                              sendHealthIssueUpdateStatus.innerHTML="<Strong>EDITS SAVED!</strong>";

                            }
                    };

                    var handleFailure_sendHealthIssueUpdate = function(o){
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
        
       
<%
    	}	
    }
%>        
    
