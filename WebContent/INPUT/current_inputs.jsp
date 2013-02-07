<%-- 
    Document   : current_inputs
    Created on : 2 Jun, 2012, 12:01:23 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="org.udhc.gen.*" %> 
<%@ page import="java.util.*" %> 



           
        <%
                ArrayList<HealthRecord> alhr= HealthRecord.getAllHealthRecords();        

         %>
        
        <div class="accordion">
            
                <%

                        for (HealthRecord n : alhr)
                        {
                            int topic_id=Integer.parseInt(n.getTopic_id());
                            String problem_id =n.getProblem_id();
                    
                    
                    //out.println("<h3><a href='#'>"+problem_id+" : "+topic+" </a></h3>");      
                            
                            
                %>    

                <h3><a href="#"> <%= problem_id %> &nbsp;:&nbsp; <%= n.getTopic() %>  </a></h3>
                        <div align="center">
                                <p>
                            <a href="<%=request.getContextPath()%>/showIssue.jsp?topic_id=<%=n.getTopic_id()  %>"> Care-seeker narrative  </a>         
                           &nbsp;&nbsp; ||&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/network.jsp?topic_id=<%=n.getTopic_id()  %>"> Network processing page  </a> 
                           &nbsp;&nbsp; ||&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/SOLUTION/solution.jsp?topic_id=<%=n.getTopic_id()  %>"> Solution page </a> 
                           
                           
                           <br>
                            <%            
                           ArrayList<Integer> images=HealthRecord.getImagesList(topic_id);
                        int i = 0;
                        for(Integer image : images )
                        {        i++;
                                out.print("<a href='"+request.getContextPath()+"/ViewImage?file_id="+image+"'>Attached Image "+i+"</a>,");
                        }

                          %> 
                                </p>
                        </div>	
                                
                <%
                            }
                %>                                                              
        </div>
   