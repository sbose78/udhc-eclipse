
<%@page import="org.udhc.gen.User"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/mystyle.css" type="text/css" />
<%@page import="org.udhc.gen.HealthRecord"%>
<%@page import="java.util.ArrayList"%>




<%
	int topic_id=Integer.parseInt(request.getParameter("topic_id"));
%>

   <div align='center'> <a href="<%=request.getContextPath()%>/INPUT/displayIssueGraphically.jsp?topic_id=<%=topic_id%>"> Permanent link and Graphical representation </a>
   <br>
   
    
</div>
        
<%
        	ArrayList<Integer> images=HealthRecord.getImagesList(topic_id);
                int i = 0;
                for(Integer image : images )
                {        i++;
          //              out.print("<a href='"+request.getContextPath()+"/ViewImage?file_id="+image+"'><img src='"+request.getContextPath()+"/ViewImage?file_id="+image+"' height='50px' width='50px' /> "+i+"</a>,");
        %>

<a class="report_image" href="<%=request.getContextPath()%>/ViewImage?file_id=<%=image%>" ><img src='<%=request.getContextPath()%>/ViewImage?file_id=<%=image%>&scale=100' height='80px' width='80px' /></a>

<%
	}
	int health_record_id=Integer.parseInt(request.getParameter("topic_id"));                
	HealthRecord issue= HealthRecord.getHealthRecordByID(health_record_id);
	                
    //out.println(org.udhc.gen.HealthRecord.getHealthRecordByID(Integer.parseInt(request.getParameter("topic_id"))).getProblem_details());
%>



<br><Br>

<style>

#issue_metadata{

	background-color: #FAFAFA;
	color: #021C33;
	font-size: 120%;
	padding:2%;
	margin-left: 10%;
	margin-right: 10%;
	border-color: #021C33;
	border: medium;
	border-width: 1px;
	border-style: solid;
	font-weight: 2px;
		
}

.modify_links{
	padding: 5px;
	margin: 5px;
	border-radius:3px;
	background-color: black;
	color: white;
	text-decoration: none;
}

</style>


<div align="center" id="issue_metadata">
  <strong><%= issue.getTopic() %></strong>
	


<br>
Patient name : 

<a class="patient_profile" href="<%=request.getContextPath()%>/PROFILE/PATIENT/profile.jsp?patient_name=<%=issue.getProblem_id()%>">
<%=  issue.getProblem_id() %> 
</a>
<br>
<%
  if (  User.getLoggedInUserEmail(request).equals(issue.getSocialWorker_id()) || User.isModerator( User.getLoggedInUserEmail(request)))
  {

%>
<br>
		<a class="modify_links" href="<%=request.getContextPath()%>/UPLOADER/care-seeker-input-edit.jsp?topic_id=<%=topic_id%>">EDIT </a>
	&nbsp;&nbsp;	<a class="modify_links" href="<%=request.getContextPath()%>/DeleteHealthIssue?topic_id=<%=topic_id%>"> DELETE </a> 

<%

  }	
%>
	

</div>	 
											
	<br><br>										
<%= issue.getProblem_details() %>
