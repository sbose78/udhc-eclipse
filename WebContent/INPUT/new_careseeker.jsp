<%-- 
    Document   : new_careseeker
    Created on : 2 Jun, 2012, 12:29:01 PM
    Author     : root
--%>

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

    

<div  class="yui-skin-sam">

  <form method="post" action="<%=request.getContextPath() %>/CatchHealthIssue2" name="form1" id="form1"  enctype="multipart/form-data">

                    <p align='center'>
                        <label>
                            What is the problem in Short ?
                        <input type="text" maxlength="50" name="topic">
                        
                        </label> &nbsp;
                        
                        
                        <label> UPLOAD Letter of consent (<a href="" >Learn more</a> ) : <input name="f" type="file" id="f"> </label>
                        
                        <br><br> Write or paste the care-seeker narrative here <br><br>
                   
                        
                        
         <textarea id="editor" name="editor" rows="20" cols="75" >
                
         </textarea>
                        
                       
                        
                        <input type="hidden" id="v" name="problem_details">
                        
                        
                        
                        <br>
                        <input type="button" name="b" id="b" value="SUBMIT HEALTH RECORD FOR PROCESSING">
                        </p>
                        
  </form>

                <script>
/*
                        (function() {
                            var Dom = YAHOO.util.Dom,
                                Event = YAHOO.util.Event;

                            var myConfig = {
                                height: '180px',
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
                        })();
     *
     */
                </script>
            </div>
  