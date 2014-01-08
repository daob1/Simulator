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
<script src="http://cs1.ucc.ie/~daob1/FourthYearProject/daob1FinalYearProject/Simulator/WebContent/js/bootstrap.js"></script>
<script src="http://cs1.ucc.ie/~daob1/FourthYearProject/daob1FinalYearProject/Simulator/WebContent/js/DeclanLib.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div data-spy="scroll" data-target="#">
					<h2>Create Devices</h2>

					<form class="form-group">

						<label for="inhabitant_name"> Residents Name </label> <input
							type="text" class="form-control" id="inhabitant_name" name="inhabitant_name"
							maxlength="25"></input> <label for="care_plan">Care Plan
						</label> <input type="text" class="form-control" id="care_plan" name="care_plan"
							maxlength="200" /> <label for="comment"> Comment </label> <input
							type="text" class="form-control" id="comment" name="comment" maxlength="200" />
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
						<form class="form-group device_forms" id="device_form">
							    <label for="device_description" >Device Description</label> 
							    <input type="text" class="form-control devform devformdesc" name="device_description"/> 
								<label for="device_units">Device Units or State</label>

								
									<select id="dropdown" class="btn btn-default btn-block dropdown-toggle devform devformunit"
										name="dropdown" onchange="decision(this)">
										<option selected disabled>Please Choose</option>
										<option value="ON/OFF">ON/OFF</option>
										<option value="Active/InActive">Active/InActive</option>
										<option value="Numerical">Numerical</option>
										<option value="Custom">Custom</option>
									</select>  
									<label>Initial Value</label>
								     <div>
								     <input  name="initalValue" class="btn btn-default btn-block dropdown-toggle devform devformval"/>
								     
								     </div>

							</form>
                        </div>
					</div>
					
                 <div class="form-group">
                 <label>Load a data set</label>
						<input type="file" class="form-control" placeholder="Load a data set"></input>
				</div> 
				
				<div class="btn-group">
					<a href="Information.html" type="button" class="btn btn-info ">Back to Information</a> 
					<a href="PlaceDevices.jsp" type="button" class="btn btn-success " >Done</a>
					<!-- <input type="file"><button name="Load_a_data_set" class="btn btn-info">Load a data set</button></input> -->
				</div>
				<div class="btn-group">
				<a type="button" class="btn btn-info" id="save">Save values into Jstorage</a>
				<a type="button" class="btn btn-info" id="gatherDevices">GatherDevices</a>
				<a type="button" class="btn btn-info" id="show">show values in Jstorage</a>
				<a type="button" class="btn btn-warning" id="flush">flush values in Jstorage and clear forms</a>
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
       //set the variables so they have scope to be used in many functions
       var DeviceCount ;
       var inhabitant_name ;
       var care_plan ;
       var comment ;
       var location_description;
       var allDevices = new Array(); 
       allDevices = $.jStorage.get("allDevices");
       var EmptyDeviceForm;
       
       

	// this is called to add device fields
	function add_fields() {
		DeviceCount++;
		$.jStorage.set("DeviceCount", DeviceCount);
		var deviceForm = EmptyDeviceForm;
		var deviceFields = document.getElementById("device_fields");
		var t = document.createTextNode("");
		var newdeviceFields = deviceForm.cloneNode(true);
		var removeBtnDiv = document.createElement("div");
		var removeBtn = removeBtnDiv.innerHTML = '<button type="button" class="btn btn-warning removeDevice" onClick="removeDevice(this);"> Remove this device </button>';

		newdeviceFields.insertBefore(removeBtnDiv, newdeviceFields.firstChild);
		newdeviceFields.insertBefore(t, newdeviceFields.firstChild);
		deviceFields.appendChild(newdeviceFields);
	};

	$('#save').click(
			function() {
				$.jStorage.set("inhabitant_name", $("#inhabitant_name").val());
				$.jStorage.set("care_plan", $("#care_plan").val());
				$.jStorage.set("comment", $("#comment").val());
				$.jStorage.set("location_description", $("#location_description").val());
				$.jStorage.set("DeviceCount", DeviceCount);
				/* alert("Have ran the save funstion: "); */
				inhabitant_name = $.jStorage.get("inhabitant_name");
				care_plan = $.jStorage.get("care_plan");
				comment = $.jStorage.get("comment");
				location_description = $.jStorage.get("location_description");
			});

	$("#show").click(
			function() {

				alert("Showing you inhabitant_name: " + $.jStorage.get("inhabitant_name"));
				alert("Showing you care_plan: " + $.jStorage.get("care_plan"));
				alert("Showing you comment: " + $.jStorage.get("comment"));
				alert("Showing you location description: " + $.jStorage.get("location_description"));
				alert("Showing you DeviceCount: " + $.jStorage.get("DeviceCount"));
				
				alertArray = new Array();
		        alertArray = $.jStorage.get("allDevices");
		        alert(JSON.stringify(alertArray));
				
			});

	$("#flush").click(function() {
		//clear JStorage Cashe
		$.jStorage.flush();
		//clear forms
		$('form').each(function() {
			this.reset();
		});
		//reset device count
		DeviceCount = 1;
		//remove all devices
		$(".removeDevice").parent().parent().fadeOut(400, function() {
			$(this).remove();
			$.jStorage.set("DeviceCount", DeviceCount);
		});
	});

	function removeDevice(btn) {
		$(btn).parent().parent().fadeOut(400, function() {
			$(btn).parent().parent().remove();
			DeviceCount--;
			$.jStorage.set("DeviceCount", DeviceCount);
		});
	};

	function decision(objDropDown) {
		var Unit = objDropDown.value;
		if (Unit == "ON/OFF") {
			objDropDown.nextSibling.nextSibling.nextSibling.nextSibling.innerHTML = ('<select name="initalValue" class="btn btn-default dropdown-toggle devformval"><option value="ON" selected >ON</option><option value="OFF">OFF</option> </select>');
		} else if (Unit == "Active/InActive") {
			objDropDown.nextSibling.nextSibling.nextSibling.nextSibling.innerHTML = ('<select name="initalValue" class="btn btn-default dropdown-toggle devformval"><option value="Active" selected >Active</option><option value="Inactive">Inactive</option> </select>');
		} else if (Unit == "Numerical") {
			objDropDown.nextSibling.nextSibling.nextSibling.nextSibling.innerHTML = ('<input name="initalValue" class="devformval" type="number"/>');
		} else if (Unit == "Custom") {
			objDropDown.nextSibling.nextSibling.nextSibling.nextSibling.innerHTML = ('<input name="initalValue" class="devformval" placeholder="Any State" type="text"/>');
		}
	};

	/* //device object constructor //this is now in DeclanLib.js 
	function device(deviceID,deviceDescription,deviceUnit,deviceInitialValue)
	{
	this.deviceID=deviceID;
	this.deviceDescription=deviceDescription;
	this.deviceUnit=deviceUnit;
	this.deviceInitialValue=deviceInitialValue;
	
	this.show=show;
	  function show()
	  {
	     alert("ID: " + this.deviceID + ". Desciption: " + this.deviceDescription + ". Unit: " + this.deviceUnit + ". InitialValue: " + this.deviceInitialValue);
	  }
	} */

	$("#gatherDevices")
			.click(
					function() {
						//this happens as the user leaves the page
						var tempDevices = new Array(); 
						var devDescription;
						var devUnit;
						var devInitialValue;
						/*  need to count using Device Count and not just .class count because html may be kept depending on the browser. */
						for (i = 0; i < (DeviceCount); i++) {
							devDescription = document
									.getElementsByClassName("device_forms")[i]
									.getElementsByTagName("input")[0].value;
							devUnit = document
									.getElementsByClassName("device_forms")[i]
									.getElementsByTagName("select")[0].value;
							devInitialValue = document
									.getElementsByName("initalValue")[i].value;
							if ((devDescription == undefined || devDescription == "")
									|| devInitialValue == "Please Choose"
									|| devUnit == "Please Choose") {
								alert("Please fill in all devices created");
								break;
							}
							tempDevices[i] = new device(i, devDescription, devUnit, devInitialValue);
							//allDevices[i].show();
							//alert("THis is the deviceID : " + allDevices[i].deviceID); 
							//alert(JSON.stringify(allDevices));
							$.jStorage.set("allDevices", tempDevices);
							//I can get its attributes but not its methods?
							//this may be an issue , because I should just get array in Jstorage put into a variable, make change to it and then when i want to add to that jstorage varibale which is not very often but I will just replace the old array under the same key*/ 
						}
					});
	
	$(document).ready(function() {
	    //first set empty device form to allow adding blank device forms
	    EmptyDeviceForm = document.getElementsByClassName("device_forms")[0].cloneNode(true);
	    //get data from JStorage if it exists already (.ie has filled it in before)
	    // fill in general information about the smart home
		inhabitant_name = $.jStorage.get("inhabitant_name");
		care_plan = $.jStorage.get("care_plan");
		comment = $.jStorage.get("comment");
		location_description = $.jStorage.get("location_description");
		
	});
   
 $(document).ready(function() {
				//fill in the forms
				document.getElementById("inhabitant_name").value = $.jStorage.get("inhabitant_name");
				document.getElementById("care_plan").value = $.jStorage.get("care_plan");
				document.getElementById("comment").value = $.jStorage.get("comment");
				document.getElementById("location_description").value = $.jStorage.get("location_description");
				DeviceCount = $.jStorage.get("DeviceCount");
				//if device count is over 1 , ie it has been filled in before the we fill in additional device
				
				    for(i = 0; i < (allDevices.length); i++){
				    	if (i != 0){
				    	 var deviceForm = EmptyDeviceForm;
						    var deviceFields = document.getElementById("device_fields");
						    var t = document.createTextNode("");
						    var newdeviceFields = deviceForm.cloneNode(true);
						    var removeBtnDiv = document.createElement("div");
						    var removeBtn = removeBtnDiv.innerHTML = '<button type="button" class="btn btn-warning removeDevice" onClick="removeDevice(this);"> Remove this device </button>';

				    	newdeviceFields.insertBefore(removeBtnDiv, newdeviceFields.firstChild);
					    newdeviceFields.insertBefore(t, newdeviceFields.firstChild);
				    	deviceFields.appendChild(newdeviceFields);
				    	}
				    	/* //get the forms by class and fill them appropiately */
				    	$( ".devformdesc" )[i].value = allDevices[i].deviceDescription;
				    	$( ".devformunit" )[i].value = allDevices[i].deviceUnit;
				    	$( ".devformval" )[i].value = allDevices[i].deviceInitialValue;
				    }
				
			});

//Canvas has a background image to help
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
	
</script>


	
</body>
</html>