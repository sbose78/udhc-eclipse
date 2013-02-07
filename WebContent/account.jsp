<%-- 
    Document   : login
    Created on : 29 Apr, 2012, 12:33:22 AM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<html>
    <head>
        
         
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UDHC Alpha release</title>
</head>
    




      <body>

  
  <div id="content_space">
      <div><%@include file="hpanel.jsp" %></div>
      
      
      
        <div align="center">      
            <br>
            <Br>
            
            <%
                        	String uname=org.udhc.gen.User.getLoggedInUserEmail(request);
                                    if(!uname.equals("GUEST")){
                        %>
            
            
            You are signed in as <b><%=uname%>(<a href="<%=request.getContextPath()%>/signout">logout?</a></b>)
            <br>
            <br>
            
            <%
                       }
            %>
            <div id="account_instruction">
             Sign in with 
                
            </div>
            
           
            
           
            
                        <table>
                            <td > 
                                
                                <form action="<%=request.getContextPath() %>/openid" method="get">
                                    <input name="op" value="Yahoo" type="hidden">
                                    <input type='image' src='http://l.yimg.com/a/i/reg/openid/buttons/7.png'>
                                </form>
                                
                            </td>
                            
                            <td>
                                
                                <form action="<%=request.getContextPath() %>/openid" method="get">
                                    <input name="op" value="Google" type="hidden">
                               <input type='image' src='<%=request.getContextPath()%>/STATICS/images/google-signin.png'>
                                </form>                                                                
                                
                            </td>
                        </table>    
       
                                    
                                    
                                    
                    
        </div>                  
                                    
                                    
                                    
          
          
       
    <script src="http://www.google.com/jsapi?key=AIzaSyA5m1Nc8ws2BbmPRwKu5gFradvD_hgq6G0" type="text/javascript"></script>
             
      </div>                                                                        
     
                                      <div><%@include file="footer.jsp" %></div>
                                    
     </body>
 
 
</html>
