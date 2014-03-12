<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Simulation</title>
<!-- Bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"></link>
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
				<h2>Simulation</h2>
				<div class="btn-group">
					<a href="ConfigureRules.jsp" type="button" class="btn btn-lg btn-info "><span class="glyphicon glyphicon-chevron-left"></span>Previous Step</a> 
						<a href="Results.jsp" type="button" class="btn btn-lg btn-success ">Done<span class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
				<div class="jumbotron">
                   <p>Click on the devices to change their state and invoke rules you have created.</p>
                   
                  
                </div>
                <div id="RulelogDisplay">
                   <h3 class="text-center">Last Called Rules</h3>
                   <ol class="text-center" id="RuleLog" class="list-unstyled">
                   
                   </ol>
                   </div>
                
				

				<div id="dialog-form" title="Change State">
					<p class="validateTips">What state would you like the device to be?.</p>

					<form>
						<fieldset>
							<select  class="btn btn-default btn-block dropdown-toggle newStateSelector onchange='newStateSelection(this, 0)'"
										name="dropdown"">
										<option selected disabled>Please Choose</option>
										
							</select>  
						</fieldset>
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
						<div class="panel panel-success">
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
						<div class="panel panel-primary">
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
var Events = new Array();
var eventID = 0;
var newStatePicked; 
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
//canvas with empty room image is set

//keep showing the device in their positions
var canvasposition = $("#myCanvas").offset();
deviceArray = new Array();
deviceArray = $.jStorage.get("allDevices");
for (i=0;i<deviceArray.length;i++)
{ 
var topPosition =  deviceArray[i].devicePositionTop + canvasposition.top;
var leftPosition = deviceArray[i].devicePositionLeft + canvasposition.left;

	$('#outOfTheWay').append('<div id="' + deviceArray[i].deviceID + '" style="position: absolute" class="devices btn btn-primary btn-md">' + deviceArray[i].deviceDescription + '<br/> State: ' + deviceArray[i].deviceInitialValue + '</div>');
	$(".devices:eq(" + i + ")").offset({ top: topPosition, left: leftPosition});
}

$(".devices").addClass('fixed');
// the devices have been place

//$("#RulelogDisplay").css('margin-top', 70);


//Load the rules
var Rules = $.jStorage.get("AllRules");


$(document).ready(function() {
	// if we start a new simulation
	$.jStorage.set("Events", (new Array()) );
	
	// at the beginning of the simulation we put in an event foreach device
	for (i=0;i<deviceArray.length;i++){
		NoteEvent(deviceArray[i].deviceID  , deviceArray[i].deviceDescription,  deviceArray[i].deviceInitialValue, "InitialSetting" );
	}
	
});

$(".devices").width(150);

function changeDeviceState( devID ){
	var Unit = deviceArray[devID].deviceUnit;
	switch (Unit)
		{
		   case "ON/OFF":
			   if(deviceArray[devID].deviceInitialValue == "ON"){
				   deviceArray[devID].deviceInitialValue = "OFF";
			   } else if (deviceArray[devID].deviceInitialValue == "OFF"){
				   deviceArray[devID].deviceInitialValue = "ON";
			   }
			   break;
		   case "Active/InActive":
			   if(deviceArray[devID].deviceInitialValue == "Active"){
				   deviceArray[devID].deviceInitialValue = "Inactive";
			   } else if (deviceArray[devID].deviceInitialValue == "Inactive"){
				   deviceArray[devID].deviceInitialValue = "Active";
			   }
			   break;
		   default:  //its an enum
			   newStatePicked = false;
		    var ArrayOfEnums = $.jStorage.get("EnumsArray");
			var options = "<option selected disabled>Please Choose</option>";
			for (var e in  ArrayOfEnums){
				if (Unit == $.trim( ArrayOfEnums[e].EnumName )){
					var values = ArrayOfEnums[e].EnumValues;
					for ( var v in values){
					   var value = $.jStorage.get("EnumsArray")[e].EnumValues[v];
				       options = options + ("<option value='" +  value + "' >" + value + " </option>");
					}
				}
		    }
			$( "#dialog-form" ).find( "p" ).html("What state would you like the " + deviceArray[devID].deviceDescription + " to be?.");
			$( "#dialog-form" ).find( "fieldset" ).html('<select class="btn btn-default dropdown-toggle newStateSelector" onchange="newStateSelection(this,' +  devID + ' )";> '
			+ options + '</select>'); 
            $( "#dialog-form" ).dialog( "open");
            //the newStateSelection function called in the dailog box will give the device its newValue
		}
};

function invokeRule( RuleID ){
	    //this function causes all outcomes of the rule ruleID to be put in place
		var OutComes = Rules[RuleID].ruleOutcomes;
		for(j=0; j < OutComes.length; j++){
			var devID = OutComes[j][0];
			deviceArray[devID].deviceInitialValue = OutComes[j][2];
			$('#' + devID).effect("highlight", {color: 'green'}, 500).html(deviceArray[devID].deviceDescription + "<br/> State: " + deviceArray[devID].deviceInitialValue );
			NoteEvent( deviceArray[devID].deviceID, deviceArray[devID].deviceDescription , deviceArray[devID].deviceInitialValue, RuleID );
			
			//output that the rule was invoked to log
			AddToLatestRulelog( Rules[RuleID].ruleDescription );
		}
        
		// create an event with a time attribute
		
		
		//at the end of invoking a rule should i check if more rules are to be invoked?
		//invokeTheseRules( WhatRulesShouldBeInvoked() );
		//No because rules should only be carried out only if a person triggered them.
}    

