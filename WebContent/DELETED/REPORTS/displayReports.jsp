<%-- 
    Document   : displaeyReports
    Created on : 22 Aug, 2012, 10:36:27 PM
    Author     : root
--%>

<%@page import="org.udhc.gen.HealthRecord"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reports</title>
        
        
<style type="text/css">
	/* jQuery lightBox plugin - Gallery style */
	#gallery {
                
		padding: 5px;
                
                margin-left: 20%;
                width:60%;
		
	}
	#gallery ul { list-style: none; }
	#gallery ul li { display: inline; }
	#gallery ul img {
		border: 5px solid #3e3e3e;
		border-width: 5px 5px 20px;
                
	}
	#gallery ul a:hover img {
		border: 5px solid #fff;
		border-width: 5px 5px 20px;
		color: #fff;
                
                width: 220px;
                height: 220px;
	}
	#gallery ul a:hover { color: #fff; }
</style>        
        
        
    </head>
    <body>
        

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.lightbox-0.5.js"></script>

<link rel="stylesheet" type="text/css" href="css/jquery.lightbox-0.5.css" media="screen" />

<script type="text/javascript">
$(function() {
	// Use this example, or...
	
	// This, or...
	// This, or...
	        $('#gallery a').lightBox();// Select all links in the page
	// ... The possibility are many. Use your creative or choose one in the examples above
});

</script>
        
        
        
        
       
    <div id="gallery">
        <ul>
        
<%
        	int report_id=Integer.parseInt(request.getParameter("patient_id"));
                      

                        
                        ArrayList<Integer> images=org.udhc.models.Report.getImagesList(report_id);
                        int i = 0;
                        for(Integer image : images )
                        {        i++;
                  //              out.print("<a href='"+request.getContextPath()+"/ViewImage?file_id="+image+"'><img src='"+request.getContextPath()+"/ViewImage?file_id="+image+"' height='50px' width='50px' /> "+i+"</a>,");
        %>

<li><a href="<%=request.getContextPath()%>/showImageReport?report_id=<%=image%>"><img src='<%=request.getContextPath()%>/showImageReport?report_id=<%=image%>' height='180px' width='150px' /></a>
</li>
<%
        }


%>
        
        
        </ul>
     </div>


    </body>
</html>
