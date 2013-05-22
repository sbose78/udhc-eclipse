<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> User authentication </title>
</head>
<body>

<script>
/*
	window.onunload = refreshParent;
	function refreshParent() {
	    window.opener.location.reload();
	}
	*/
</script>

<%

	if(!org.udhc.models.User.getLoggedInUserEmail(request).equals("GUEST"))
	{
		response.sendRedirect(request.getContextPath()+"/signout");
	}

%>

<style>

table{
	
	margin: auto;
	left: 0;right: 0;

}

</style>
	
		<div align="center">
		
			<img alt="ArogyaUDHC" src="<%=request.getContextPath()%>/STATICS/images/arogya-udhc-name.png">
			                                                        <img height="50px" src="<%=request.getContextPath()%>/STATICS/images/openid_icon.png"/>
			
		
		</div>




<div id="loginbox">      
                    
                    <p align="center">
                    
                    
                    
                    
                    <br><br><br><br><br>
                    
                    
                    <strong>Signing with your existing Yahoo/Google account</strong>
                    
                    </p>
                    
                        <table>
                        
                          <tr>
                            <td > 
                                
                                <form action="<%=request.getContextPath() %>/openid" method="get">
                                    <input name="op" value="Yahoo" type="hidden">
                                    <input type='image' src='<%=request.getContextPath()%>/STATICS/images/signin-with-yahoo.png'>
                                </form>
                                
                            </td>
                            
                            <td>
                                
                                <form action="<%=request.getContextPath() %>/openid" method="get">
                                    <input name="op" value="Google" type="hidden">
                                    <input type='image' src='<%=request.getContextPath()%>/STATICS/images/google-signin.png'>
                                </form>                                                                
                                
                            </td>
                            </tr>
                            
                            
                            
                            <tr>
                            
                            
                            
                            </tr>
                        </table>    
       
                                    
                                    
                                    
                    
        </div>      


</body>
</html>