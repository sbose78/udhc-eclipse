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

input.email{

	width: 700px;

}
input.email:focus{

	border: solid 5px #EC9505;
	width: 700px;
	height:20px;
	border-radius: 5px;

}		

input.submit_button{

	background-color: #0C4B80;
	padding: 7px;
	border-radius: 5px;
	color: white;
	

}

</style>

<! end of Google transliterate API >


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

							


							<form method="post" action="<%=request.getContextPath()%>/CatchSolution">


									<div id="narrative_div_text">	
											<label> Enter Solution</label>
											<p>
												<input type="hidden" name="topic_id" value="<%=request.getParameter("topic_id")%>"><br>
																								
												<textarea rows="20" cols="80" name="solution_content" id="narrative_text"></textarea>
												<input class="submit_button" type="submit" value="SUBMIT SOLUTION">
											</p>										
									</div>

							</form>	



	</body>                                                                 
</html>
