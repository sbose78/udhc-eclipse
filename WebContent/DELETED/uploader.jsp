
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html;charset=utf-8" http-equiv="Content-Type">
<meta content="utf-8" http-equiv="encoding">
<style>

.image_div{
    vertical-align: middle;
    azimuth:center;
	border-color:black;
	border-style: solid;
	margin-left: auto; margin-right: auto;
	width:60%;
	height:300px;
}

.scans{

width:auto;
height: 300px;
float: left;

}

</style>

<script src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
<script src="http://yui.yahooapis.com/3.5.0/build/yui/yui-min.js"></script>    
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/menu/assets/skins/sam/menu.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/container/assets/skins/sam/container.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/editor/assets/skins/sam/editor.css" />
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/element/element-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/container/container-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/menu/menu-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/button/button-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/editor/editor-min.js"></script>
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/fonts/fonts-min.css" />
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/yahoo/yahoo-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/event/event-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/connection/connection-min.js"></script>
<script>

	   function fetchAllImageIDs(){
		   alert("FETCHING ALL IMAGE IDs");
		   
			var finalUrl='<%=request.getContextPath()%>/GetAllImagesIDs?topic_id=<%=request.getParameter("topic_id")%>';
            var req=$.ajax({
                          type:"GET",
                          url:finalUrl,
                          //contentType: "application/json; charset=utf-8",
                          dataType:"JSON",
                          success: function(html){
                        	  //alert(html[0].about);
                        	  
                        	  addAllImages(html);                            
                       },
                      complete:function(jqXHR, textStatus) {
                        // alert("request complete "+textStatus);
                      },
                     error: function(xhr, textStatus, errorThrown){
                       //  alert('request failed->'+textStatus);
                     }             
            });  
            
	   }
	   
	   function addSingleImage(image_info)
	   {
		   var image_icon= document.createElement("img");
			image_icon.setAttribute("src",'<%=request.getContextPath()%>/ViewImage?file_id='+image_info.image_id);
			
			image_icon.setAttribute("class", "scans");
			image_icon.setAttribute("image_id",image_info.image_id);
			
			
			var image_button=document.createElement("input");
			image_button.setAttribute("type","button");
			image_button.setAttribute("value","DELETE " );
			image_button.setAttribute("class","scan_button");
			image_button.setAttribute("image_id",image_info.image_id);
			//image_button.setAttribute("height","20px");
			
			var image_div= document.createElement("div");
			image_div.setAttribute("image_id",image_info.image_id);
			image_div.setAttribute("class","image_div");

			image_div.appendChild(image_icon);				
			image_div.appendChild(image_button);
							
			$("#images_list").append(image_div);	
	   }
	   
	   function addAllImages(image_info_list)
	   {
		   
		   for(var i =0 ; i< image_info_list.length ; i++ )
		   {
			addSingleImage(image_info_list[i]);		   
		   }
		   //alert(image_id+","+about);
		   /*
		   var image_icon= document.createElement("img");
		   	
			image_icon.setAttribute("src","<%=request.getContextPath()%>/STATICS/images/chrome-button.png");
			image_icon.setAttribute("class", "scans");
			image_icon.setAttribute("image_id",i);
			*/
	   }
	 
	 $(document).ready(function(){  
	
		$("#button1").click(function(){
			//event.preventDefault();
			for(var i =1;i<15;i++)
			{
				var image_icon= document.createElement("img");
				image_icon.setAttribute("src","<%=request.getContextPath()%>/STATICS/images/chrome-button.png");
				image_icon.setAttribute("class", "scans");
				image_icon.setAttribute("image_id",i);
				
				var image_button=document.createElement("input");
				image_button.setAttribute("type","button");
				image_button.setAttribute("value","DELETE "+i );
				image_button.setAttribute("class","scan_button");
				image_button.setAttribute("image_id",i);
				//image_button.setAttribute("height","20px");
				
				var image_div= document.createElement("div");
				image_div.setAttribute("image_id",i);
				image_div.setAttribute("class","image_div");

				image_div.appendChild(image_icon);				
				image_div.appendChild(image_button);
								
				$("#images_list").append(image_div);
				/*
				
				*/
			}		
			
		});
		
		/*
		$('#images_list').on('click', 'img.scans', function(){
			alert("1");
			alert($(this).attr("image_id"));
			$(this).remove();
		});
		*/
		
		
		$('#images_list').on('click', 'input.scan_button', function(){
			
			
				//alert($(this).attr("image_id"));
			    var image_id=$(this).attr("image_id");
			    alert(image_id);
			    
			    $("div[image_id='"+image_id+"']").remove();				
				//$(this).remove();
		});
		
		$('#image_request_button').click(function(){
			
			var node = document.getElementById("images_list");
			while (node.hasChildNodes()) {
			    node.removeChild(node.lastChild);
			}
			fetchAllImageIDs();
		});
		
	});
	
	
	function display_image_data(image_data)
	{
		var obj = jQuery.parseJSON(image_data); 
		alert( obj.image_id);
	}


		
		var handleSuccess_sendImage = function(o){
				alert("done");
			
				alert(o.responseText);
				display_image_data(o.responseText);
		        YAHOO.log("The success handler was called.  tId: " + o.tId + ".", "info", "example");
		        if(o.responseText !== undefined){
		
		            /*
		                div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
		                div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
		                div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
		                div.innerHTML += "<li>HTTP headers received: <ul>" + o.getAllResponseHeaders + "</ul></li>";
		                div.innerHTML += "<li>PHP response: " + o.responseText + "</li>";
		                div.innerHTML += "<li>Argument object: Array ([0] => " + o.argument[0] +
		                                                " [1] => " + o.argument[1] + " )</li>";
		
		        */
		     //       sendPostStatus.innerHTML="POSTED SUCCESSFULLY";
		
					//fetchPosts();
		
		        }
		};
		
		var handleFailure_sendImage = function(o){
			alert("failed");
		                YAHOO.log("The failure handler was called.  tId: " + o.tId + ".", "info", "example");
		
		        if(o.responseText !== undefined){
		/*                            
		                div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
		                div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
		                div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
		
		                */
		       }
		};
		
		var callback_sendImage =
		{
				  upload:handleSuccess_sendImage,

		argument:['foo','bar']
		};
		
		//var sUrl = "assets/post.php";
		
		
		function sendImage(){
		    
		//    sendPostStatus.innerHTML="POSTING....";
		
		    var formObject=document.getElementById("form1");
		    YAHOO.util.Connect.setForm(formObject,true);
		    var cObj = YAHOO.util.Connect.asyncRequest('POST', '<%=request.getContextPath() %>/CatchImageUpload', callback_sendImage);
		 //   YAHOO.log("Initiating request; tId: " + request.tId + ".", "info", "example");
		
		}
		</script>	

		<title>Edit health issue</title>
		</head>
		<body>

                
<div align='center'>
                
            <div id="images_list">
			hiii
			
			</div>
			<br>
			<button id="button1">TEST</button>
			<button id="image_request_button">Show uploaded files/images/scans</button>
			            
    
    
			<form  action="<%=request.getContextPath()%>/CatchImageUpload" method="post" enctype="multipart/form-data" id="form1" name="form1">
			            <input name="topic_id" id="topic_id" value="141" type="hidden">         
			            File: <input name="f" type="file" id="f"> <br>           
			            About the image: <input name="file_name" type="text" id="file_name"> 
			            <input type="button" onclick="sendImage()" value="Upload image"><br>
			        
			</form>
	    

</div>    


</body>
</html>