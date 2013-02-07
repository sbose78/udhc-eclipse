<%-- 
    Document   : network.jsp
    Created on : 28 Apr, 2012, 7:35:26 PM
    Author     : root
--%>



<%
	if(org.udhc.gen.User.getLoggedInUserEmail(request).equals("GUEST"))
    {
        String redirect_url=request.getContextPath()+"/network.jsp?topic_id="+request.getParameter("topic_id");
        request.getSession(true).setAttribute("redirect_url", redirect_url);
        response.sendRedirect(request.getContextPath()+"/account.jsp?message=YOU ARE NOT SIGNED IN");        
    }
%>


<script>
    

    function show_image(link)
    {
    //   window.openDialog(link, 'image');//, features, arg1, arg2)

    var myWin = window.open(link,"MainWin","width=500px" + ",height=500px"+ ",screenX=500px" + ",screenY=500px" + ",left=500px" + ",top= 500px"+ ",scrollbars=yes,toolbar=0,status=1,menubar=0,resizable=0,titlebar=no");

    }
    
</script>


<%@page import="org.udhc.gen.HealthRecord"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
 
        
          <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  
  
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
        

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UHDC:Network processing</title>

    </head>
    <h3 align='right'>
    
    You are signed in as <%=org.udhc.gen.User.getLoggedInUserEmail(request)%>
    
    </h3>
    
    <%@include file="hpanel.jsp" %>

    <body>
        
        
        
        
        
         <%
                                                 	String topic_id=request.getParameter("topic_id");
                                                           //     out.println(HealthRecord.getHealthRecordByID(Integer.parseInt(topic_id)).getProblem_details());
                                                 %>
        
        
        <h3 align="center"> Network processing : <%=org.udhc.gen.HealthRecord.getHealthRecordByID(Integer.parseInt(topic_id)).getTopic()%></h3>
        
        
        <div align="center">
                     
              
            <button  onclick="hide()">HIDE NARRATIVE</button>
            <button  onclick="makeRequest()">REFRESH NARRATIVE</button>
            
        </div>
        
            <br>
            <div id="narrative">
            
                                          
        </div>
        <br>
  <script type="text/javascript">
            
            function hide()
            {
                //document.getElementById("narrative").style.visibility="hidden";
                document.getElementById("narrative").innerHTML="";
                
            }
            
            function show()
            {
                document.getElementById("narrative").style.visibility="visible";
            }
            
            
            var div =  document.getElementById("narrative");

var handleSuccess = function(o){
    
        div.innerHTML="";
        div.className="div_issue";
	YAHOO.log("The success handler was called.  tId: " + o.tId + ".", "info", "example");
	if(o.responseText !== undefined){
	               
        //        div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
	//	div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
	//	div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
	//	div.innerHTML += "<li>HTTP headers received: <ul>" + o.getAllResponseHeaders + "</ul></li>";
		div.innerHTML = o.responseText  ;
	//	div.innerHTML += "<li>Argument object: Array ([0] => " + o.argument[0] +
						 " [1] => " + o.argument[1] + " )</li>";
	}
};

var handleFailure = function(o){
		YAHOO.log("The failure handler was called.  tId: " + o.tId + ".", "info", "example");

	if(o.responseText !== undefined){
		div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
		div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
		div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
	}
};

var callback =
{
  success:handleSuccess,
  failure:handleFailure,
  argument:['foo','bar']
};

var sUrl = "assets/post.php";
var postData = "username=anonymous&userid=0";

