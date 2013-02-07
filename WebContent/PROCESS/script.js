
function show_image(link)
{
 //   window.openDialog(link, 'image');//, features, arg1, arg2)
 
  var myWin = window.open(link,"MainWin","width=500px" + ",height=500px"+ ",screenX=500px" + ",screenY=500px" + ",left=500px" + ",top= 500px"+ ",scrollbars=yes,toolbar=0,status=1,menubar=0,resizable=0,titlebar=no");
 
}



window.onload=function(){
    open_();
    
}

function close_()
{
    document.getElementById('process_dropdown').style.visibility='hidden';
}

function open_()
{
    document.getElementById('process_dropdown').style.visibility='visible';
    
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
    
        document.getElementById("process_dropdown").style.visibility='hidden';
        
        topic_id=topic_id.toString();
         posts=document.getElementById("process_input");
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
        process_posts=document.getElementById("process_process");
        process_posts.innerHTML="<p align='center'> <img src='http://www.superpurses.com/images/loading.gif'/></p>";        
        
        
 //        var context_path=document.getElementById("context_path").value;
	var request = YAHOO.util.Connect.asyncRequest('GET', 'showPosts.jsp?topic_id='+topic_id, callback_process_posts);	
	YAHOO.log("Initiating request; tId: " + request.tId + ".", "info", "example");

}

     

//8622025857