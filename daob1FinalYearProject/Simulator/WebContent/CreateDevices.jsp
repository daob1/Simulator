<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

<!-- Bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
 <!--  Load in JStorage -->
<script src="http://cs1.ucc.ie/~daob1/FourthYearProject/daob1FinalYearProject/Simulator/WebContent/js/jStorage-master/jstorage.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div data-spy="scroll" data-target="#">
					<h2>Create Devices</h2>

					<form class="form-group">

						<label for="inhabitant_name"> Patient Name </label> <input
							type="text" class="form-control" name="inhabitant_name"
							maxlength="25"></input> <label for="care_plan">Care Plan
						</label> <input type="text" class="form-control" name="care_plan"
							maxlength="200" /> <label for="comment"> Comment </label> <input
							type="text" class="form-control" name="comment" maxlength="200" />
						<label for="location_description">Location Description </label> <input
							type="text" class="form-control" id="location_description" name="location_description"
							maxlength="25" />

					</form>
					<div>
						<button id="more_fields" onclick="add_fields()" type="button"
							class="btn btn-info btn-block">Add another device</button>
					</div>

					<div id="device_fields">
                        <div>
						<form class="form-group" id="device_form">
							    <label for="device_description">Device Description</label> 
							    <input type="text" class="form-control" name="device_description" /> 
								<label for="device_units">Device Units</label>
							<div class="input-group">
								<div class="input-group-btn">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown">
										On/Off <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#">On/Off</a>
										</li>
										<li><a href="#">Active/InActive</a>
										</li>
										<li><a href="#">Numerical</a>
										</li>
										<li><a href="#">Custom</a></li>
									</ul>
								</div><!-- /btn-group -->
								<input type="text" class="form-control" name="device_units"/>
							</div><!-- /input-group -->
							
								<label for="initial_value">Initial Value</label> 
								<input type="text" class="form-control" name="initial_value" />
						</form>
                        </div>
					</div>
					
                 <div class="form-group">
            <!--      <legend>Load a data set</legend> -->
						<input type="file" class="form-control" placeholder="Load a data set"></input>
				</div> 
				
				<div class="btn-group">
					<a href="Information.html" type="button" class="btn btn-info ">Back to Information</a> 
					<a href="PlaceDevices.jsp" type="button" class="btn btn-success " >Done</a>
					<!-- <input type="file"><button name="Load_a_data_set" class="btn btn-info">Load a data set</button></input> -->
				</div>
				<div id="save">Save</div>
				<div id="show">show</div>
			     </div>
			     
			</div>
			<div class="col-md-9">
				<div class="row">
					<canvas id="myCanvas" width="800" height="600"> Your browser does not
					support the HTML5 canvas tag. </canvas>
				</div>
				
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
<script>

	$(document).ready(function() {
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

	var DeviceCount = 1;

	function add_fields() {
		DeviceCount++;
		var deviceForm = document.getElementById("device_form");
		var deviceFields = document.getElementById("device_fields");
		var t = document.createTextNode("Device number :" + DeviceCount);
		var newdeviceFields = deviceForm.cloneNode(true);
		var removeBtnDiv = document.createElement("div");
		var removeBtn = removeBtnDiv.innerHTML = '<button type="button" class="btn btn-warning" onclick="this.parentNode.parentNode.remove(this.parentNode);"> Remove this device </button>';
		
		newdeviceFields.insertBefore(removeBtnDiv, newdeviceFields.firstChild); 
		newdeviceFields.insertBefore(t, newdeviceFields.firstChild);
		deviceFields.appendChild(newdeviceFields);
	};

	$('#save').click(function() {
		$.jStorage.set("key", $("#location_description").val());
	});

	$("#show").click(function() {
		var input_value = $.jStorage.get("key");
		alert("Showing you location description: " + input_value);
	});
</script>


	
</body>
</html>