function makeRequest(){
    
                div.innerHTML="";
                div.innerHTML="<p align='center'> <img src='http://www.superpurses.com/images/loading.gif'/></p>";

        var topic_id= <%=topic_id%>;
	var request = YAHOO.util.Connect.asyncRequest('GET', '<%=request.getContextPath() %>/showIssue.jsp?topic_id='+topic_id, callback);
	
	YAHOO.log("Initiating request; tId: " + request.tId + ".", "info", "example");

}
            
        </script>

        
         <div align='center'>
                    <button  onclick="hide_posts()">HIDE POSTS</button>
                    <button  onclick="showPosts()">REFRESH POSTS</button>
                    
        </div>
        <br>
        <div id="posts" onload="showPosts()">
            
            
            
            
        </div>
        <br>
        
 <script> 
       function hide_posts()
            {
                //document.getElementById("narrative").style.visibility="hidden";
                document.getElementById("posts").innerHTML="";
                
            }
       
       
       var posts=document.getElementById("posts");
       
       var handleSuccess_posts = function(o){
        
	YAHOO.log("The success handler was called.  tId: " + o.tId + ".", "info", "example");
	if(o.responseText !== undefined){
	               
        //        div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
	//	div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
	//	div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
	//	div.innerHTML += "<li>HTTP headers received: <ul>" + o.getAllResponseHeaders + "</ul></li>";
		posts.innerHTML = o.responseText  ;
	//	div.innerHTML += "<li>Argument object: Array ([0] => " + o.argument[0] +
						 " [1] => " + o.argument[1] + " )</li>";
	}
};

var handleFailure_posts = function(o){
		YAHOO.log("The failure handler was called.  tId: " + o.tId + ".", "info", "example");

	if(o.responseText !== undefined){
		posts.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
		posts.innerHTML += "<li>HTTP status: " + o.status + "</li>";
		posts.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
	}
};

var callback_posts =
{
  success:handleSuccess_posts,
  failure:handleFailure_posts,
  argument:['foo','bar']
};

/*
var sUrl = "assets/post.php";
var postData = "username=anonymous&userid=0";
*/
function showPosts(){

        posts.innerHTML="<p align='center'> <img src='http://www.superpurses.com/images/loading.gif'/></p>";


        var topic_id= <%=topic_id%>;
	var request = YAHOO.util.Connect.asyncRequest('GET', '<%=request.getContextPath() %>/showPosts.jsp?topic_id='+topic_id, callback_posts);
	
	YAHOO.log("Initiating request; tId: " + request.tId + ".", "info", "example");

}

window.onload=function(){
    
    showPosts();
    makeRequest();
}
</script>
        
        
        
        
        <br>
        <br>
        
        
                                                <div id="sendPostStatus" align="center"></div>                                      

        <div  class="yui-skin-sam">

            
                                <form method="post" action="<%=request.getContextPath() %>/CatchForumPost" name="form1" id="form1">

                                   <p align='center'>

                                        <textarea id="editor" name="editor" rows="20" cols="75" >
                                        </textarea>
                                       
                                        <input type="hidden" id="v" name="post_data">
                                        <input type="hidden" id="topic_id" name="topic_id" value="<%=request.getParameter("topic_id")%>">
                                        <br>
                                        <input type="button" name="b" id="b" value="POST COMMENT">
                                   </p>

                                </form>
                                        
        </div>
                                        
                                        
                                        


                <script>

                        var sendPostStatus = document.getElementById('sendPostStatus');


                        (function() {
                            var Dom = YAHOO.util.Dom,
                                Event = YAHOO.util.Event;

                            var myConfig = {
                                height: '200px',
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
                                //document.form1.submit();
                                
                                sendPost();
                            });
                        })();
                </script>

            
      
           <script>

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

                                    showPosts();

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
                                	is it c                       }
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
                            var cObj = YAHOO.util.Connect.asyncRequest('POST', '<%=request.getContextPath() %>/CatchForumPost', callback_sendPost);

/*
                            var topic_id_param=document.getElementById("topic_id").value;                            
                            var post_data_param=document.getElementById("v").value;                            
                            
                        var postData_sendPost = "topic_id="+topic_id_param+"&post_data="+post_data_param;
                               //alert( " Postinng "  );
                                //sendPostStatus.inner="Posting comment, please wait...."
*/


   //var request = YAHOO.util.Connect.asyncRequest('POST', '<%=request.getContextPath() %>/CatchForumPost', callback_sendPost, postData_sendPost);

                                YAHOO.log("Initiating request; tId: " + request.tId + ".", "info", "example");

                        }

             </script>
        
    </body>
</html>
