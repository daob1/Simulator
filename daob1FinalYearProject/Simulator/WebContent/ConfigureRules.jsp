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
			<h2>Configure Rules</h2>

				
				<div>
					<button type="button" id="add_rule_form_btn"
						class="btn btn-info btn-block">Add a rule</button>
				</div>

				<div id="rule_fields">

					<form class="form-group rule_form">
						<label for="device_description">Rule Description</label>
						 <input type="text" class="form-control"  ></input>
						 
						 <button type="button" class="btn btn-info add_rule_device_form_btn"> Add a triggering device 
						 </button>
						 <fieldset class="triggerDeviceFieldset">
						    <label >Select operation on this device
						    </label>
						    <select class="btn btn-default btn-block dropdown-toggle ruleData">
								<option value="AND">AND</option>
								<option value="NOT">NOT</option>
							</select> 
							<label >Select Device
							</label>
						    <select class="btn btn-default btn-block dropdown-toggle devSelect ruleData">
						        <option value="" selected disabled >Device </option>
						    <!-- for each device output an option for it here -->
						    </select>
						    <span></span>
						 </fieldset >
						 <button type="button" class="btn btn-info add_affected_device_form_btn"> Add an affected device 
						 </button>
						 <fieldset class="affectedDeviceFieldset" >
					    <label >Select Device</label>
					    <select class="btn btn-default btn-block dropdown-toggle devSelect ruleData">
						<option value="" selected disabled > Device </option>
						<!-- for each device output an option for it here -->
						</select>
						<span></span> 
						</fieldset>
						<button type="button"
						class="btn btn-warning btn-block remove_rule_form_btn">Remove this rule</button>
					</form>
				</div>
				<div class="btn-group">
					<a href="PlaceDevices.jsp" type="button" class="btn btn-info ">Previous Step</a>
					<a href="Information.html" type="button" class="btn btn-success ">Done</a> 
					<button type="button" id="show">Show JstorageVariables</button>
					<button type="button" id="save">Save into JstorageVariables</button>
			    </div>
				




			</div>
			
			<div class="col-md-9">
				<div class="row">
					<canvas id="myCanvas" width="800" height="600"> Your
					browser does not support the HTML5 canvas tag. </canvas>
				</div>
				
				<div id="outOfTheWay" class="row">
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
						<div class="panel panel-success">
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
						<div class="panel panel-primary">
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
var devArray = new Array();
devArray = $.jStorage.get("allDevices");
$(document).on("ready", $(".devSelect"),  function() {
	//alert("triggerDeviceFieldset has been loaded");
	for (i=0;i<devArray.length;i++)
    { 
		$(".devSelect").append("<option value=" + devArray[i].deviceID + "> " + devArray[i].deviceDescription + "</option>");
    }
	
var RuleCount = $.jStorage.get("RuleCount");
var RuleForm = $(".rule_form:eq(0)").clone(true);
var DeviceSelectionForm = $(".triggerDeviceFieldset:eq(0)").clone(true);
var affectedDeviceFieldset = $(".affectedDeviceFieldset:eq(0)").clone(true);

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
	
	//keep showing the device in their positions
	var canvasposition = $("#myCanvas").offset();
	deviceArray = new Array();
	deviceArray = $.jStorage.get("allDevices");
	for (i=0;i<deviceArray.length;i++)
    { 
	var topPosition =  deviceArray[i].devicePositionTop + canvasposition.top;
	var leftPosition = deviceArray[i].devicePositionLeft + canvasposition.left;
	
  	$('#outOfTheWay').append('<div class="devices btn btn-primary btn-md">' + deviceArray[i].deviceDescription + '<br/> State: ' + deviceArray[i].deviceInitialValue + '</div>');
  	$(".devices:eq(" + i + ")").offset({ top: topPosition, left: leftPosition});
    }
 
	$("#show").on("click", function(){
		alert($.jStorage.get("RuleCount"));
		
	});


	$("#save").on("click", function(){
		ruleCount = $.jStorage.get("RuleCount");
		RulesComplete = true;
		var ruleDescription;
		var RuleTriggerDeviceOperator; 
		var RuleTriggerDevice;
		var RuleTriggerDeviceState;
		var triggerDevices = new Array;
		var RuleAffectedDevice;
		var RuleAffectedDeviceState;
		for(i = 0; i < ruleCount; i++ ){
			ruleDescription = $(".rule_form:eq(" + i + ") input").val();
			$(".rule_form:eq(" + i + ")").find(".triggerDeviceFieldset").each(function(){
				//each trigger device detail needs to be gathered, ie its operation, the device, and state
				RuleTriggerDeviceOperator = ( $( this ).find( '.ruleData:eq(0)' ).val());
				if ( typeof $( this ).find( '.ruleData:eq(1)' ).val() == "undefined" || $( this ).find( '.ruleData:eq(1)' ).val() == null
						|| $( this ).find( '.ruleData:eq(2)' ).val() == "") {
					alert("Please give devices in rules a specified state to continue");
					RulesComplete = false;
				} 
				RuleTriggerDevice = ( $( this ).find( '.ruleData:eq(1)' ).val());
				RuleTriggerDeviceState = ( $( this ).find( '.ruleData:eq(2)' ).val());
			});
			$(".rule_form:eq(" + i + ")").find(".affectedDeviceFieldset").each(function(){
				//each affect device detail needs to be gathered ie the device and its new state
				if ( typeof $( this ).find( '.ruleData:eq(0)' ).val() == "undefined" || $( this ).find( '.ruleData:eq(0)' ).val() == null
					    || $( this ).find( '.ruleData:eq(1)' ).val() == "") {
					alert("Please give devices in rules a specified state to continue");
					RulesComplete = false;
				} 
				RuleAffectedDevice = ( $( this ).find( '.ruleData:eq(0)' ).val());
				RuleAffectedDeviceState = ( $( this ).find( '.ruleData:eq(1)' ).val());
			});
			//put rule Id and description into array as keys
			
			
			
			
		}
	});
	
	
	
});

