<%-- 
    Document   : hpanel
    Created on : 18 May, 2012, 8:31:18 PM
    Author     : root
--%>

        
            <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
   
  
        
        
         <link rel="stylesheet" href="<%=request.getContextPath()%>/jqwidgets/styles/jqx.base.css" type="text/css" />
         <link rel="stylesheet" href="<%=request.getContextPath()%>/jqwidgets/styles/jqx.energyblue.css" type="text/css" />
         <link rel="stylesheet" href="<%=request.getContextPath()%>/jqwidgets/styles/jqx.summer.css" type="text/css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/jqwidgets/styles/jqx.shinyblack.css" type="text/css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/jqwidgets/styles/jqx.darkblue.css" type="text/css" />

         
                  <link rel="stylesheet" href="<%=request.getContextPath()%>/jqwidgets/styles/jqx.darkblue.css" type="text/css" />
                  
                  <link rel="stylesheet" href="<%=request.getContextPath()%>/mystyle.css" type="text/css" />

    <script type="text/javascript" src="http://www.jqwidgets.com/jquery-widgets-demo/scripts/gettheme.js"></script>
    <script type="text/javascript" src="http://www.jqwidgets.com/jquery-widgets-demo/scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jqwidgets/jqxtabs.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jqwidgets/jqxexpander.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/jqwidgets/jqxbuttons.js"></script>
    
        <script type="text/javascript">
            $(document).ready(function () {
                var theme = 'energyblue';//getTheme();
                // Create a jqxMenu
                
                $("#input_tabs").jqxTabs({ position: 'top', width: '1200px', height: '1000px' , theme: theme, reorder: true });
                $(".accordion").accordion({ autoHeight: true , clearStyle: true });
                $("#b").jqxButton({ width: '500px', height: '30px', theme: theme });
                $(".name_button").jqxButton({ width: '450', height: '40', theme: 'darkblue' });
                $('.jqxTabs').jqxTabs({ position: 'top', width: '1000px', height: '700px' , theme: theme, reorder: true });
                $("#jqxMenu").jqxMenu({ width: '540px', height: '30px', theme: theme });
                $("#jqxMenu").css('visibility', 'visible');
                //$("#jqxMenu").css('margin-left', '40px');

                $("#disabled").jqxCheckBox({ theme: theme, width: '150px', height: '20px' });
                
                $("#open").jqxCheckBox({ theme: theme, width: '150px', height: '20px' });
                $("#hover").jqxCheckBox({ theme: theme, width: '150px', height: '20px' });
                $("#topLevelArrows").jqxCheckBox({ theme: theme, width: '200px', height: '20px' });
                $("#animation").jqxCheckBox({ theme: theme, width: '150px', height: '20px' });
                $("#jqxLoginInfo").jqxExpander({ width: '200px', theme: 'darkblue' });
               

                $("#animation").bind('change', function (event) {
                    var value = event.args.checked;
                    // enable or disable the menu's animation.
                    if (!value) {
                        $("#jqxMenu").jqxMenu({ animationShowDuration: 0, animationHideDuration: 0, animationShowDelay: 0 });
                    }
                    else {
                        $("#jqxMenu").jqxMenu({ animationShowDuration: 500, animationHideDuration: 300, animationShowDelay: 200 });
                    }
                });

                $("#disabled").bind('change', function (event) {
                    var value = event.args.checked;
                    // enable or disable the menu
                    if (!value) {
                        $("#jqxMenu").jqxMenu({ disabled: false });
                    }
                    else {
                        $("#jqxMenu").jqxMenu({ disabled: true });
                    }
                });

                $("#hover").bind('change', function (event) {
                    var value = event.args.checked;
                    // enable or disable the menu's hover effect.
                    if (!value) {
                        $("#jqxMenu").jqxMenu({ enableHover: false });
                    }
                    else {
                        $("#jqxMenu").jqxMenu({ enableHover: true });
                    }
                });

                $("#open").bind('change', function (event) {
                    var value = event.args.checked;
                    // enable or disable the opening of the top level menu items when the user hovers them.
                    if (!value) {
                        $("#jqxMenu").jqxMenu({ autoOpen: false });
                    }
                    else {
                        $("#jqxMenu").jqxMenu({ autoOpen: true });
                    }
                });
                $("#topLevelArrows").bind('change', function (event) {
                    var value = event.args.checked;
                    // enable or disable the opening of the top level menu items when the user hovers them.
                    if (!value) {
                        $("#jqxMenu").jqxMenu({ showTopLevelArrows: false });
                    }
                    else {
                        $("#jqxMenu").jqxMenu({ showTopLevelArrows: true });
                    }
                });
            });
        </script>
        
        
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
        
        
        <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-31924728-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
        

            <div id="main_head">

                USER DRIVEN HEALTH CARE: Global Learning Towards Local Care   

            </div>


    
   


        <div id='content' align="center">
        
        <div id='jqxWidget' style='height: 30px; ' >
            <div id='jqxMenu' style='visibility: hidden; margin-left: 30px; '>
                <ul>
                    <li><a href="<%=request.getContextPath()%>/home.jsp">HOME</a></li>
                    <li><a href="<%=request.getContextPath()%>/HOW/how.jsp">HOW</a></li>                    
                    <li><a href='<%=request.getContextPath()%>/STATICS/what.jsp'> WHAT</a></li>             
                    
                    <li><a href='<%=request.getContextPath()%>/STATICS/why.jsp'>WHY</a></li>
                    
                      <li><a href='<%=request.getContextPath()%>/INPUT/input.jsp'>INPUT</a></li>
                    
                    <li><a href='<%=request.getContextPath()%>/problem_list.jsp'>PROCESS</a></li>
                    
                    <li><a href='<%=request.getContextPath()%>/problem_list.jsp'>OUTPUT</a>                  </li>
                    
                     <li> ACCOUNT
                        
                        <ul style='width: 180px;'>
                            
                            
                            <li><a href="<%=request.getContextPath()%>/home.jsp">LOG OUT</a></li>
                            <li><a href="<%=request.getContextPath()%>/home.jsp"> <%=org.udhc.gen.User.getLoggedInUserEmail(request)%> </a></li>
                            
                        </ul> 
                    
                    </li>
                    
                </ul>      
            </div>            
        </div>
    </div>
                        
        <br>
        <br>
        


<%-- 
    Document   : hpanel-2
    Created on : 7 Jun, 2012, 5:02:32 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
