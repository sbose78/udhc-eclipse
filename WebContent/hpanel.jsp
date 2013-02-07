        
    <link rel="stylesheet" href="<%=request.getContextPath()%>/mystyle.css" type="text/css" />
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
        <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-31924728-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

 <!--  <script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
 
  -->
 <script type="text/javascript">
            $(function() {
            //	alert("hi");
                  //$('#gallery a').lightBox( {maxHeight: 100, maxWidth: 100});// Select all links in the page
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
	
	<div id="the_fixed_bar">
            
                 <h2>
                 
            <a href="<%=request.getContextPath()%>/login.jsp"><img src="<%=request.getContextPath()%>/STATICS/images/MA-logo.jpg" height="50px" width="auto"/>
            
            ArogyaUDHC - User-driven healthcare</a>
       

                                 
        <div id="horizontal_nav_bar" align="right">
        
    <ul>
    
    <%
    String action="";
    
     if(org.udhc.gen.User.getLoggedInUserEmail(request).equals("GUEST"))
     {
    	  action="LOGIN";
    	 
     }
     else
     {
    	 action="LOGOUT";
     }
    
    
    %>
    				<li><a class="popup_login" href="#"><%= action %></a></li>
    				<li><a href="#"><%=org.udhc.gen.User.getLoggedInUserEmail(request)%></a></li>
    				
                    <li><a style='background-color:red' class="howwhywhat" href="<%=request.getContextPath()%>/HOW/how.jsp">HOW</a></li>                    
                    <li><a class="howwhywhat" href='<%=request.getContextPath()%>/STATICS/what.jsp'> WHAT</a></li>             
                    <li><a class="howwhywhat" href='<%=request.getContextPath()%>/STATICS/why.jsp'>WHY</a></li>
                    <li><a style='background-color:red'  class="medic_theme" href='<%=request.getContextPath()%>/INPUT/displayInputs.jsp'>INPUT</a></li>
                    <li><a class="medic_theme" href='<%=request.getContextPath()%>/PROCESS/process.jsp'>PROCESS</a></li>
                    <li><a class="medic_theme" href='<%=request.getContextPath()%>/problem_list.jsp'>OUTPUT</a>                  </li>
                    <li><a class="howwhywhat" href="<%=request.getContextPath()%>/DASHBOARD/dashboard.jsp">DASHBOARD</a>
					</li>
                                   
             
             
         </ul>
         
        
     </div>
                   
    </h2>
  </div>
                   <br>
                   
<style>

a.medic_theme{

		background-color: #174FF5;
	color: white;
	text-decoration: none;
	padding: 10px;
	border-radius: 5px;

}

a.howwhywhat{

	background-color: #174FF5;
	color: white;
	text-decoration: none;
	padding: 10px;
	border-radius: 5px;		

}
</style>                   
     
     
   