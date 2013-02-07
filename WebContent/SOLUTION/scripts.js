

  
            var div;
            
            function hide_solution_box()
            {
                div =  document.getElementById("solution_box");
                //document.getElementById("narrative").style.visibility="hidden";
                document.getElementById("solution_box").innerHTML="";
                
            }
            
            function show_solution_list(sURL)
            {
                div=document.getElementById("solution_box");
                document.getElementById("solution_box").innerHTML="LOADING SOLUTION...";
                viewSolutionList(sURL);

            }
           
            
            function show_solution_box(sURL)
            {
                div =  document.getElementById("solution_box");
                document.getElementById("solution_box").style.visibility="visible";
                makeRequest_solution_box(sURL);
            }
            
            /*
             *
             *   SHOWS THE LIST OF SOLUTIONS
             *
             *
             */  
            
var handleSuccess_viewSolutionList = function(o){
    
        div.innerHTML="";
	YAHOO.log("The success handler was called.  tId: " + o.tId + ".", "info", "example");
	if(o.responseText !== undefined){
		div.innerHTML = o.responseText  ;	
	}
};

var handleFailure_viewSolutionList = function(o)
{
	YAHOO.log("The failure handler was called.  tId: " + o.tId + ".", "info", "example");

	if(o.responseText !== undefined){
		div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
		div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
		div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
	}
};

var callback_viewSolutionList =
{
  success:handleSuccess_viewSolutionList,
  failure:handleFailure_viewSolutionList,
  argument:['foo','bar']
};

//var sUrl = "assets/post.ph;
//var postData = "username=anonymous&userid=0";

function viewSolutionList(sURL)
{    
        div.innerHTML="";
        div.innerHTML="<p align='center'> <img src='http://www.superpurses.com/images/loading.gif'/></p>";
        var request = YAHOO.util.Connect.asyncRequest('GET', sURL.toString(), callback_viewSolutionList);	
	YAHOO.log("Initiating request; tId: " + request.tId + ".", "info", "example");
}       





/*
 *
 *
 *
 *
 *  RENDERS RICH TEXT AREA
 *
 *
 *
 *
 *
 *
 */

function showEditBox() 
{
                            var Dom = YAHOO.util.Dom,
                                Event = YAHOO.util.Event;

                            var myConfig = {
                                height: '300px',
                                width: '1000px',
                                dompath: true,
                                focusAtStart: true
                            };

                            YAHOO.log('Create the Editor..', 'info', 'example');
                            var myEditor = new YAHOO.widget.SimpleEditor('editor', myConfig);
                            myEditor.render();
                            
                         //Inside an event handler after the Editor is rendered
                            YAHOO.util.Event.on('b', 'click', function() {
                                //Put the HTML back into the text area
                                myEditor.saveHTML();

                                //The var html will now have the contents of the textarea
                                var html = myEditor.get('element').value;
                                document.getElementById("v").value=html;
                                sendSolution();
                            });
 }

var handleSuccess = function(o){
    
        div.innerHTML="";
	YAHOO.log("The success handler was called.  tId: " + o.tId + ".", "info", "example");
	if(o.responseText !== undefined){
	               
        //        div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
	//	div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
	//	div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
	//	div.innerHTML += "<li>HTTP headers received: <ul>" + o.getAllResponseHeaders + "</ul></li>";
		div.innerHTML = o.responseText  ;
	//	div.innerHTML += "<li>Argument object: Array ([0] => " + o.argument[0] +
						 " [1] => " + o.argument[1] + " )</li>";
                                                 
                showEditBox();
	}
};

var handleFailure = function(o)
{
	YAHOO.log("The failure handler was called.  tId: " + o.tId + ".", "info", "example");

	if(o.responseText !== undefined){
		div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
		div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
		div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
	}
};

var callback =
{
  success:handleSuccess,
  failure:handleFailure,
  argument:['foo','bar']
};

