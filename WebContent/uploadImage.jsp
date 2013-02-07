<%-- 
    Document   : uploadImage
    Created on : 2 May, 2012, 1:47:13 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <form action="<%=request.getContextPath()%>/UploadImage" method="post" enctype="multipart/form-data" >
            <input name="f" type="file" id="f">
            <input type="submit" >
        </form>
        
        
    </body>
</html>
