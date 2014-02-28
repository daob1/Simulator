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
				<h2>Simulation</h2>
				<div class="jumbotron">
                   <p>Click on the devices to change their state and invoke rules you have created.</p>
                </div>
                
				<div class="btn-group">
					<a href="ConfigureRules.jsp" type="button" class="btn btn-info ">Previous
						Step</a> <a href="Information.html" type="button"
						class="btn btn-success ">Done</a>
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

	$('#outOfTheWay').append('<div id="' + deviceArray[i].deviceID + '" class="devices btn btn-primary btn-md">' + deviceArray[i].deviceDescription + '<br/> State: ' + deviceArray[i].deviceInitialValue + '</div>');
	$(".devices:eq(" + i + ")").offset({ top: topPosition, left: leftPosition});
}

$(".devices").addClass('fixed');
// the devices have been place

//Load the rules
var Rules = $.jStorage.get("AllRules");

function getCustomState( devID ){
	//create a div with input form in the left pane
	var CustomStateDivCopy = CustomStateDiv.clone(true);
	CustomStateDivCopy.find('label').append( deviceArray[devID].deviceDescription );
	$("#inputBoxes").append( CustomStateDivCopy );
}

function getNumberState( devID ){
	//create a div with input form in the left pane
	var NumberStateDivCopy = NumberStateDiv.clone(true);
	NumberStateDivCopy.find('label').append( deviceArray[devID].deviceDescription );
	$("#inputBoxes").append( NumberStateDivCopy );
}


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
		   case "Numerical": 
			   // deviceArray[devID].deviceInitialValue= getNewState( devID )
			   do{
			   var state = prompt("Please enter new Numberical state for " + deviceArray[devID].deviceDescription );
			   } while (isNaN(state) == true);
		       deviceArray[devID].deviceInitialValue = state;
			   //var NewState = promt("number input for " + deviceArray[devID].deviceDescription);
			   break;
		   case "Custom":
			   // deviceArray[devID].deviceInitialValue= getNewState( devID )
			   do{
			   var state= prompt("Please enter new state for " + deviceArray[devID].deviceDescription );
			   } while ((isNaN(state) == false));
		       deviceArray[devID].deviceInitialValue = state;
      
			   //var NewState = promt("State input for " + deviceArray[devID].deviceDescription);
			   break;
		}
};

function invokeRule( RuleID ){
	//for(var i = 0; i <= Rules[RuleID].ruleOutcomes[i].length; i++){
		var OutComes = Rules[RuleID].ruleOutcomes;
		for(j=0; j < OutComes.length; j++){
			var devID = OutComes[j][0];
			deviceArray[devID].deviceInitialValue = OutComes[j][2];
			$('#' + devID).effect("highlight", {}, 3000).html(deviceArray[devID].deviceDescription + "<br/> State: " + deviceArray[devID].deviceInitialValue );
		    
		}
	//}
}

function UseRules(){
	var Match = true;
	//in each rule 
	for(var i = 0; i < (Rules.length - 1) ; i++){
		//check each device in trigger and compare to current values
		var Triggers = Rules[i].ruleTriggerDetails;
		for(j=0; j<Triggers.length;j++){
			
			// dont forget the operator
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
			//0 is operator
			//1 is device ID
			//2 is description
			//3 is value
			// if there is a mismatch 
                    //stop comparing and move to next rule.
            //else 
        	// invoke the rule
		}
		if(Match ==  true){
			// invoke the rule
			//alert("INVOKING RULE: " + i);
			invokeRule(i);
			//create an event with a time attribute
		}
	}
	    
}

$(document).on("click", ".devices", function(){
	// this id in a variable and use it to address the devs
	var devID;
	devID = $(this).attr('id');
	changeDeviceState( devID );
	$('#' + devID).effect("highlight", {}, 3000).html(deviceArray[devID].deviceDescription + "<br/> State: " + deviceArray[devID].deviceInitialValue );
    UseRules()
});

</script>
</body>
</html>