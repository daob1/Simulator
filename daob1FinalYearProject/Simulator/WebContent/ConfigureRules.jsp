<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Configure Rules</title>
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

				<div class="btn-group">
					<a href="PlaceDevices.jsp" type="button" class="btn btn-lg btn-info "><span class="glyphicon glyphicon-chevron-left"></span>Previous Step</a>
					<a id="goToSimulation" type="button" class="btn btn-lg btn-success ">Done<span class="glyphicon glyphicon-chevron-right"></span></a> 
			    </div>
				<div>
					<button type="button" id="add_rule_form_btn"
						class="btn btn-info btn-block">Add a rule</button>
				</div>

				<div id="rule_fields">

					<form class="form-group rule_form">
						<label for="device_description">Rule Description</label>
						<input type="text" class="form-control desc"  ></input>
						<fieldset class="triggerDeviceFieldset">
						<div class="operationSelectiondiv">
						    <label >Select Operation</label>
						    <select class="btn btn-default btn-block dropdown-toggle ruleData originallyhidden">
								<option value="AND">AND</option>
								<option value="NOT">NOT</option>  
						    </select> 
						</div>
						<div class="deviceSelectiondiv">
						<label >Select Device</label>
					       <select class="btn btn-default btn-block dropdown-toggle devSelect ruleData">
						      <option value="" selected disabled > Device </option>
						      <!-- for each device output an option for it here -->
						   </select>
						   <div></div>
						</div>
						    <button type="button" class="btn btn-info add_rule_device_form_btn"> Add Trigger
						     </button>
						    <!--  <button type="button" class="btn btn-info add_rule_operation_form_btn"> Add Operation
						     </button> -->
						</fieldset >
						<button type="button" class="btn btn-info btn-block add_affected_device_form_btn"> Add Affected Device</button>
						<span class="help-block">These device are the outcome.</span>
						<fieldset class="affectedDeviceFieldset" >
						<div class="affectedDevicediv">
					    <label >Select Device</label>
					    <select class="btn btn-default btn-block dropdown-toggle devSelect ruleData">
						<option value="" selected disabled > Device </option>
						<!-- for each device output an option for it here -->
						</select>
						<span></span>
						 </div>
						</fieldset>
						<!-- <button type="button" class="btn btn-warning btn-group hide_toggle_rule_form_btn">Hide/Show rule</button> -->
						<button type="button" class="btn btn-warning btn-group remove_rule_form_btn">Remove rule</button>
					</form>
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
		$(".devSelect").append("<option value=" + devArray[i].deviceID + ":" + devArray[i].deviceDescription + "> " + devArray[i].deviceDescription + "</option>");
    }  
	
var RuleCount = $.jStorage.get("RuleCount");
if (RuleCount == null || RuleCount == 0){
	// the rule count to 1 because there is a default form outputted
	RuleCount = 1;
	   $.jStorage.set("RuleCount", RuleCount);
    }
