<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/bootstrap.min.css" rel="stylesheet"></link>



<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

</head>
<body>
	<h2>Tester Page</h2>
	<div class="container">
		<div id="draggable">
			<h3>Drag me around</h3>
		</div>
		<p>If you click on me, I will disappear.</p>
		<p>Click me away!</p>
	</div>

	<p>Click me too!</p>
<%= "Hello World!" %>
	
<script>
		 $(document).ready(function() {

			$("div").css("border", "3px solid red");

		});  

 		$(document).ready(function() {
			$("p").click(function() {
				$(this).hide();
			});
		}); 
		
		$(function() {
            $( "#draggable" ).draggable();
        });
</script>
	
</body>
</html>