$("#add_rule_form_btn").on("click", function() {
	$("#rule_fields").append(RuleForm.clone(true));
	if(typeof RuleCount === 'undefined'){
		RuleCount = 1;
	}
	RuleCount++;
	$.jStorage.set("RuleCount", RuleCount);
});

$(document).on("click", ".add_rule_device_form_btn",function() {
	DeviceSelectionForm.clone(true).insertAfter($(this));
});

$(document).on("click", ".add_affected_device_form_btn",function() {
	affectedDeviceFieldset.clone(true).insertAfter($(this));
});

$(document).on("click", ".remove_rule_form_btn", function(){
	$(this).parent().fadeOut(400, function() {
		$(this).remove();
	    RuleCount--;
	    $.jStorage.set("RuleCount", RuleCount);
	});
});

$(document).on("change", (".devSelect"),  function() {
	//get the units of this device
	 var Unit = devArray[this.value].deviceUnit;
	//now only give the options that are available with that measure unit
		if (Unit == "ON/OFF") {
			$(this).next().html('<select name="initalValue" class="btn btn-default dropdown-toggle devformval ruleData"><option value="ON" selected >ON</option><option value="OFF">OFF</option> </select>');
		} else if (Unit == "Active/InActive") {
			$(this).next().html('<select name="initalValue" class="btn btn-default dropdown-toggle devformval ruleData"><option value="Active" selected >Active</option><option value="Inactive">Inactive</option> </select>');
		} else if (Unit == "Numerical") {
			$(this).next().html('<input name="initalValue" class="devformval ruleData" type="number"/>');
		} else if (Unit == "Custom") {
			$(this).next().html('<input name="initalValue" class="devformval ruleData" placeholder="Any State" type="text"/>');
		}
    }); 
    
$(document).ready(function() {
	var RuleCount = $.jStorage.get("RuleCount");
	for(i=0; i< RuleCount; i++){
		//$("#rule_fields").after(RuleForm.clone(true));
	}
	});
     

});

</script>
</body>
</html>
