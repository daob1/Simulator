<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.*,java.text.*,java.io.*,javax.script.*,javax.script.ScriptEngineManager,javax.script.ScriptException"

    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Results</title>
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
<!-- <script src="js/jscharts.js"></script> -->

<script src="js/Chart.js-master/Chart.js"></script>

</head>
<body>

<div class="container">
		<div class="row">
			<div class="col-md-3">
				<h2>Simulation Results</h2>
				<div class="btn-group btn-lg btn-block">
					<a href="Simulation.jsp" type="button" class="btn btn-lg btn-info "><span class="glyphicon glyphicon-chevron-left"></span>Previous Step</a> 
					<a href="CreateDevices.jsp" type="button" class="btn btn-lg btn-success ">Done<span class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
				
				<form name="myInputForm" action="Results.jsp" method="POST">
<div id="hidden">
<input id="myInput" name="myInput" />
</div>
<input class="btn btn-primary btn-lg btn-block" type="submit" value="Download Devices">
<input class="btn btn-primary btn-lg btn-block" type="submit" value="Download Rules">
</form>
				<div class="btn-group">
					
				</div>
			</div>
			<div class="col-md-9">
				<div class=" jumbotron" id="mainArea" >
				<div class="row">
				  
				    <p>Device Change State Count</p>
				    <canvas id="myChart1" width="700" height="300"></canvas>
				   
				    
				      <p>Device Changes Due To Each Rule</p>
				       <canvas id="myChart2" width="700" height="300"></canvas>
				    
				</div>
				<div class="row">
				 <div class=".col-md-3">
				     <p>Proportion Of Device Changes Due To Human Interaction Vs Rule Invocation</p>
				     <small>Caused By Rule Invocation.</small>
				 </div>
				 <div class=".col-md-6">
				    <canvas id="myChart3" width="350" height="300"></canvas>
				   </div>
				</div>
					
					<p>Thank you. It is encouraged for users to upload your dataset to the <a href="http://www.home-ml.org/Browser">HomeML repository</a>
					</p>
				</div>

<script>
var inhabitant_name = $.jStorage.get("inhabitant_name");

if (inhabitant_name == "" || inhabitant_name == null){
	inhabitant_name = "John Doe";
}
var location_description = $.jStorage.get("location_description");
var deviceInfo= JSON.stringify($.jStorage.get("allDevices")); 

$("#mainArea").prepend("<p>Statistics for " + inhabitant_name + " in " + location_description + "</p>" );

</script> 

<%
 	String inhabitant_name1 = "<script>document.writeln(inhabitant_name)</script>";
 	String location_description1 = "<script>document.writeln(location_description)</script>";
 	String deviceInfo = "<script>document.writeln(deviceInfo)</script>";

 	if (request.getParameter("myInput") != null) {
 		String deviceConfiguration = (request.getParameter("myInput"));

 		int BYTES_DOWNLOAD1 = 1024;

 		response.setContentType("text/plain");
 		response.setHeader("Content-Disposition",
 				"attachment;filename=deviceConfig.json");

 		String s = deviceConfiguration;
 		InputStream input = new ByteArrayInputStream(s.getBytes("UTF8"));

 		int read = 0;
 		byte[] bytes = new byte[BYTES_DOWNLOAD1];
 		OutputStream os = response.getOutputStream();

 		while ((read = input.read(bytes)) != -1) {
 			os.write(bytes, 0, read);
 		}
 		os.flush();
 		os.close();
 	}
 %>
			<script> 
			$(document).ready(function() {
			var WhatsThat = $("#myInput").val;
			});
			$("#myInput")[0].value = (deviceInfo);</script> 
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
						<div class="panel panel-success">
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
						<div class="panel panel-primary">
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
//this hidden hides the text area we store the configuration information
//in so we can load into Java function to download as a file
$("#hidden").hide();

$(document).ready(function() {
var devices = $.jStorage.get("allDevices");
var Events =$.jStorage.get("Events");
var Enums = $.jStorage.get("EnumsArray");
var rules = $.jStorage.get("AllRules");

Enums.push(new enumeration("ON/OFF", ["ON","OFF"]));
Enums.push(new enumeration("Active/Inactive", ["Active","Inactive"]));

function EachStateHappened( DataArray ){
	DataArray = new Array();
	for( var devID in devices ){
		for( var en in Enums){
			if( Enums[en].EnumName == devices[devID].deviceUnit ) {
			  for( var ev in Events){
			    if ( devices[ devID ].deviceInitialValue ==  Events[ev].value ){
				     DataArray.push(Events[ev].value);
			    }
			  }
			}
		}
	}
    return DataArray;
}

function CountEventsForAllDevs( DataArray ){
	DataArray = new Array();
	for( var devID in devices ){
		var count = 0;
		for( var e in Events){
			if ( devices[ devID ].deviceDescription == Events[e].deviceName ){
				count++;
			} 
		}
		DataArray.push( count);
	}
    return DataArray;
}

function DeviceChangesDueToEachRule( ){
	DataArray = new Array();
	for( var ruleID in rules ){
		var count = 0;
		for( var e in Events){
			if (  ruleID  == Events[e].reason ){
				count++;
			} 
		}
		DataArray.push( count);
	}
    return DataArray;
}

function PorpotionRuleToHumanDeviceChanges(){
	var humanInteractionCount = 0;
	var RuleInvokationCount = 0;
	var RuleIDandCount = new Array();
	for( var ev in Events ){
			if ( Events[ ev ].reason != "HumanInteraction" && Events[ ev ].reason != "InitialSetting"  ){
				RuleInvokationCount++;
			} else {
				humanInteractionCount++;
			}
		}
    return [RuleInvokationCount, humanInteractionCount];
}


var deviceNames = new Array();
var deviceUnits = new Array();
var ruleNames = new Array();
//Grab all device information for easy use later
for( devID in devices){
	deviceNames.push( devices[devID].deviceDescription );
	deviceUnits.push( devices[devID].deviceUnit );
}
//Grab all rule names for use later
for( ruleID in rules){
	ruleNames.push( rules[ruleID].ruleDescription );
}
//Chart 1
var devStateCount = CountEventsForAllDevs( devStateCount );
var data = {
		labels : deviceNames,
		datasets : [
			
			{
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,1)",
				pointColor : "rgba(151,187,205,1)",
				pointStrokeColor : "#fff",
				data : devStateCount
			}
		]
	};
var ctx = document.getElementById("myChart1").getContext("2d");
new Chart(ctx).Line(data);


//Chart 2
ResultsArray = new Array();
ResultsArray = DeviceChangesDueToEachRule();
var data1 = {
		labels : ruleNames,
		datasets : [
			
			{
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,1)",
				pointColor : "rgba(151,187,205,1)",
				pointStrokeColor : "#fff",
				data : ResultsArray
			}
		]
	};
var ctx2 = document.getElementById("myChart2").getContext("2d");
new Chart(ctx2).Line(data1);


//Pie Chart
var PorResults = PorpotionRuleToHumanDeviceChanges();
var data3 = [
        	{
        		value: PorResults[0],
        		color:"#F38630"
        	},
        	{
        		value : PorResults[1],
        		color : "#E0E4CC"
        	}
        		
        ];
var ctx3 = document.getElementById("myChart3").getContext("2d");
new Chart(ctx3).Pie(data3);

$("small").css("color", "orange");

});
</script>
</body>
</html>