<%-- 
    Document   : index
    Created on : 28 Apr, 2012, 2:55:33 PM
    Author     : root - shoubhik bose
--%>

<%@page import="java.util.ArrayList"%>
<%@ page import="org.udhc.models.User" %>
<%@ page import="org.udhc.models.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <script src="http://yui.yahooapis.com/3.5.0/build/yui/yui-min.js"></script>
    
    <head>
                <script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
 				<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
 				<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
 				
 				
		 		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/cleditor/jquery.cleditor.css" /> 
		 		<script type="text/javascript" src="<%=request.getContextPath()%>/cleditor/jquery.cleditor.js"></script>
        
                	
<style>

#existing_patients{

	border-top: medium;
	
	border-color: black;

}	

#new_patient{
		
	border-top: medium;
	
	border-color: black;
	
}

#custom_name
{
	background-color: #D24836;
	color:white;
	padding: 12px;
	border-radius:5px;
	font-size: 140%;
	font-weight: bold;

	
}

#generated_name
{
	background-color: #D24836;
	color:white;
	padding: 12px;
	border-radius:5px;
	font-size: 150%;
	font-weight: bold;
	
	
}
.text_box
{
	height:20px;
	font-size:14pt;
	width:500px;	
}

label{
	
	font-size: 140%;
	
	
	

}
#b
{
	padding: 12px;
	background-color: #0047F1;
	color: white;
	font-size: 140%;
	border-radius: 5px;
	font-weight: bold;
	
}


#care_seeker_form_div{

	width:80%;
	margin: auto;
	left:0;right:0;
	border-radius: 4px;
	padding: 4%;
}

#care_seeker_form_div:hover{

	background-color: #F1F1F1;
	
}
</style>                	
                	        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Health record form</title>
   


<script>
  
     function makeRichText() {
                            
                        }
    
    function setNewPatientStatus(isNewPatient)
    {
    	
    	/*
    	
    	isNewPatient actually denotes the index of the option
    	The options contain the list of the names of the prevoiusly added
    	Patients. The first option denotes a NEW PATIENT
    	
       	*/
       	
       	
        var patient_status_div = document.getElementById("isNew");
        if(isNewPatient != 0 )
            {
                patient_status_div.value=0;
                
            }
            else
            {
                patient_status_div.value=1;
            }
        
            alert("Updated");        
    }
    

	function updatePatientName()
	{
		var sci_name=$("#patient_name_sci").val();
		if( sci_name == undefined ) 
        	{
	          return;
	        }
  		var word_array=sci_name.split(' ');
  		var start=0;
  		
  		/*  workaround for leading # or * */
  		
  		word_array[0]=word_array[0].replace(/\s/g, '');
  		if(word_array[0].length==1){
  			start=1;
  		}
  		else{
  			start=0;
  		}  		word_array[start]=word_array[start]+$("#pincode").val();
  		
  		var final_name="";
  		for ( var i=start ;i < word_array.length ; i++ )
  		{
  			final_name=final_name+word_array[i];
  		}
  		//alert(final_name);
  		
  		$("#patient_name_text").val(final_name);
	}
	$(document).ready(function() {
  // Handler for .ready() called.
  	
  		
  		$("#editor").cleditor({
	
				width:870,
				height:400
	
		});
  
  		$("#care_seeker_form").submit(function(){
  			if($('#consent_letter').val().length !=0)
  			{ 				
  				
  				return true;
  			}
  			else
  			{
  				alert("Please upload your signed consent form");
  				return false;
  			}
  				
  		})
  	
		//makeRichText();
  
  		updatePatientName();
  		$("#pincode").change(updatePatientName);
  		$("#patient_name_sci").change(updatePatientName);
  		
  		$("#existing_patients").hide();	
	  	$("#new_patient").hide();
  	
  
  		//$("#patient_name_text").hide();
  		//alert("loaded");
  		$("#custom_name").click(function(event){

  				// change attribute name of list to patient_name_inactive
  				// change attribute name of textbox to patient_name

  				// hide list
  				// show textbox


  				//alert("okay so we need to work something out");
  				
  				/*
  				$("#patient_name_list").hide();
  				$("#patient_name_text").show();
  				*/

  				
  				$("#existing_patients").hide();	
			  	$("#new_patient").show();

  			  	$("#patient_name_text").attr("name","patient_name");
  			  	$("#patient_name_list").attr("name","patient_name_inactive");

  			  	// new patient

		  		$("#patient_status_div").val("1");
  				event.preventDefault();
  		});

  		$("#generated_name").click(function(event){

  					// change attribute name of list to patient_name_inactive  existing_patients
  					// change attribute name of textbox to patient_name new_patient

  					// hide list
  					// show textbox

  			  		/*
  					$("#patient_name_list").show();	
  			  		$("#patient_name_text").hide();
  			  		*/
  			  		
  			  		$("#existing_patients").show();	
  			  		$("#new_patient").hide();

  			  		$("#patient_name_list").attr("name","patient_name");
  			  		$("#patient_name_text").attr("name","patient_name_inactive");

  			  		// old patient

  			  		$("#patient_status_div").val("0");
  			  		event.preventDefault();


  		});
  		
  		$('.popup_login').click(function(){
        	 alert("Please make sure Pop-ups are enabled in your browser");
        	  var auth_win=window.open("<%=request.getContextPath()%>/AUTH/auth.jsp","Auth", "width=1400,height=500,scrollbars=no");
        	  var timer = setInterval(function() {   
        		    if(auth_win.closed) {  
        		        clearInterval(timer);  
        		        window.location.reload(); 
        		    }  
        		}, 1000);
       	                 	  
          });  
                  


	});
	
	
	
