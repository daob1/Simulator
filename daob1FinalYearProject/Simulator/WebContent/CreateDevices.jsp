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
							type="text" class="form-control" name="location_description"
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
	 var DeviceCount = 1;
     
	 function add_fields() {
	         DeviceCount++; 
	         var deviceForm =document.getElementById("device_form");
	         var deviceFields =document.getElementById("device_fields");
	         var t=document.createTextNode("Device Count :" + DeviceCount);
	         var newdeviceFields=deviceForm.cloneNode(true);
	         var removeBtnDiv = document.createElement("div");
	         var removeBtn = removeBtnDiv.innerHTML='<button type="button" class="btn btn-warning" onclick="this.parentNode.parentNode.remove(this.parentNode);"> Remove this device </button>';
	         t.innerHTML=("Device number:");
	         newdeviceFields.insertBefore(removeBtnDiv, newdeviceFields.firstChild);  /* this fails */ 
	         newdeviceFields.insertBefore(t, newdeviceFields.firstChild);
	         deviceFields.appendChild(newdeviceFields);  
		}
 </script>
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

	
</body>
</html>