var RuleForm = $(".rule_form:eq(0)").clone(true);
var emptyDeviceFormSelect = $( "<label >Select Device</label> " + 
"<select class='btn btn-default btn-block dropdown-toggle devSelect ruleData'> " + 
"<option value='' selected disabled >Device </option></select>");
var DeviceSelectionForm = $(".affectedDevicediv:eq(0)").clone(true);
$(DeviceSelectionForm).attr( "class", "deviceSelectiondiv" );
var affectedDevicediv = $(".affectedDevicediv:eq(0)").clone(true);
var operationdiv = $(".operationSelectiondiv:eq(0)") ;


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


	$("#goToSimulation").on("click", function(){
		//gather the rule information
		RuleCount = $.jStorage.get("RuleCount");
		RulesComplete = true;
		var ruleDescription;
		var CurrentRuleTriggerDeviceOperator; 
		var RuleTriggerDeviceDesc;
		var RuleTriggerDeviceID;
		var RuleTriggerDeviceState;
		var triggerDevices = new Array;
		var RuleAffectedDeviceDesc;
		var RuleAffectedDeviceID;
		var RuleAffectedDeviceState;
		var AllRulesArray = new Array();
		var Triggers = new Array();
		var Outcome = new Array();
		for(i = 0; i < RuleCount; i++ ){
			AllRulesArray[i];
			Triggers = new Array();
			if (RulesComplete == true){
			   // There is only 1 description to take care of for ever rule
			   ruleDescription = $(".rule_form:eq(" + i + ") input").val();
			   $(".rule_form:eq(" + i + ") .triggerDeviceFieldset").find("div").each(function(){
				      // each trigger device detail needs to be gathered, it could be an operation, or a device  where we 
				      // need to gather the device descripton, and state
				
				      //go though the triger field div by div and checkif the div is an operation or a device before gather the info
				      if ( $(this).hasClass( "operationSelectiondiv" )){
				        	// it will be an ADD or a NOT
					        CurrentRuleTriggerDeviceOperator = ( $( this ).find( '.ruleData:eq(0)' ).val());	
				      }else if ($(this).hasClass( "deviceSelectiondiv" )) {
					        //its a device and need to gather device info
					        //first check if the fields are filled in, report error if not
				            if ( ruleDescription == "" || typeof $( this ).find( '.ruleData:eq(0)' ).val() == "undefined" || $( this ).find( '.ruleData:eq(0)' ).val() == null
					             	 || $( this ).find( '.ruleData:eq(1)' ).val() == "" ) {
					             /* alert("Please give devices in rules a specified state to continue"); */
					             RulesComplete = false;
					             return false; // basically a break but in a each loop
				            } else{
					          //each detail is put into an array
				             RuleTriggerDeviceID = (( $( this ).find( '.ruleData:eq(0)' ).val()).split(':')[0]);
				             RuleTriggerDeviceDesc= (( $( this ).find( '.ruleData:eq(0)' ).val()).split(':')[1]);
				             RuleTriggerDeviceState = ( $( this ).find( '.ruleData:eq(1)' ).val());
				             var TriggerDeviceDetailsArray = [ CurrentRuleTriggerDeviceOperator, RuleTriggerDeviceID, RuleTriggerDeviceDesc, RuleTriggerDeviceState ];
                             Triggers.push(TriggerDeviceDetailsArray);
				             // add this TriggerDeviceArray to the array listing of all trigger devices
				            }
				      }
				      
			   });
			   /* alert( JSON.stringify(Triggers) );  */ 
			}
			//re establish the Outcome array variable so Outcomes from previous rules do not get listed in the current rule
			Outcome = new Array();
			if (RulesComplete == true){
			   $(".rule_form:eq(" + i + ") .affectedDeviceFieldset").find("div").each(function(){
				
				//each affect device detail needs to be gathered ie the device and its new state
				    if  ( typeof $( this ).find( '.ruleData:eq(0)' ).val() == "undefined" || $( this ).find( '.ruleData:eq(0)' ).val() == null
					         || $( this ).find( '.ruleData:eq(1)' ).val() == "") {
					    /* alert("Please give devices in rules a specified state to continue"); */
					    RulesComplete = false;
				    } else {
				    	//each detail is put into an array
				        RuleAffectedDeviceID = (( $( this ).find( '.ruleData:eq(0)' ).val()).split(':')[0]);
				        RuleAffectedDeviceDesc = (( $( this ).find( '.ruleData:eq(0)' ).val()).split(':')[1]);
				        RuleAffectedDeviceState = ( $( this ).find( '.ruleData:eq(1)' ).val());
				        var AffectedDeviceDetailsArray = [RuleAffectedDeviceID, RuleAffectedDeviceDesc, RuleAffectedDeviceState];
				        Outcome.push(AffectedDeviceDetailsArray);
				    }
			   });
			 //add in the rule ID, the description , the details for triggers, and the outcomes
				AllRulesArray.push(new rule([i], ruleDescription, Triggers, Outcome));
			}
			/* alert( JSON.stringify(Outcome) ); */
			
		}
		/* alert("THIS IS THE AllRULESARRAY" + JSON.stringify( AllRulesArray )); */
		//if all is ok set the array to the Jstorage and move on to the simulation step
		if (RulesComplete == true){
			 $.jStorage.set("AllRules", AllRulesArray);
			 //alert( JSON.stringify( $.jStorage.get("AllRules") ) );
			 window.location = "Simulation.jsp";
		 } else {
			 alert("Please give devices in rules a specified state to continue");
		 }
		
	});
	
	 
	
});

$("#add_rule_form_btn").on("click", function() {
	$("#rule_fields").append(RuleForm.clone(true));
	RuleCount = $.jStorage.get("RuleCount");
	if(typeof RuleCount === 'undefined'){
		RuleCount = 1;
	}
	RuleCount++;
	$.jStorage.set("RuleCount", RuleCount);
});

$(document).on("click", ".add_rule_device_form_btn",function() {
	DeviceSelectionForm.clone(true).insertAfter($(this).prev());
	operationdiv.clone(true).insertAfter($(this).prev().prev());
});

$(document).on("click", ".add_affected_device_form_btn",function() {
	affectedDevicediv.clone(true).appendTo($(this).next().next());
});

$(document).on("click", ".remove_rule_form_btn", function(){
	$(this).parent().fadeOut(400, function() {
		$(this).remove();
	    RuleCount--;
	    $.jStorage.set("RuleCount", RuleCount);
	});
});