//var sUrl = "assets/post.ph;
//var postData = "username=anonymous&userid=0";

function makeRequest_solution_box(sURL)
{    
        div.innerHTML="";
        div.innerHTML="<p align='center'> <img src='http://www.superpurses.com/images/loading.gif'/></p>";
        var request = YAHOO.util.Connect.asyncRequest('GET', sURL.toString(), callback);	
	YAHOO.log("Initiating request; tId: " + request.tId + ".", "info", "example");
}

       
       
       /*
          this part makes an AJAX post for the solution given by a doctor
        */

var sendSolutionStatus  ;

var handleSuccess_sendSolution = function(o){
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
             sendSolutionStatus.innerHTML="POSTED SUCCESSFULLY";
             
             //var sURL= document.getElementById("context_path").value.toString()+"/SOLUTION/viewSolution.jsp";
             //show_solution_list(sURL)
             
             document.getElementById("solution_box").style.visibility="hidden";
  
             
            

            }
};

var handleFailure_sendSolution = function(o){
                YAHOO.log("The failure handler was called.  tId: " + o.tId + ".", "info", "example");

        if(o.responseText !== undefined){
            /*
                div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
                div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
                div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
           */
        }
};

var callback_sendSolution =
 {
            success:handleSuccess_sendSolution,
            failure:handleFailure_sendSolution,
            argument:['foo','bar']
 };

function sendSolution()
{
        sendSolutionStatus=document.getElementById("sendSolutionStatus") ;
            
        //sendSolutionStatus.innerHTML="POSTING....";
         var topic_id_param=document.getElementById("topic_id").value;                            
         var post_data_param=document.getElementById("v").value;                            
         var postData_sendSolution = "topic_id="+topic_id_param.toString()+"&solution_content="+post_data_param.toString();
                               //alert( " Postinng "  );
         sendSolutionStatus.innerHTML="Posting solution, please wait...."
         
         var context_path=document.getElementById("context_path").value;
         var request = YAHOO.util.Connect.asyncRequest('POST', context_path.toString()+'/CatchSolution', callback_sendSolution, postData_sendSolution);
         YAHOO.log("Initiating request; tId: " + request.tId + ".", "info", "example");

}
       
       
       
         
       
       var posts;//=document.getElementById("posts");
       
       var handleSuccess_posts = function(o){
        
	YAHOO.log("The success handler was called.  tId: " + o.tId + ".", "info", "example");
	if(o.responseText !== undefined){
	               
        //        div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
	//	div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
	//	div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
	//	div.innerHTML += "<li>HTTP headers received: <ul>" + o.getAllResponseHeaders + "</ul></li>";
		posts.innerHTML = o.responseText  ;
	//	div.innerHTML += "<li>Argument object: Array ([0] => " + o.argument[0] +
						 " [1] => " + o.argument[1] + " )</li>";
	}
};

var handleFailure_posts = function(o){
		YAHOO.log("The failure handler was called.  tId: " + o.tId + ".", "info", "example");

	if(o.responseText !== undefined){
		posts.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
		posts.innerHTML += "<li>HTTP status: " + o.status + "</li>";
		posts.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
	}
};

var callback_posts =
{
  success:handleSuccess_posts,
  failure:handleFailure_posts,
  argument:['foo','bar']
};

/*
var sUrl = "assets/post.php";
var postData = "username=anonymous&userid=0";
*/
function showPosts(topic_id){
        topic_id=topic_id.toString();
         posts=document.getElementById("posts");
        posts.innerHTML="<p align='center'> <img src='http://localhost:8080/UHDC-war/SOLUTION/solution.jsp?topic_id=43'/></p>";        
        
        
         var context_path=document.getElementById("context_path").value;
	var request = YAHOO.util.Connect.asyncRequest('GET', context_path+'/showIssue.jsp?topic_id='+topic_id, callback_posts);	
	YAHOO.log("Initiating request; tId: " + request.tId + ".", "info", "example");

}