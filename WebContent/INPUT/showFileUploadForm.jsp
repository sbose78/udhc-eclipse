<div align="center">
    
    <!-- 
    Upload more reports in the form of Scans/Images ?
     -->
        <div id="upload_status"></div>
</div>  

<%

String topic_id=request.getParameter("topic_id");

%>

<!-- 
    
    
<form  action="<%=request.getContextPath()%>/UploadImage" method="post" enctype="multipart/form-data" id="imageForm" name="imageForm">
            <input name="topic_id" id="topic_id" value="<%=topic_id%>" type="hidden">         
            File: <input name="f" type="file" id="f"> <br>           
            About the image: <input name="file_name" type="text" id="file_name"> 
            <input type="button" onclick="uploadImage()" value="Upload image"><br>
        
</form>
    
 -->