$(document).on("click", ".add_rule_operation_form_btn", function(){
	operationdiv.clone(true).insertAfter($(this).prev().prev());
});


$(document).on("change", (".devSelect"),  function() {
	//get the units of this device
	 var id = (this.value).split(':')[0];
	/* the 0 is because this.value is a string containing "number:description" so after the split the 0 references the number  */
	 var Unit = devArray[ id ].deviceUnit; 
	//now only give the options that are available with that measure unit
		if (Unit == "ON/OFF") {
			$(this).next().html('<select name="initalValue" class="btn btn-default dropdown-toggle devformval ruleData"><option value="ON" selected >ON</option><option value="OFF">OFF</option> </select>');
		} else if (Unit == "Active/InActive") {
			$(this).next().html('<select name="initalValue" class="btn btn-default dropdown-toggle devformval ruleData"><option value="Active" selected >Active</option><option value="Inactive">Inactive</option> </select>');
		} else {
			    /* Unit is an enum */
				var ArrayOfEnums = $.jStorage.get("EnumsArray");
				var options; 
				for (var e in  ArrayOfEnums){
					if (Unit == $.trim( ArrayOfEnums[e].EnumName )){
						var values = ArrayOfEnums[e].EnumValues; 
						for ( var v in values){
						   var value = $.jStorage.get("EnumsArray")[e].EnumValues[v];
					       options = options + ("<option value=" +  $.trim( value ) + " >" + value + " </option>");
						}
					}
			    }  
				$(this).next().html('<select name="initalValue" class="btn btn-default dropdown-toggle devformval ruleData"> '
				+ options + '</select>'); 
		}
    }); 
    
/* $(document).on("click", ".hide_toggle_rule_form_btn", function(){
	$(this).parent().accordion({});
}); */
    
