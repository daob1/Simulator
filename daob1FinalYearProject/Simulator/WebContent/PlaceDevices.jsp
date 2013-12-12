<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

<!-- Bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<link rel="stylesheet" type="text/css"
    href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css"/>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>


<title>Place Devices</title>
</head>
<body>
	
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<h2>Place Devices</h2>
				
				<span id="resizeDiv" class="label label-primary">
				Drag me around
				</span>


				<div class="btn-group">
					<a href="CreateDevices.jsp" type="button" class="btn btn-info ">Previous Step</a>
					<a href="ConfigureRules.jsp" type="button" class="btn btn-success ">Configure Rules</a> 
			    </div>
			</div>






			<div class="col-md-9">
				<div class="row">
					<canvas id="myCanvas" width="800" height="600"> Your
					browser does not support the HTML5 canvas tag. </canvas>
				</div>
				
				<div class="row">
					<div class="col-md-2">
						<div class="panel panel-success">
							<div class="panel-heading">
								<h3>
									Step 1<span class="glyphicon glyphicon-list-alt"></span>
								</h3>
							</div>

							<div class="panel-body">
								<p>Create the devices in the environment.</p>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3>
									Step 2<span class="glyphicon glyphicon-th-large"></span>
								</h3>
							</div>

							<div class="panel-body">
								<p>Place the devices in the environment.</p>
							</div>
						</div>
					</div>


					<div class="col-md-2">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>
									Step 3<span class="glyphicon glyphicon-wrench"></span>
								</h3>
							</div>
							<div class="panel-body">
								<p>Configure rules upon the devices.</p>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>
									Step 4<span class="glyphicon glyphicon-user"></span>
								</h3>
							</div>
							<div class="panel-body">
								<p>Run a simulation.</p>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>
									Step 5<span class="glyphicon glyphicon-tasks"></span>
								</h3>
							</div>
							<div class="panel-body">
								<p>Results and statistics.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


<script>

	$(document)
			.ready(
					function() {
						//Canvas stuff
						var canvas = $("#myCanvas")[0];
						var ctx = canvas.getContext("2d");
						var w = $("#myCanvas").width();
						var h = $("#myCanvas").height();
						ctx.globalAlpha = 0.5;
						var img = new Image();
						img.src = 'Images/EmptyRoom1.png';
						img.onload = function() {
							ctx.drawImage(img, 0, 0, w, h);
						};
					});

	/* var canvas = document.getElementById('myCanvas');
	var context = canvas.getContext('2d'); */
	/* context.globalAlpha = 0.5;
	var imageObj = new Image();

	imageObj.onload = function() {
		context.drawImage(imageObj, 0, 0, 800, 600);
	}; */
	/*  imageObj.src = 'http://cs1.ucc.ie/~daob1/FourthYearProject/daob1FinalYearProject/Simulator/WebContent/Images/EmptyRoom1.png'; 
	 */
</script>
<script>
 		
		
		$(function() {
			$('#resizeDiv')
		    .draggable()
		    .resizable();
        });
		
</script>


	
</body> 
	</html>