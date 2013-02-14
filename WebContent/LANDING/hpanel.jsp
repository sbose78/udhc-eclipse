
 <%@page import="org.udhc.gen.User"%>
<%
    String action="";
    
     if(org.udhc.gen.User.getLoggedInUserEmail(request).equals("GUEST"))
     {
    	  action="LOGIN";
    	 
     }
     else
     {
    	 action=User.getLoggedInUserEmail(request);
     }
    
    
    %>
    
     <script type="text/javascript">
                 function openLoginPopup(){
                	 alert("Please make sure Pop-ups are enabled in your browser");
                	  var auth_win=window.open("<%=request.getContextPath()%>/AUTH/auth.jsp","Auth", "width=1400,height=500,scrollbars=no");
                	  var timer = setInterval(function() {   
                		    if(auth_win.closed) {  
                		        clearInterval(timer);  
                		        window.location.reload(); 
                		    }  
                		}, 1000);
               	                 	  
                  }
                 
                 function visitHome() {
                	 
                	 window.location="<%=request.getContextPath()%>/login.jsp";
					
				}
                 
	</script>
    	

<header id="header">
	
	  <div id="logo" onclick="visitHome()">	
	  	<img src="<%=request.getContextPath()%>/STATICS/images/MA-logo.jpg" height="50px" width="auto"/>
	  	
	  		 <strong>ArogyaUDHC  - User-driven Health care	</strong>
	  </div>
	  <div id="all_links">	  		
				<ul >
				
					<li> <a class="popup_login" onclick="openLoginPopup()" href="#"><img height="27px" src="<%=request.getContextPath()%>/STATICS/images/openid_icon.png"/> &nbsp; <%=action %></a>
					</li>
				
					<li> <a style='background-color:red' href="<%=request.getContextPath()%>/HOW/how.jsp">HOW</a>
					</li>
					
					<li><a href="<%=request.getContextPath()%>/STATICS/what.jsp">WHAT</a>
					</li>
					
					<li><a href="<%=request.getContextPath()%>/STATICS/why.jsp">WHY</a>
					</li>
					
					
					<li><a style='background-color:red'  href="<%=request.getContextPath()%>/INPUT/displayInputs.jsp">INPUT</a>
					</li>
					
					<li><a href="<%=request.getContextPath()%>/PROCESS/process.jsp">PROCESS</a>
					</li>
					
					<li><a href="<%=request.getContextPath()%>/SOLUTION/solutionList.jsp">OUTPUT</a>
					</li>
				
				<%
					if ( User.isModerator(User.getLoggedInUserEmail(request))){
				
				%>
					
					<li><a href="<%=request.getContextPath()%>/DASHBOARD/dashboard.jsp">DASHBOARD</a>
					</li>
				<%} %>
					
					
				</ul>	
		</div> 	  
	
</header>




<style>



#header{
	z-index:999;
	position:fixed;
	background-color: #F1F1F1;	
	 border: 1px solid grey;
	 padding:10px;
	 width:100%;
	 margin: auto;top:0;
}

#logo{

	cursor:pointer;

	float:left;
	width:30%;
	
	background: rgb(246,248,249); /* Old browsers */
background: -moz-linear-gradient(top, rgba(246,248,249,1) 0%, rgba(229,235,238,1) 50%, rgba(215,222,227,1) 51%, rgba(245,247,249,1) 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(246,248,249,1)), color-stop(50%,rgba(229,235,238,1)), color-stop(51%,rgba(215,222,227,1)), color-stop(100%,rgba(245,247,249,1))); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top, rgba(246,248,249,1) 0%,rgba(229,235,238,1) 50%,rgba(215,222,227,1) 51%,rgba(245,247,249,1) 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top, rgba(246,248,249,1) 0%,rgba(229,235,238,1) 50%,rgba(215,222,227,1) 51%,rgba(245,247,249,1) 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(top, rgba(246,248,249,1) 0%,rgba(229,235,238,1) 50%,rgba(215,222,227,1) 51%,rgba(245,247,249,1) 100%); /* IE10+ */
background: linear-gradient(to bottom, rgba(246,248,249,1) 0%,rgba(229,235,238,1) 50%,rgba(215,222,227,1) 51%,rgba(245,247,249,1) 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f6f8f9', endColorstr='#f5f7f9',GradientType=0 ); /* IE6-9 */
	
}
#all-links{
	

}
#all_links ul li{
	display: inline;

} 

#all_links ul li a{
	background-color: #174FF5;
	color: white;
	text-decoration: none;
	padding: 10px;
	border-radius: 5px;
	font-weight: bold;

}

#all_links ul li a:hover{
	background-color: green;
	color: white;
	

}
	
</style>