function WhatRulesShouldBeInvoked(){
	// this function checks each device state and compares them to what triggers a rule. If the 
	// triggers of a rule are satisfied that rule will be invoked.
	RulesThatShouldBeInvoked = new Array();
	var Match;
	//in each rule 
	for(var i = 0; i < (Rules.length) ; i++){
		//check each device in trigger and compare to current values
		var Triggers = Rules[i].ruleTriggerDetails;
		for(j=0; j<Triggers.length;j++){
			Match = true; 
			// take into account the operator
			if( Triggers[j][0] == 'NOT'){
				if (deviceArray[Triggers[j][1]].deviceInitialValue == Triggers[j][3] && (Match)){
					// there is a mismatch 
                    //stop comparing and move to next rule. 
					Match = false;
					break;
				}
			} else { // operator is AND
				if (deviceArray[Triggers[j][1]].deviceInitialValue != Triggers[j][3] && (Match)){
					// there is a mismatch 
                    //stop comparing and move to next rule. 
					Match = false;
					break;
				}
			}
			//0 is operator //1 is device ID //2 is description //3 is value
			// if there is a mismatch 
                    //stop comparing and move to next rule.
            //else 
		}
	 	    if(Match ==  true){
			    // invoke the rule
			    //alert("INVOKING RULE: " + i);
			    //invokeRule(i);
			    RulesThatShouldBeInvoked.push( i ); 
			    
		    }
	}
	return RulesThatShouldBeInvoked;
}

function newStateSelection( selectObj , DevID){
	deviceArray[DevID].deviceInitialValue =  selectObj.value ;
    $( "#dialog-form" ).dialog( "close" );
    $('#' + DevID).html(deviceArray[DevID].deviceDescription + "<br/> State: " + deviceArray[DevID].deviceInitialValue );
    NoteEvent(deviceArray[DevID].deviceID, deviceArray[DevID].deviceDescription , deviceArray[DevID].deviceInitialValue, "HumanInteraction" );
    invokeTheseRules( WhatRulesShouldBeInvoked() );  //this is invoked on selection of new state if it is an enum
};

/* function InvokeRulesConcerning( devID ){
	//  if the deviceID is inside any rules
	//loop through each rule
	for(var i = 0; i < (Rules.length) ; i++){
		// loop though each trigger device
		for(var j = 0; j < (Rules[i].ruleRiggerDetails) ; j++){
		  // if the device ID devID is inside ruleTriigerDetails
	      if ( Rules[i].ruleRiggerDetails[j][1] == devID ){
	           alert ( "this device is used in the rule: " +  Rules[i].ruleDescription );
	      }
		}
	}
};  */

function invokeTheseRules( ArrayOfRuleID ){
	for( x = 0; x < ArrayOfRuleID.length ; x++ ){
		invokeRule( ArrayOfRuleID[x]) ;
	}
};

$(document).on("click", ".devices", function(){
	// when a device is clicked its state changes
	
	// this id in a variable and use it to address the devs
	var devID;
	devID = $(this).attr('id');
	changeDeviceState( devID );
	$('#' + devID).effect("highlight", {}, 500).html(deviceArray[devID].deviceDescription + "<br/> State: " + deviceArray[devID].deviceInitialValue );
	if (deviceArray[devID].deviceUnit == "ON/OFF" || deviceArray[devID].deviceUnit == "Active/InActive"){
		invokeTheseRules( WhatRulesShouldBeInvoked() );
		NoteEvent(deviceArray[devID].deviceID, deviceArray[devID].deviceDescription , deviceArray[devID].deviceInitialValue, "HumanInteraction" );
	}
	//NoteEvent( deviceArray[devID].deviceDescription , deviceArray[devID].deviceInitialValue );
	// invokeTheseRules( WhatRulesShouldBeInvoked() ) will be invoked after selection if the device uses enumeration intead of ON/OFF or Acitive/Inactive
});

$( "#dialog-form" ).dialog({
    autoOpen: false,
    height: 200,
    width: 300,
    modal: true  
});   
    
function NoteEvent( deviceID, deviceName, value, reason ){
	Events.push( new event( eventID, timeStamp() , deviceID, deviceName, value, reason ));
	eventID++;
	//update Jstorage Events
	$.jStorage.set("Events", Events);
};

function AddToLatestRulelog( RuleName ){
	$("#RuleLog").prepend( "<li>" + $.trim(RuleName) + "</li>" );
	var ChildCount = ($("#RuleLog").children().length)
	if ( ChildCount > 6){
		$("#RuleLog li").last().remove();
	}
	
};



</script>
</body>
</html>