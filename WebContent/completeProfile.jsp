<%@ page import="org.udhc.models.*" %> 
<%@ page import="java.util.*" %> 

<style>

body{
	
	

}

div#completeProfile_panel1{
padding : 2%;
float: left;
border: solid 1px black;
border-radius: 3px;
}


div#completeProfile_panel2{
border: solid 1px black;
padding : 2%;
float: left;
}



div#completeProfile_panel3{
border: solid 1px black;
padding : 2%;
float: left;

}



div#form_holder{
	margin: auto;left:0;right:0;
	width:80%;
}

input.submit_button{
	padding: 20px;
	border-radius: 4px;
	font-size: 110%;
	background-color: #6FAC5A;
	color: white;
}

</style>

</head>



<div id="user_name" align='right' >
    
    You are signed in as <%=User.getLoggedInUserEmail(request)%>
    
</div>
    
    

      <body>

  
  <div id="content_space">
      <div><%@include file="./LANDING/hpanel.jsp" %></div>
    
	<br><br><br><br>
	
	
	<div id="form_holder">
	
	<div id="completeProfile_panel1" >
		<div class="hd"> Are you a care-seeker? </div>
		<div class="bd">
                    
                    <form action="<%=request.getContextPath()%>/registerUser"> 
                        <br> Assigned Anonymized ID/NAME: <br><br>
                        <input type="text" name="name" value="<%=User.getScientificName()%>"> <br>
                        <br> Pincode: <input type="text" name="pincode" value="736146">
                        
                        <br>      Email address <%=User.getLoggedInUserEmail(request)%> <input type="hidden" name="username" value="<%= User.getLoggedInUserEmail(request) %>"> <br><br>
                        <input type="hidden" name="role" value="0" ><br><br>
						<input type="submit" class="submit_button" value = " Finish account setup ">               
			     </form>                    
                </div>
		
	</div>
    
        <div id="completeProfile_panel2">
		<div class="hd"> Are you a care-giver? </div>
		<div class="bd">
                    <br>     
                    <form action="<%=request.getContextPath()%>/registerUser"> 
                        Name: <input type="text" name="name" value="<%= User.getLoggedInUserName(request) %>" ><br>
                        Email address <%=User.getLoggedInUserEmail(request)%><input type="hidden" name="email"value="<%= User.getLoggedInUserEmail(request) %>" ><br><br>
                        <input type="hidden" name="role" value="2" ><br><br>
                        
                         <input type="submit" class="submit_button" value = " Finish account setup ">
                    </form>
                    
                    
                    
                </div>
		
	</div>
                        

       <div id="completeProfile_panel3" >
		<div class="hd"> Are you a Social worker ?  </div>
		<div class="bd">
                    <br>     
                    <form action="<%=request.getContextPath()%>/registerUser"> 
                        Name: <input type="text" name="name" value="<%= User.getLoggedInUserName(request) %>" ><br>
                        Email address <%=User.getLoggedInUserEmail(request)%> <input type="hidden" name="email"value="<%= User.getLoggedInUserEmail(request) %>" ><br><br>
                        <input type="hidden" name="role" value="1" ><br><br>
                        
            			<input type="submit" class="submit_button" value = " Finish account setup ">
                    </form>
                    
                    
                    
                </div>
		
	</div>
                    
                      
  </div>                        
  </body>                        
	

<!--END SOURCE CODE =============================== -->