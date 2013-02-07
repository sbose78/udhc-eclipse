
  
       <script type="text/javascript" src="http://www.jqwidgets.com/jquery-widgets-demo/scripts/gettheme.js"></script>
    <script type="text/javascript" src="http://www.jqwidgets.com/jquery-widgets-demo/scripts/jquery-1.7.1.min.js"></script>
    
    
      
         <link rel="stylesheet" href="<%=request.getContextPath()%>/jqwidgets/styles/jqx.base.css" type="text/css" />
         <link rel="stylesheet" href="<%=request.getContextPath()%>/jqwidgets/styles/jqx.energyblue.css" type="text/css" />
         <link rel="stylesheet" href="<%=request.getContextPath()%>/jqwidgets/styles/jqx.summer.css" type="text/css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/jqwidgets/styles/jqx.shinyblack.css" type="text/css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/jqwidgets/styles/jqx.darkblue.css" type="text/css" />

         
                  <link rel="stylesheet" href="<%=request.getContextPath()%>/jqwidgets/styles/jqx.darkblue.css" type="text/css" />
                  
                  <link rel="stylesheet" href="<%=request.getContextPath()%>/mystyle.css" type="text/css" />

    <script type="text/javascript" src="<%=request.getContextPath()%>/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jqwidgets/jqxtabs.js"></script>
    
        <script type="text/javascript">
            $(document).ready(function () {
                var theme = 'energyblue';//getTheme();
                // Create a jqxMenu
                
                $("#input_tabs").jqxTabs({ position: 'top', width: '1200px', height: '1000px' , theme: theme, reorder: true });
                $(".accordion").accordion({ autoHeight: true , clearStyle: true  });
                $("#b").jqxButton({ width: '500px', height: '30px', theme: theme });
                $(".name_button").jqxButton({ width: '450', height: '40', theme: 'darkblue' });
                $('.jqxTabs').jqxTabs({ position: 'top', width: '1000px', height: '700px' , theme: theme, reorder: true });
                //$("#jqxMenu").css('margin-left', '40px');

               

            });
        </script>
        
        
        