</script>




    




     </head>
     <div>
         
         
         <%@include file="../LANDING/hpanel.jsp" %>
     </div>
    
    <br><br><br><br><br>
    
    <body >
    
    
            
                  
            <h1 align="center">
            	
            	<img alt="" src="medical-bag.png"> &nbsp;
            
            	 Add a new health issue 
            </h1>
            
<style>

#openid_login{


}

</style>            
             
<%
	String loggedInUserEmail=User.getLoggedInUserEmail(request);
    

    if(User.getLoggedInUserEmail(request).equals("GUEST"))
    {
        
        String redirect_url=request.getContextPath()+"/INPUT/care-seeker-input.jsp";
        request.getSession(true).setAttribute("redirect_url", redirect_url);
 %>
 	<div class="popup_login" align='center'>
  		<strong> PLEASE LOGIN TO CONTINUE  		</strong> <br><br>
  		<a href="#">
  		
  		<img src="<%=request.getContextPath()%>/STATICS/images/openid.png">
  		
  		</a>
  	</div>
  		
  		
        
<%        
       // response.sendRedirect(request.getContextPath()+"/account.jsp?message=YOU ARE NOT SIGNED IN");        
        //String link=request.getContextPath()+"/login_float.jsp";
        
        
    }
    else{
	    ArrayList<User> users = new ArrayList<User>();
	    System.out.println( User.getLoggedInUserRole(request));
    
    /*
    if( !User.getLoggedInUserRole(request).equals("0"))
    {
    	*/
    
       users= User.getPatientsBySocialWorkerID(loggedInUserEmail);
       System.out.println("FILLLED USERS");
       
       /*
    }
    */
%>


            
<div id="care_seeker_form_div" align="center">

  <form method="post" action="<%=request.getContextPath() %>/CatchHealthIssue2" id="care_seeker_form"  enctype="multipart/form-data">

                    <p align='center'>
                        <label>
                            What is the problem in Short ?
                        <input type="text" class="text_box"  name="topic"><br><br>
                        
                        </label> &nbsp;
                        
                        <label> UPLOAD Letter of consent  : <input name="f" type="file" id="consent_letter"> 
                        </label>                       <br><br><br>
                        
                        
                       <a href="<%=request.getContextPath()%>/STATICS/docs/udhc-hindi.pdf">Letter of consent - Hindi</a><br><br>
                       <a href="<%=request.getContextPath()%>/STATICS/docs/udhc-bengali.pdf">Letter of consent - Bengali</a><br><br>
                       <a href="<%=request.getContextPath()%>/STATICS/docs/udhc-english.pdf">Letter of consent - English</a><br><br>
                         


    
<%    
    
 
 // List of care-seekers shown only to social workers
        if(!User.getLoggedInUserRole(request).equals("0"))
         {
                
%> 
                     
                    
<br><div id="existing_patients" >

<label >
<br> Select one of your previous patient names &nbsp;

                        <select name="patient_name" id="patient_name_list">
                                                  
 <%                 
 
                               for(User user : users)
                               {
                                   out.println("<option value='"+user.getName()+"'"+">"+user.getName()+"</option>");
                                   System.out.println("<option  value='"+user.getName()+"'"+">"+user.getName()+"</option>");
                               }
                   			  // out.println("</select> ");
                   			   
                   			   String sci_name=User.getScientificName();
%>
                			<br>
                	</select>
                	</label>
                	</div>

  <div id="new_patient">
                	
      <label> Suggested anonymous Patient name: <strong> <%=sci_name%> </strong><br> </label>
      <br>
      <br>
      
       <label> (Scientific name of a plant ) PATIENT NAME  &nbsp;: <input name="patient_name_inactive" class="text_box" id="patient_name_sci" value="<%=sci_name%>" type="text">
       </label>
       	
	
	<br><input name="patient_name" id="patient_name_text" value="HIDDEN" type="hidden">
	<br><label>PINCODE OF THE PATIENT &nbsp<input class="text_box"  name="pincode" type="text" value="736146" id="pincode">
		</label>					
	
	
	
</div>

	
			<input type="hidden" id="sci_name_ref" value="<%=sci_name %>">
				
		  <br><input type="button" id="custom_name" value="I wish to add a new patient" >
		   <input type ="button" id="generated_name" value="I wish to add reports to existing patients of mine">		                   
<%                   
                        
        }        
        else{
        
        // for care-seekers, the name remains embedded.
        
        
        
            out.println("<input type='hidden'  name='patient_name' value='"+User.getLoggedInUserName(request)+"'>");
          //  out.println("<input type='hidden'  value='"+User.getLoggedInUserName(request)+"'>");

        		
        }
                   

%>
		

             <br><br>
                        <input type="hidden" name="isNew" id="patient_status_div" value="0"> <br>
                        
                        <br><br>
                        <label> <strong>PLEASE EXPLAIN THE PROBLEM IN A FEW SENTENCES</strong></label><br><br>
                        <textarea id="editor" name="problem_details" rows="20" cols="75" >
                        
                        <Strong>Enter here</Strong>
                        
                        </textarea>         <br><br>
                      
                   <br>   <input type='SUBMIT' id="b" VALUE= " PROCEED TO NEXT STEP AND UPLOAD REPORTS ">
                        <br><br>
                                              <strong>I AGREE TO THE 'CONSENT FORM' CLAUSES AND WISH TO SUBMIT MY CASE</strong>
                      <br><br>
                         <iframe width="800px" height="300px"src="https://docs.google.com/document/d/1sojONu_CulO28z75DnyZc15C0QrUequr-OYap4GUPvI/pub?embedded=true"></iframe>
                                
                                <br>
                                
                        
                        
                        <input type="hidden" id="v" >
                        
                        <br>

                        
                        <br><br><br>
                      
                        
                        </p>
                        
  </form>

                <script>

                     
                </script>


        
        
        
        </div>
        
        
    </body>
    <%
    
    }
    %>
    
    
</html>
