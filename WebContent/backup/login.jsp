<%-- 
    Document   : login
    Created on : 29 Apr, 2012, 12:33:22 AM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<html>
    <head>
    
    <script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
 <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
        
         
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UDHC Alpha release</title>
</head>
    

          
<style>

#right_pane{
	
	padding: 2%;
	font-size: 110%;
	
	width: 80%
	
}

#left_pane{
	width: 80%;
	padding: 2%;
}
#left_pane img{
	
	margin:10px;
	width:inherit;
	border-color: black;
	border-style: ridge;
	

}

.user_type_div{
    border-radius:15px;
	font-size: 110%;
	color: rgb(255, 255, 255);
	background-color: rgb(3, 41, 69);
	padding: 10px;

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
    border-radius:20px;
	background-color: #0B75B2;
	padding: 9px;
	color:white;
	text-decoration: none;
	cursor: pointer;
	font-size: 80%;
	
}

.user_instruction a:hover{
	background-color: black;
}
</style>


      <body>

  
  
      <div><%@include file="hpanel.jsp" %></div>
      
      <table align='center' width='100%'><tr>
        <td align="center" valign="top">
        <br><br>
        
        
        <div id="left_pane">
   
   			 <div class ="user_type_div"> We shall share your data with your consent    </div>
   			 
   			 <div class="user_instruction">
   			               
   			               <br><br>
   			               
   			               DOWNLOAD THE LETTER OF CONSENT HERE 
   			               
   			               <br><br>
                        
                        
                       <a href="<%=request.getContextPath()%>/STATICS/docs/udhc-hindi.pdf">Letter of consent - Hindi</a><br><br>
                       <a href="<%=request.getContextPath()%>/STATICS/docs/udhc-bengali.pdf">Letter of consent - Bengali</a><br><br>
                       <a href="<%=request.getContextPath()%>/STATICS/docs/udhc-english.pdf">Letter of consent - English</a><br><br>
                         
   			               
   			 </div>
   
				        <img src="<%=request.getContextPath() %>/STATICS/images/how-it-works-info.jpg"></img>
				        </div>
				        
				        <br>
				        <hr></hr>        
        </td>
        
      
         
        
	 <td width="50%">  
                  <div id="right_pane" align='left'>
                
                
                <div class ="user_type_div"> Are you a care-seeker / patient ?     </div>
                <br>
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
                	<br>
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
                	<br>
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
                                    
          
          
       
    <script src="http://www.google.com/jsapi?key=AIzaSyA5m1Nc8ws2BbmPRwKu5gFradvD_hgq6G0" type="text/javascript"></script>
    <script type="text/javascript">
        
           /*
    *  How to load a feed via the Feeds API.
    */
    /*
    google.load("feeds", "1");
    
    // Our callback function, for when a feed is loaded.
    function feedLoaded(result) {
      if (!result.error) {
        // Grab the container we will put the results into
        var container = document.getElementById("content_feed");
        container.innerHTML = '<b>Recent posts from BMJ</b> <br>';
    
        // Loop through the feeds, putting the titles onto the page.
        // Check out the result object for a list of properties returned in each entry.
        // http://code.google.com/apis/ajaxfeeds/documentation/reference.html#JSON
        for (var i = 0; i < result.feed.entries.length; i++) {  //
          var entry = result.feed.entries[i];
          var div = document.createElement("div");
          div.innerHTML="<a href='"+entry.link+"'>"+entry.title+"</a>";
          //div.appendChild(document.createTextNode(entry.title));
              
          div.className="feed_title";
          container.appendChild(div);
       
          
        }
      }
    }
    
    function OnLoad() {
      // Create a feed instance that will grab Digg's feed.
      var feed = new google.feeds.Feed("http://casereports.bmj.com/rss/recent.xml");
    
      // Calling load sends the request off.  It requires a callback function.
      feed.load(feedLoaded);
    }
    
    google.setOnLoadCallback(OnLoad);
    
    
   */
    </script>
                                                                      
     
                                      
                                    
     </body>
 
 
</html>
