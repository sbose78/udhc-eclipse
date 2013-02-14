<html>                                                                  
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <script type="text/javascript" src="<%=request.getContextPath()%>/INPUT/js/jquery-1.8.3.min.js"></script>
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
 <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>

<! Google Transliterate >


<script type="text/javascript" src="https://www.google.com/jsapi"></script>


<script type="text/javascript">

    

	//alert("executed");
    </script>

<! end of Google transliterate API >


	        <script type="text/javascript">                                         


					
					// Load the Google Transliterate API
					   google.load("elements", "1", {
				            packages: "transliteration"
                    });
					 
					   google.setOnLoadCallback(onLoad);

				      function onLoad() {
				        var options = {
				            sourceLanguage:
				                google.elements.transliteration.LanguageCode.ENGLISH,
				            destinationLanguage:
				                [google.elements.transliteration.LanguageCode.BENGALI],
				            shortcutKey: 'ctrl+y',
				            transliterationEnabled: true
				        };

				        // Create an instance on TransliterationControl with the required
				        // options.
				        var control =
				            new google.elements.transliteration.TransliterationControl(options);

				        // Enable transliteration in the textbox with id
				        // 'transliterateTextarea'.
				        control.makeTransliteratable(['narrative_local']);
				      }
				     


			 </script>                                                               
        </head>                                                                 
	<body align="center"> 

									<label>Write in Bengali [ Press ctrl+y to toggle English and Bengali ]</label>
									
									<br>

									<div id="narrative_div_local">
								
				<textarea rows="20" cols="80" id="narrative_local" name="narrative_local">
									</textarea>
									</div>
									<p>
										<input type="submit" value="submit narrative">
									</p>
							


	</body>                                                                 
</html>
