<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="org.udhc.dao.SolutionDAO"%>
<%@page import="org.udhc.gen.models.*"%>

<html>
                                                                  
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
 <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
        


<! CLEDITOR >


 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/cleditor/jquery.cleditor.css" /> 
 <script type="text/javascript" src="<%=request.getContextPath()%>/cleditor/jquery.cleditor.js"></script>


<style type="text/css">

</style>



	        <script type="text/javascript">                                         


					$(document).ready(function() 
					{
						
						
						
							$("#narrative_text").cleditor({
	
								width:870,
								height:400
	
							});
					});

			


			 </script>                                                               
        </head>                                                                 
	<body> 

							
<%

	SolutionDAO dao = new SolutionDAO();
	int solution_id= Integer.parseInt(request.getParameter("solution_id"));
	Solution solution = dao.getSolutionById(solution_id);
	System.out.println(solution.getSolution_content());

%>

							<form  method="post" action="<%=request.getContextPath()%>/CatchSolution">


									<div id="narrative_div_text">	
											<label> Enter Solution in <%=solution.getSolution_language() %></label>
											<p>
											
												<input type="hidden" name="topic_id" value="<%=solution.getTopic_id()%>"><br>
												<input type="hidden" name="solution_id" value="<%=solution.getSolution_id()%>"><br>
												<input type="hidden" name="update" value="true"><br>
												<input type="hidden" name="solution_language" value="<%=solution.getSolution_language()%>"><br>
												
																								
												<textarea rows="20" cols="80" name="solution_content" id="narrative_text">
												<%=solution.getSolution_content() %>
												
												</textarea>
												
												
												<input class="submit_button" type="submit" value="SUBMIT SOLUTION">
											</p>										
									</div>

							</form>	



	</body>                                                                 
</html>