$(document).ready(function() {
	var Rules = $.jStorage.get("AllRules");
	if ( Rules == null || Rules.length == 0) {
		// no rules have been set before
		RuleCount = 1;
		$.jStorage.set("RuleCount", RuleCount);
	} else {
	    // rules have been set before
		RuleCount = Rules.length;
		$.jStorage.set("RuleCount", RuleCount);
		//add the rule forms to the page
		for(i=1; i< RuleCount; i++){
			// i starts at 1 because the first rule form is already present
			$("#rule_fields").append(RuleForm.clone(true));
		}
		// now we fill in the rule forms
		for(i=0; i< RuleCount; i++){
			
			console.log("Rules Desc: " + Rules[i].ruleDescription);
			console.log("Rule " + [i]);
			
			document.getElementsByClassName("desc")[i].value = Rules[i].ruleDescription;
			//$(".rule_form:eq( " + i + " )").find("input").value = Rules[i].ruleDescription;
			
			
			$(".triggerDeviceFieldset:eq(" + i + ") .operationSelectiondiv").find("select");
			$(".triggerDeviceFieldset:eq(" + i + ") .deviceSelectiondiv").find("select");
			
			for( j = 0; j < Rules[i].ruleTriggerDetails.length; j++ ){
				if (j > 0){
					$(".triggerDeviceFieldset:eq("+i+")").append(operationdiv.clone(true));
					$(".triggerDeviceFieldset:eq("+i+")").append(DeviceSelectionForm.clone(true));
					
				}
				//put in operation value
				var operation = Rules[i].ruleTriggerDetails[j][0];
				document.getElementsByClassName("triggerDeviceFieldset")[i].getElementsByClassName("originallyhidden")[j].value = operation;
				
				var unit = devArray[Rules[i].ruleTriggerDetails[j][1]].deviceUnit;
				var selectbox ="";
				if (unit == "ON/OFF") {
					selectbox = '<select name="initalValue" class="btn btn-default dropdown-toggle devformval ruleData"><option value="ON" selected >ON</option><option value="OFF">OFF</option> </select>';
				} else if (unit == "Active/InActive") {
					selectbox= '<select name="initalValue" class="btn btn-default dropdown-toggle devformval ruleData"><option value="Active" selected >Active</option><option value="Inactive">Inactive</option> </select>';
				} else {
				  var ArrayOfEnums = $.jStorage.get("EnumsArray");
				  var options = ""; 
				  for (var e in  ArrayOfEnums){
					if (unit == $.trim( ArrayOfEnums[e].EnumName )){
						var values = ArrayOfEnums[e].EnumValues; 
						for ( var v in values){
						   var value = $.jStorage.get("EnumsArray")[e].EnumValues[v];
					       options = options + ("<option value=" +  $.trim( value ) + " >" + value + " </option>");
						}
					}
			      }  
				  selectbox = '<select name="initalValue" class="btn btn-default dropdown-toggle devformval ruleData">  ' + options  + ' </select>';
				}
				document.getElementsByClassName("triggerDeviceFieldset")[i].getElementsByClassName("devSelect")[j].nextElementSibling.innerHTML =  selectbox ;
				var devstate = Rules[i].ruleTriggerDetails[j][3];
				document.getElementsByClassName("triggerDeviceFieldset")[i].getElementsByClassName("devformval")[j].value = devstate;
				
				//$(".ruleform:eq("+ 0 +") .triggerDeviceFieldset:eq(" + 0 + ") .operationSelectiondiv:eq(" + 0 + ")").find("option").effect("highlight", {}, 500);
				
				console.log("Triggers");
				console.log("Operator " + Rules[i].ruleTriggerDetails[j][0]);
				//$(".triggerDeviceFieldset:eq(" + i + ") .operationSelectiondiv:eq(" + j + ")").find("select").value =  Rules[i].ruleTriggerDetails[j][0];
				var operation = Rules[i].ruleTriggerDetails[j][0];
				document.getElementsByClassName("triggerDeviceFieldset")[i].getElementsByClassName("operationSelectiondiv")[j].value = operation;
				console.log("ID " + Rules[i].ruleTriggerDetails[j][1]);
				console.log("device : " + Rules[i].ruleTriggerDetails[j][2]);
				var deviceSelected = Rules[i].ruleTriggerDetails[j][1] + ":" + Rules[i].ruleTriggerDetails[j][2];
				//var selectionVarA = document.getElementsByClassName("triggerDeviceFieldset")[i].getElementsByClassName("devSelect")[j].value;
				document.getElementsByClassName("triggerDeviceFieldset")[i].getElementsByClassName("devSelect")[j].value = deviceSelected;
				/* $(".triggerDeviceFieldset:eq(" + i + ") .deviceSelectiondiv:eq(" + j + ")").find("select").value =  */
				console.log("state : " + Rules[i].ruleTriggerDetails[j][3]);
			}
			for( k = 0; k < Rules[i].ruleOutcomes.length; k++ ){
				if (k > 0){
					//document.getElementsByClassName("affectedDeviceFieldset")[k].append( affectedDevicediv );
					affectedDevicediv.clone(true).appendTo( document.getElementsByClassName("affectedDeviceFieldset")[i] );
				}
				
				console.log("OutComes");
				var AffDevSelect = Rules[i].ruleOutcomes[k][0] + ":" + Rules[i].ruleOutcomes[k][1]; 
				document.getElementsByClassName("affectedDeviceFieldset")[i].getElementsByClassName("devSelect")[k].value = AffDevSelect;
				var unit = devArray[Rules[i].ruleOutcomes[k][0]].deviceUnit;
				var selectbox ="";
				if (unit == "ON/OFF") {
					selectbox = '<select name="initalValue" class="btn btn-default dropdown-toggle devformval ruleData"><option value="ON" selected >ON</option><option value="OFF">OFF</option> </select>';
				} else if (unit == "Active/InActive") {
					selectbox= '<select name="initalValue" class="btn btn-default dropdown-toggle devformval ruleData"><option value="Active" selected >Active</option><option value="Inactive">Inactive</option> </select>';
				} else {
				  var ArrayOfEnums = $.jStorage.get("EnumsArray");
				  var options = ""; 
				  for (var e in  ArrayOfEnums){
					if (unit == $.trim( ArrayOfEnums[e].EnumName )){
						var values = ArrayOfEnums[e].EnumValues; 
						for ( var v in values){
						   var value = $.jStorage.get("EnumsArray")[e].EnumValues[v];
					       options = options + ("<option value=" +  $.trim( value ) + " >" + value + " </option>");
						}
					}
			      }  
				  selectbox = '<select name="initalValue" class="btn btn-default dropdown-toggle devformval ruleData">  ' + options  + ' </select>';
				}
				document.getElementsByClassName("affectedDeviceFieldset")[i].getElementsByClassName("devSelect")[k].nextElementSibling.innerHTML =  selectbox ;
				var devstate = Rules[i].ruleOutcomes[k][2];
				document.getElementsByClassName("affectedDeviceFieldset")[i].getElementsByClassName("devformval")[k].value = devstate;
				//$(".affectedDeviceFieldset:eq(" + i + ") .devSelect:eq(" + k + ")").find("select").effect("highlight", {}, 500);
				console.log("ID " + Rules[i].ruleOutcomes[k][0]);
				console.log("device : " + Rules[i].ruleOutcomes[k][1]);
				console.log("state : " + Rules[i].ruleOutcomes[k][2]);
			}
		}
		
	}
	
	
	});
     

});

</script>
</body>
</html>
