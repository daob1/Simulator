<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Create Devices</title>
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
					<div class="btn-group">
						<a href="Information.html" type="button" class="btn btn-lg btn-info "><span class="glyphicon glyphicon-chevron-left"></span>Information</a> 
						<button id="Done" type="submit" class="btn btn-lg btn-success " value="Done" >Done<span class="glyphicon glyphicon-chevron-right"></span></button>
					</div>
					<form class="form-group">

						<label for="inhabitant_name"> Residents Name </label> 
						<input type="text" class="form-control" id="inhabitant_name" name="inhabitant_name"
							maxlength="25" /> 
							<label for="care_plan">Care Plan </label> 
							<input type="text" class="form-control" id="care_plan" name="care_plan" maxlength="200" /> 
							<label for="comment"> Comment </label> 
							<input type="text" class="form-control" id="comment" name="comment" maxlength="200" />
						    <label for="location_description">Location Description </label>
						    <input type="text" class="form-control" id="location_description" name="location_description" maxlength="25" />
					</form>
					<div>
						<button id="more_fields" onclick="add_fields()" type="button"
							class="btn btn-info btn-block">Add another device</button>
					</div>

					<div id="device_fields">
                        <div>
						<form class="form-group device_forms" id="device_form">
							    <label for="device_description" >Device Description</label> 
							    <input type="text" class="form-control devform devformdesc" name="device_description" required/> 
								<label for="device_units">Device Units or State</label>

								
									<select id="dropdown" class="btn btn-default btn-block dropdown-toggle devform devformunit"
										name="dropdown" onchange="decision(this)">
										<option selected disabled>Please Choose</option>
										<option value="ON/OFF">ON/OFF</option>
										<option value="Active/InActive">Active/InActive</option>
										<option disabled >You Can Add Enumerations</option>
										
									</select>  
									<label>Initial Value</label>
								     <div>
								     <input  name="initalValue" class="btn btn-default btn-block dropdown-toggle devform devformval required"/>
								     
								     </div>

							</form>
                        </div>
					</div>
					
					
		
		
		<div>
		<form id=EnumForm >  <label>Create an Enumeration (optional)</label>
		 <input type="text" placeholder="Name of Enum" class="btn btn-default btn-block dropdown-toggle" required/>
		 <input type="text" placeholder="Possible Value one" class="btn btn-default btn-block dropdown-toggle" id="firstEnuminput" required/>
		 <input type="text" placeholder="Possible Value two" class="btn btn-default btn-block dropdown-toggle" required/>
		 <input type="text" placeholder="Possible Value three" class="btn btn-default btn-block dropdown-toggle" required/>
		 <div class="btn-group" id="AddAndRemoveButtonDiv"> 
		 <button type="button" id="AddEnumerationInput" class="btn btn-info btn-md"><span class="glyphicon glyphicon-plus"></span>Add Options</button>
		 <button type="button" id="RemoveEnumerationInput" class="btn btn-warning btn-md">Remove Options<span class="glyphicon glyphicon-minus"></span></button>
		 </div>
		 <input value="Create this Enumeration" class="btn btn-info btn-block" type="submit">
		</form>
		</div>	
		         
                 <div>
                 <label>Load Data Set</label>
						<input id="loadFile" type="file" class="form-control" placeholder="Load a data set"></input>
				</div> 
				<label>Remove All Current Data</label>
				<button type="button" class="btn btn-block btn-warning" id="flush"> <span class="glyphicon glyphicon-remove-sign"></span>  Reset </button>
				
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
       var DeviceCount = $.jStorage.get("DeviceCount");
       if (DeviceCount == null){
    	   DeviceCount = 1;
    	   $.jStorage.set("DeviceCount", DeviceCount);
	    }
       var inhabitant_name ;
       var care_plan ;
       var comment ;
       var location_description;
       var allDevices = new Array(); 
      /*  allDevices = $.jStorage.get("allDevices"); */
       var EmptyDeviceForm;
       var inputCopy = $("#firstEnuminput").clone(true).attr("placeholder", "Possible Value");
        

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
		
		// add any enumerations to our device select form
		options = '<option selected disabled>Please Choose</option>'
			+ '<option value="ON/OFF">ON/OFF</option> '
			+ '<option value="Active/InActive">Active/InActive</option>';
		for (var e in  $.jStorage.get("EnumsArray")){
		     name = $.jStorage.get("EnumsArray")[e].EnumName;
		     var options = options + ("<option value=" +  name + " >" + name + " </option>");
	    }
		newdeviceFields[2].innerHTML = options ;
		
		//now we add in the form
		deviceFields.appendChild(newdeviceFields);
	};

	$('#Done').click(
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
				
				//this was gather devices
				//this happens as the user leaves the page
						var tempDevices = new Array(); 
						var devDescription;
						var devUnit;
						var devInitialValue;
						var done = true;
						/*  need to count using Device Count and not just .class count because html may be kept depending on the browser. */
						for (i = 0; i < (DeviceCount); i++) {
							devDescription = (document
									.getElementsByClassName("device_forms")[i]
									.getElementsByTagName("input")[0].value).split(' ').join('_');
							devUnit = (document
									.getElementsByClassName("device_forms")[i]
									.getElementsByTagName("select")[0].value).split(' ').join('_');
							devInitialValue = (document
									.getElementsByName("initalValue")[i].value).split(' ').join('_');
							//the html5 required attribute will not be recognised unless the submit button is clicked in the form
							// so these fields need to be checked here
							if ((devDescription == undefined || devDescription == "")
									|| devInitialValue == "Please Choose" || devInitialValue == "" || devUnit == ""
									|| devUnit == "Please Choose") {
								alert("Please fill in all devices created");
								done = false;
								break;
							}
							//if a device is filled up we add it to our array and put the array in JStorage
							tempDevices[i] = new device(i, devDescription, devUnit, devInitialValue);
							$.jStorage.set("allDevices", tempDevices);
						} //end of for loop
				
				if(done == true){
					window.location = "PlaceDevices.jsp";
				}
			});

	/* $("#show").click(
			function() {

				alert("Showing you inhabitant_name: " + $.jStorage.get("inhabitant_name"));
				alert("Showing you care_plan: " + $.jStorage.get("care_plan"));
				alert("Showing you comment: " + $.jStorage.get("comment"));
				alert("Showing you location description: " + $.jStorage.get("location_description"));
				alert("Showing you DeviceCount: " + $.jStorage.get("DeviceCount"));
				
				alertArray = new Array();
		        alertArray = $.jStorage.get("allDevices");
		        alert(JSON.stringify(alertArray));
				
			}); */

	$("#flush").click(function() {
		//clear JStorage Cashe
		$.jStorage.flush();
		//clear forms
		$('form').each(function() {
			this.reset();
		});
		//reset device count
		DeviceCount = 1;
		$.jStorage.set("allDevices", DeviceCount);
		$.jStorage.set("DeviceCount", DeviceCount);
		$.jStorage.set("AllRules", new Array());
		$.jStorage.set("EnumsArray", new Array());
		//remove all devices
		$(".removeDevice").parent().parent().fadeOut(400, function() {
			$(this).remove();
			$.jStorage.set("DeviceCount", DeviceCount);
		});
		location.reload();
	});
 
	
	
			
	function removeDevice(btn) {
		$(btn).parent().parent().slideUp(400, function() {
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
		} else {  /* Unit is an enum */
			var ArrayOfEnums = $.jStorage.get("EnumsArray");
			var options;
			for (var e in  ArrayOfEnums){
				if (Unit == $.trim( ArrayOfEnums[e].EnumName )){
					var values = ArrayOfEnums[e].EnumValues;
					for ( var v in values){
					   var value = $.jStorage.get("EnumsArray")[e].EnumValues[v];
				       options = options + ("<option value='" +  value.split(' ').join('_') + "' >" + value + " </option>");
					}
				}
		    }
			objDropDown.nextSibling.nextSibling.nextSibling.nextSibling.innerHTML = '<select name="initalValue" class="btn btn-default dropdown-toggle devformval"> '
			+ options + '</select>'; 
		}
	}; 


	//Canvas has a background image to help visualise
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
	
	
	$("#EnumForm").on("submit", function (e) {
		//so the page is not reloaded
	    e.preventDefault();
		
	    var EnumsArray = $.jStorage.get("EnumsArray");
	    if (EnumsArray == null){
	    	EnumsArray = [];
	    }
		
		var Enumname = (this[0].value).split(' ').join('_');
		var EnumVals = new Array();
		// we minus 3 here to take into account the submit input, addd options button and remove option button 
		for (var x = 1; x < this.length - 3; x++){ 
			EnumVals.push((this[x].value).split(' ').join('_'));
		}
		var Enumer = new enumeration( Enumname, EnumVals );
		EnumsArray.push(Enumer);
		$.jStorage.set("EnumsArray", EnumsArray);
		//alert(JSON.stringify($.jStorage.get("EnumsArray")));
		
		var NewOptionName = EnumsArray[EnumsArray.length-1].EnumName;
		var NewOption =  "<option value='" +  NewOptionName.split(' ').join('_')  + "' >" + NewOptionName.split(' ').join('_') + " </option>";
		
		$(".devformunit").append( NewOption );
		$("#EnumForm").trigger('reset');
		
	});
	
	$(document).ready(function() {
		    var EnumsArray = $.jStorage.get("EnumsArray");
		    if (EnumsArray == null){
		    	EnumsArray = [];
		    }
		
		    for (var e in  EnumsArray){
			     name = $.jStorage.get("EnumsArray")[e].EnumName;
			     $(".devformunit").append("<option value='" +  name.split(' ').join('_') + "' >" + name.split(' ').join('_') + " </option>");
		    }
	}); 
	
	$("#AddEnumerationInput").on("click", function(){
			$("#AddAndRemoveButtonDiv").before( inputCopy.clone(true).attr("placeholder", "Possible Value"));
	});
	
	$("#RemoveEnumerationInput").on("click", function(){
		var optionCount = $("#EnumForm input").length -2 ;
		if( optionCount > 3 ){
			 $( "#EnumForm input:eq("+ optionCount +")").slideUp(400, function() {
					$(this).remove();
			 });
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
		
		        allDevices = $.jStorage.get("allDevices"); 
				//fill in the forms
				document.getElementById("inhabitant_name").value = $.jStorage.get("inhabitant_name");
				document.getElementById("care_plan").value = $.jStorage.get("care_plan");
				document.getElementById("comment").value = $.jStorage.get("comment");
				document.getElementById("location_description").value = $.jStorage.get("location_description");
				DeviceCount = $.jStorage.get("DeviceCount");
				//if device count is over 1 , ie it has been filled in before the we fill in additional device
				
				    for(i = 0; i < (DeviceCount); i++){
				    	if (i != 0){ //this is so the first form is used
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
	 
	
	
	
</script>


	
</body>
</html>