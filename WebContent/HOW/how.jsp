<!DOCTYPE html>



<html lang="en">
<head>

<script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
 <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
        <title> UDHC: How we go about it</title>
        
        	 <link rel="stylesheet" href="<%=request.getContextPath()%>/jqwidgets/styles/jqx.base.css" type="text/css" />
        
  
        
   

    
    
</head>

 <div><%@include file="../LANDING/hpanel.jsp" %></div>
 
 <br><br><br>

<body class='default'>
    
    <div id="content_space">
        
    
    
     
     <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
     
   
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  
   
       
    <script type="text/javascript" src="<%=request.getContextPath()%>/jqwidgets/jqxcore.js"></script>
    
    <script type="text/javascript" src="<%=request.getContextPath()%>/jqwidgets/jqxtabs.js"></script>
     
      <script type="text/javascript">
    $(document).ready(function () {
        //alert("correcting");
         $('.jqxTabs').jqxTabs({ position: 'top', width: '1000px', height: '700px' , reorder: true });
    });
    </script>
   
    
    <div id='jqxWidget' align='center' >
        
   
        <br><br>
        <div align='center'>
 
 <style>
        
.comments_guidelines{

	color: #021E35;
	
	padding-left: 20px;
	padding-right: 20px;
	padding-top: 20px;
	padding-bottom: 20px;
	font-size: 120%;
		
}
        
        
 .comments_guidelines a 
{
	color:white;
	height: 10px;
	
	background-color: #C22E32 ;
	width:110%;
	text-decoration: none;	 
}


a.medic_theme_how{
font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #f5ebf5;
	font-size:120%;
	
	padding: 12px 16px;
	background: -moz-linear-gradient(
		top,
		#d62837 0%,
		#bd3131);
	background: -webkit-gradient(
		linear, left top, left bottom, 
		from(#d62837),
		to(#bd3131));
	-moz-border-radius: 8px;
	-webkit-border-radius: 8px;
	border-radius: 8px;
	border: 0px solid #000000;
	-moz-box-shadow:
		2px 2px 6px rgba(000,000,000,1),
		inset 0px 0px 0px rgba(255,255,255,1);
	-webkit-box-shadow:
		2px 2px 6px rgba(000,000,000,1),
		inset 0px 0px 0px rgba(255,255,255,1);
	box-shadow:
		2px 2px 6px rgba(000,000,000,1),
		inset 0px 0px 0px rgba(255,255,255,1);
	text-shadow:
		0px -1px 3px rgba(000,000,000,0.4),
		0px 1px 0px rgba(255,255,255,0.3);
	text-decoration: none;

	
}


</style>		
		
		<div align="center" class="comments_guidelines">
		
			<strong>
			
					This is how your health record will be processed. <br>
					Its easy to start with entering a health issue, <br>
		
		
			</strong>		 
		
		</div>
		<br><br><br>
		
         <a class="medic_theme_how" href="<%=request.getContextPath() %>/INPUT/care-seeker-input.jsp"> Add a new health issue ? </a>
        <br><br>
       
            
            <b>SDH Mathabhanga</b>
          </div>
        <br><br>
        <div class='jqxTabs'>

            <ul>
                <li style="margin-left: 370px;">INPUT </li>
                <li>PROCESS</li>
                <li>OUTPUT</li>
            </ul>
            <div align="center">
               <iframe src="https://docs.google.com/viewer?authuser=0&srcid=0Bz8VjLQTuhwvaHM1SnZoTTIzVVU&pid=explorer&a=v&chrome=false&embedded=true" width="750" height="650"></iframe>
            </div>
           <div align="center">
               <iframe src="https://docs.google.com/viewer?authuser=0&srcid=0Bz8VjLQTuhwvbEl6cVQ1aU13ems&pid=explorer&a=v&chrome=false&embedded=true" width="750" height="650"></iframe>

            </div>
            <div align="center">

                <iframe src="https://docs.google.com/viewer?authuser=0&srcid=0Bz8VjLQTuhwvbDZRQXMycFFuNVE&pid=explorer&a=v&chrome=false&embedded=true" width="750" height="650"></iframe></td>
                
            </div>

            
        </div>
       
        
        
    </div>
    </div>
     <div><%@include file="../footer.jsp" %></div>
</body>
</html>
