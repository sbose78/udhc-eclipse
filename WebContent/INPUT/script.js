/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function show_image(link)
{
 //   window.openDialog(link, 'image');//, features, arg1, arg2)
 
  var myWin = window.open(link,"MainWin","width=500px" + ",height=500px"+ ",screenX=500px" + ",screenY=500px" + ",left=500px" + ",top= 500px"+ ",scrollbars=yes,toolbar=0,status=1,menubar=0,resizable=0,titlebar=no");
 
}



function renderRichText()
{
                             var Dom = YAHOO.util.Dom,
                                        Event = YAHOO.util.Event;

                            var myConfig = {
                                height: '400px',
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
                                document.form1.submit();
                            });
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
function showIssue(topic_id){
        topic_id=topic_id.toString();
        posts=document.getElementById("displayInputs_narrative_details");
        posts.innerHTML="<p align='center'> <img src='http://www.superpurses.com/images/loading.gif'/></p>";        
        
        
 //        var context_path=document.getElementById("context_path").value;
	var request = YAHOO.util.Connect.asyncRequest('GET', 'showIssue.jsp?topic_id='+topic_id, callback_posts);	
	YAHOO.log("Initiating request; tId: " + request.tId + ".", "info", "example");

}

var fileFormDiv;

var handleSuccess_FileUploadForm = function(o){
        
	YAHOO.log("The success handler was called.  tId: " + o.tId + ".", "info", "example");
	if(o.responseText !== undefined){
	               
        //        div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
	//	div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
	//	div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
	//	div.innerHTML += "<li>HTTP headers received: <ul>" + o.getAllResponseHeaders + "</ul></li>";
		fileFormDiv.innerHTML = o.responseText  ;
                
	//	div.innerHTML += "<li>Argument object: Array ([0] => " + o.argument[0] +
						 " [1] => " + o.argument[1] + " )</li>";
	}
};

var handleFailure_FileUploadForm = function(o){
		YAHOO.log("The failure handler was called.  tId: " + o.tId + ".", "info", "example");

	if(o.responseText !== undefined){
		fileFormDiv.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
		fileFormDiv.innerHTML += "<li>HTTP status: " + o.status + "</li>";
		fileFormDiv.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
	}
};

var callback_FileUploadForm =
{
  success:handleSuccess_FileUploadForm,
  failure:handleFailure_FileUploadForm,
  argument:['foo','bar']
};

/*
var sUrl = "assets/post.php";
var postData = "username=anonymous&userid=0";
*/
function showFileUploadForm(topic_id)
{
        topic_id=topic_id.toString();
        fileFormDiv=document.getElementById("displayInputs_imageUpload");//.innerHTML='FORM COMES HERE...'+topic_id;
    
        fileFormDiv.innerHTML="<p align='center'> <img src='http://www.superpurses.com/images/loading.gif'/></p>";        
        
        
 //        var context_path=document.getElementById("context_path").value;
	var request = YAHOO.util.Connect.asyncRequest('GET', 'showFileUploadForm.jsp?topic_id='+topic_id, callback_FileUploadForm);	
        
	YAHOO.log("Initiating request; tId: " + request.tId + ".", "info", "example");

}




 var upload_status=document.getElementById("upload_status");

  var handleSuccess_uploadImage = function(o){
      
       // upload_status.innerHTML="(Uploaded)"
        
	YAHOO.log("The success handler was called.  tId: " + o.tId + ".", "info", "example");
        
        alert("Image uploaded successfully");
        
        var topic_id=document.getElementById("topic_id").value; 
        //alert(topic_id);
        
        showMyIssue(topic_id);
        
        
	if(o.responseText !== undefined){
	               
                       
                       
                       
        //        div.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
	//	div.innerHTML += "<li>HTTP status: " + o.status + "</li>";
	//	div.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
	//	div.innerHTML += "<li>HTTP headers received: <ul>" + o.getAllResponseHeaders + "</ul></li>";
	//	posts.innerHTML = o.responseText  ;
	//	div.innerHTML += "<li>Argument object: Array ([0] => " + o.argument[0] +
						 " [1] => " + o.argument[1] + " )</li>";
	}
};


var handleFailure_uploadImage = function(o){
		YAHOO.log("The failure handler was called.  tId: " + o.tId + ".", "info", "example");
/*
	if(o.responseText !== undefined){
		posts.innerHTML = "<li>Transaction id: " + o.tId + "</li>";
		posts.innerHTML += "<li>HTTP status: " + o.status + "</li>";
		posts.innerHTML += "<li>Status code message: " + o.statusText + "</li>";
	}
        */
};

var callback_uploadImage=
{
  upload:handleSuccess_uploadImage,
  //failure:handleFailure_uploadImage,
  argument:['foo','bar']
};


// added from displayMyInputs




function showMyIssue(topic_id)
{
    document.getElementById("displayInputs_narrative_details").style.marginTop='105px';
        document.getElementById("displayInputs_imageUpload").innerHTML='';

    showIssue(topic_id);
    showFileUploadForm(topic_id);
}
