<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
	<jsp:directive.page language="java"
		contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" />
	<jsp:text>
		<![CDATA[ <?xml version="1.0" encoding="ISO-8859-1" ?> ]]>
	</jsp:text>
	<jsp:text>
		<![CDATA[ <!DOCTYPE html> ]]>
	</jsp:text>
	<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script>
	var DeviceCount = 1;
function add_fields() {
	DeviceCount++
	var deviceForms =document.getElementById("device_fields").firstChild;
	var cln=deviceForms.cloneNode(true);
	deviceForms.parentNode.appendChild(cln);
	
		}
	</script>
<title>Create Devices</title>

<!-- Bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>


</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div data-spy="scroll" data-target="#">
				    <h2>Create Devices</h2>
				    
					<form class="form-group" role="form">

						<label for="inhabitant_name"> Patient Name </label> <input
							type="text" class="form-control" name="inhabitant_name" maxlength="25"></input> <label
							for="care_plan">Care Plan </label> <input type="text"
							class="form-control" name="care_plan" maxlength="200"/> <label for="comment">
							Comment </label> <input type="text" class="form-control" name="comment" maxlength="200"/>
						<label for="location_description">Location Description </label> <input
							type="text" class="form-control" name="location_description" maxlength="25"/>

					</form>
					<div>
						<button id="more_fields" onclick="add_fields()" type="button" class="btn btn-info btn-block">Add another
							device</button>
					</div>
					
                    <div id="device_fields">
                   
					<form class="form-group" role="form">
						<label for="device_description">Device description</label> <input
							type="text" class="form-control" name="device_description" /> <label
							for="device_units">Device units</label> <input type="text"
							class="form-control" name="device_units" /> <label
							for="initial_value">Initial Value</label> <input type="text"
							class="form-control" name="initial_value" />
					</form>
					
					</div>
					
				</div>
				<div class="btn-group">
					<a href="PlaceDevices.jsp" type="button" class="btn btn-success " value="Done">Done</a>
					<button type="button" class="btn btn-info" >Load a data set</button>
				</div>
			</div>
			<div class="col-md-9">
				<div class="row">
					<canvas id="myCanvas" width="800" height="600"
						style="border:1px solid #c3c3c3;"> Your browser does not
					support the HTML5 canvas tag. </canvas>
				</div>
				<script>
						var canvas = document.getElementById('myCanvas');
						var context = canvas.getContext('2d');
						context.globalAlpha = 0.5;
						var imageObj = new Image();

						imageObj.onload = function() {
							context.drawImage(imageObj, 0, 0, 800, 600);
						};
						 imageObj.src = 'http://cs1.ucc.ie/~daob1/FourthYearProject/daob1FinalYearProject/Simulator/WebContent/Images/EmptyRoom1.png'; 
						
	            </script>
				<div class="row">
					<div class="col-md-2">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3>Step 1<span class="glyphicon glyphicon-list-alt"></span></h3>
							</div>

							<div class="panel-body">
								<p>Create the devices in the environment.</p>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>Step 2<span class="glyphicon glyphicon-th-large"></span></h3>
							</div>

							<div class="panel-body">
								<p>Place the devices in the environment.</p>
							</div>
						</div>
					</div>


					<div class="col-md-2">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>Step 3<span class="glyphicon glyphicon-wrench"></span>
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
								<h3>Step 4<span class="glyphicon glyphicon-user"></span>
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
								<h3>Step 5<span class="glyphicon glyphicon-tasks"></span>
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

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
</body>
	</html>
</jsp:root>