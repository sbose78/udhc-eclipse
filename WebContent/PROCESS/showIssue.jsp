

<link rel="stylesheet" href="<%=request.getContextPath()%>/mystyle.css" type="text/css" />
<%@page import="org.udhc.gen.HealthRecord"%>
<%@page import="java.util.ArrayList"%>




<%
	int topic_id=Integer.parseInt(request.getParameter("topic_id"));
%>

<div class="plain_link" align='center'> <a href="<%=request.getContextPath()%>/INPUT/displayIssueGraphically.jsp?topic_id=<%=topic_id%>"> Visit HIDDEN LAYER PROCESSING </a>
    
</div>
   
   <br>
   <br>
   <br>
        
<%
        	ArrayList<Integer> images=HealthRecord.getImagesList(topic_id);
                int i = 0;
                for(Integer image : images )
                {        i++;
        //                out.print("<a href='"+request.getContextPath()+"/ViewImage?file_id="+image+"'><img src='"+request.getContextPath()+"/ViewImage?file_id="+image+"' height='50px' width='50px' /> "+i+"</a>,");
        %>

<a href="#" onclick="show_image('<%=request.getContextPath()%>/ViewImage?file_id=<%=image%>')"><img src="<%=request.getContextPath()%>/ViewImage?file_id=<%=image%>" height='50px' width='50px'><%=i%></a>

<%
	}

        out.println(org.udhc.gen.HealthRecord.getHealthRecordByID(Integer.parseInt(request.getParameter("topic_id"))).getProblem_details());
%>