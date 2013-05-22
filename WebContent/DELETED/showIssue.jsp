<%-- 
    Document   : showIssue.jsp
    Created on : 30 Apr, 2012, 6:49:10 PM
    Author     : root
--%>

   <link rel="stylesheet" href="<%=request.getContextPath()%>/mystyle.css" type="text/css" />
     


<%@page import="org.udhc.gen.HealthRecord"%>
<%@page import="java.util.ArrayList"%>
       
        
<div class="issue_div">
        
    <div align="center">

                    <ul>        
                                    <%
                                            	int topic_id=Integer.parseInt(request.getParameter("topic_id"));
                                                                                ArrayList<Integer> images=HealthRecord.getImagesList(topic_id);
                                                                                int i = 0;
                                                                                for(Integer image : images )
                                                                                {        i++;
                                                                                        //out.println("<li><a href='"+request.getContextPath()+"/ViewImage?file_id="+image+"'>View image "+i+"</a>");
                                            %>

<a href="#" onclick="show_image('<%=request.getContextPath()%>/ViewImage?file_id=<%=image%>')"><img src="<%=request.getContextPath()%>/ViewImage?file_id=<%=image%>" height='50px' width='50px'><%=i%></a>


  <%
  	}
  %>

                    </ul>
    </div>
                    
        <%=org.udhc.gen.HealthRecord.getHealthRecordByID(Integer.parseInt(request.getParameter("topic_id"))).getProblem_details()%>
        
    