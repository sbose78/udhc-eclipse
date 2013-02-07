<%-- 
    Document   : submit_reports
    Created on : 22 Aug, 2012, 1:29:36 AM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit reports</title>
    </head>
    <body>
        
                        <div><%@include file="../hpanel.jsp" %></div>

<div id="submit_reports_form" >           
        <form method="post" action="<%=request.getContextPath() %>/CatchReport" name="form1" id="form1"  enctype="multipart/form-data">                  
            <br>
            
            <label>Patient_id
                <input type="text" name="patient_id" id="image_patient_id"><br>
            </label>
            
            
            <label>About the image
                <input type="text" name="description" id="image_description"><br>
            </label>
            
            <br>
            
            <label > Upload report
                <input type="file" name="image_report" id="image_report">
            </label>
            
            <br>
            <input type="submit" value="UPLOAD FILE">
            
        
        </form>
    </div>
  </body>
</html>
