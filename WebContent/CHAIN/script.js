
function close_()
{
    document.getElementById('chain_dropdown').style.visibility='hidden';
}

function open_()
{
    document.getElementById('chain_dropdown').style.visibility='visible';
    
}

var posts;
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
function showIssue(topic_id, context_path){
        topic_id=topic_id.toString();
         posts=document.getElementById("chain_input");
        posts.innerHTML="<p align='center'> <img src='http://www.superpurses.com/images/loading.gif'/></p>";        
        
        
 //        var context_path=document.getElementById("context_path").value;
	var request = YAHOO.util.Connect.asyncRequest('GET', 'showIssue.jsp?topic_id='+topic_id, callback_posts);	
	YAHOO.log("Initiating request; tId: " + request.tId + ".", "info", "example");
        
        showPosts(topic_id,context_path);

}

var process_posts;



 var handleSuccess_process_posts= function(o){
        
	YAHOO.log("The success handler was called.  tId: " + o.tId + ".", "info", "example");
	if(o.responseText !== undefined){
	               
        //        div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
	//	div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
	//	div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
	//	div.innerHTML += "<li>HTTP headers received: <ul>" + o.getAllResponseHeaders + "</ul></li>";
		process_posts.innerHTML = o.responseText  ;
	//	div.innerHTML += "<li>Argument object: Array ([0] => " + o.argument[0] +
						 " [1] => " + o.argument[1] + " )</li>";
	}
        
};

var handleFailure_process_posts = function(o){
		YAHOO.log("The failure handler was called.  tId: " + o.tId + ".", "info", "example");

	if(o.responseText !== undefined){
		process_posts.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
		process_posts.innerHTML += "<li>HTTP status: " + o.status + "</li>";
		process_posts.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
	}
};

var callback_process_posts =
{
  success:handleSuccess_process_posts,
  failure:handleFailure_process_posts,
  argument:['foo','bar']
};

/*
var sUrl = "assets/post.php";
var postData = "username=anonymous&userid=0";
*/
function showPosts(topic_id, context_path){
        topic_id=topic_id.toString();
        process_posts=document.getElementById("chain_process");
        process_posts.innerHTML="<p align='center'> <img src='http://www.superpurses.com/images/loading.gif'/></p>";        
        
        
 //        var context_path=document.getElementById("context_path").value;
	var request = YAHOO.util.Connect.asyncRequest('GET', 'showPosts.jsp?topic_id='+topic_id, callback_process_posts);	
	YAHOO.log("Initiating request; tId: " + request.tId + ".", "info", "example");

}

function neutralise()
{
  document.getElementById('chain_input').style.zIndex='1';       
  document.getElementById('chain_process').style.zIndex='1';   
  document.getElementById('chain_solution').style.zIndex='1';    
  document.getElementById('chain_input').style.width='400px'; 
  document.getElementById('chain_process').style.width='400px';    
  document.getElementById('chain_solution').style.width='400px';  
  document.getElementById('chain_process').style.marginLeft='410px';   
  document.getElementById('chain_solution').style.marginLeft='820px';    

  
  


  
}
     
function focus_input()
{
    neutralise();
    document.getElementById('chain_input').style.zIndex='2';    
    document.getElementById('chain_input').style.width='550px';    
   
    
}

function focus_process()
{
    neutralise();
    document.getElementById('chain_process').style.zIndex='2';    
    document.getElementById('chain_process').style.width='550px';    
    document.getElementById('chain_process').style.marginLeft='340px';    
        
}

function focus_solution()
{
    neutralise();
    document.getElementById('chain_solution').style.zIndex='2';    
    document.getElementById('chain_solution').style.width='550px';    
    document.getElementById('chain_solution').style.marginLeft='670px';    
        
}



//8622025857