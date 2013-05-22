<%-- 
    Document   : displayInputs
    Created on : 9 Jun, 2012, 1:43:39 PM
    Author     : root
--%>



<script>
    
   
function uploadImage()
{
    
            var formObject=document.getElementById("imageForm");
            YAHOO.util.Connect.setForm(formObject,true);
            
         //   context_path=document.getElementById("context_path").value;//.toString();
            var cObj = YAHOO.util.Connect.asyncRequest('POST', '<%=request.getContextPath()%>/UploadImage', callback_uploadImage);
            document.getElementById("upload_status").innerHTML="<img src='http://www.tothepc.com/pic/loader-gif-images1.gif'>";
            
            
            
            

    // attach form object
    // send to server
    
}
    
    
</script>    
<!DOCTYPE html>
<html>

<script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
 <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>


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

<link rel="stylesheet" href="<%=request.getContextPath()%>/mystyle.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/script.js"></script>

<%@ page import="org.udhc.models.*" %>
<%@ page import="org.udhc.gen.*" %> 
<%@ page import="java.util.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Health Records Interface</title>
    </head>
    
    
    <body>
        
        <input type="hidden" id="context_path" value="<%=request.getContextPath()%>">
                <div><%@include file="../LANDING/hpanel.jsp" %></div>
      
      
      
      
<%
	if(org.udhc.models.User.getLoggedInUserEmail(request).equals("GUEST"))
    {
        
      /*  String redirect_url=request.getContextPath()+"/INPUT/displayMyInputs.jsp";
        request.getSession(true).setAttribute("redirect_url", redirect_url);
       response.sendRedirect(request.getContextPath()+"/account.jsp?message=YOU ARE NOT SIGNED IN");        
        //String link=request.getContextPath()+"/login_float.jsp";
*/
%>

<div class="popup_login" align='center'>
  		<strong> PLEASE LOGIN TO CONTINUE  		</strong> <br><br>
  		<a href="#">
  		
  		<img src="<%=request.getContextPath()%>/STATICS/images/openid.png">
  		
  		</a>
  	</div>
  		
  		
<%

    }
%>

      
                
                   <div  id="displayInputs_add_new" > <a href="../INPUT/care-seeker-input.jsp">ADD A NEW HEALTH CASE ? </a>
                   
                   &nbsp;
                   <a href="../INPUT/displayInputs.jsp">OPEN ALL RECORDS </a>
                   
                   
                   
                   <br>
                <br></div>

        
        <div id="displayInputs_narrative_list">
            
         
                
                <div align="center" id="displayInputs_heading"> <b> HEALTH CASES ADDED BY ME </b> </div>
            
            
<%
        String user=User.getLoggedInUserEmail(request);

        ArrayList<HealthRecord> alhr= HealthRecord.getSubmissionsByUserEmail(user);
        
         for (HealthRecord n : alhr)
         {
                      int topic_id=Integer.parseInt(n.getTopic_id());
                      String problem_id =n.getProblem_id();
                      String problem_title=n.getTopic();
                      String problem_topic_id=n.getTopic_id();
                      String con=request.getContextPath();
                      

%>
           
            
            <div class="displayInputs_problems" onclick="showMyIssue(<%=problem_topic_id%>)">: &nbsp; <%= problem_title%> </div>
        
     <% }  %>
            
        </div>
     
     <div id="displayInputs_imageUpload">
         
     </div>
     
     
        <div id="displayInputs_narrative_details">
   
            
            
        </div>      
             
             
    </body>
</html>
            
