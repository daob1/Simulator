<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.*, java.text.*, java.io.*, javax.script.ScriptEngine,
javax.script.ScriptEngineManager, javax.script.ScriptException"
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
<script src="js/jscharts.js"></script>


</head>
<body>

<div class="container">
		<div class="row">
			<div class="col-md-3">
				<h2>Simulation Results</h2>
				<div class="btn-group btn-lg btn-block">
					<a href="Simulation.jsp" type="button" class="btn btn-lg btn-info "><span class="glyphicon glyphicon-chevron-left"></span>Previous Step</a> 
						<a href="Information.html" type="button" class="btn btn-lg btn-success ">Done<span class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
				<div >
				   <button type="button" class="btn btn-primary btn-lg btn-block">Statistics for rules</button>
				   <button type="button" class="btn btn-primary btn-lg btn-block">Statistics for devices</button>
				 </div>
				   <!-- <button type="button" class="btn btn-primary btn-lg btn-block">Large button</button>
				   <button type="button" class="btn btn-primary btn-lg btn-block">Large button</button> -->
				<form enctype="multipart/form-data" method="get">
					<div>
						<input class="btn btn-primary btn-lg btn-block" type="submit" value="Download Results" onclick="executeTest()" />
					</div>
				</form>
				<div class="btn-group">
					
				</div>
			</div>
			<div class="col-md-9">
				<div class="row jumbotron" id="mainArea" >
				    <p>Device change state count</p>
					<div id="chartcontainer1">No results to display
					
					</div>
					<p>Count Times State Occurred </p>
					<div id="chartcontainer2">
					
					</div>
					<p>It is encouraged for users to upload your dataset to the <a href="http://www.home-ml.org/Browser">HomeML repository</a>
					</p>
				</div>
				
				    
				


<script>
var inhabitant_name = $.jStorage.get("inhabitant_name");
var location_description = $.jStorage.get("location_description");
var deviceInfo= JSON.stringify($.jStorage.get("allDevices")); 

$("#mainArea").prepend("<p>Statistics for " + inhabitant_name + " in the location " + location_description + "</p>" );

</script> 
<%!DateFormat tipe = new SimpleDateFormat("E_k_m");
Calendar cal = Calendar.getInstance();%>

<%

 	String inhabitant_name1 = "<script>document.writeln(inhabitant_name)</script>";
 	String location_description1 = "<script>document.writeln(location_description)</script>";
 	String deviceInfo1 = "";
 	ScriptEngineManager manager = new ScriptEngineManager();
     ScriptEngine engine = manager.getEngineByName("js");        
     /* Object result = engine.eval("<script>document.writeln(deviceInfo)</script>");
    deviceInfo1 = result.toString(); */
 	out.println(inhabitant_name1);
 	out.println(location_description1);
 	out.println("HERE is device information: " +  deviceInfo1);

//always give the path from root. This way it almost always works.
//" + inhabitant_name.toString()  + tipe.toString() + "
String nameOfTextFile = "C:\\Users\\daob1.CS-DOMAIN\\Downloads\\Devices.json";
try {   
    PrintWriter pw = new PrintWriter(new FileOutputStream(nameOfTextFile));
    pw.println(deviceInfo1.toString());
    //clean up
    pw.close();
} catch(IOException e) {
   out.println(e.getMessage());
  
}

	
%>  



				
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
	 <div id="hidden">

</div>
<script>

//$("#hidden").hide();


$(document).ready(function() {
var devices = $.jStorage.get("allDevices");
var Events =$.jStorage.get("Events");
var Enums = $.jStorage.get("EnumsArray");

function CountTimeEachStateHappened( DataArray ){
	DataArray = new Array();
	for( var devID in devices ){
		for( var en in Enums){
			if( Enums[en].EnumName == devices[devID].deviceUnit ) {
			  for( var ev in Events){
			    if ( devices[ devID ].deviceInitialValue ==  Events[ev].value ){
				     DataArray.push([devices[devID].deviceInitialValue ,  Events[ev].eventID]);
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
			if ( devices[ devID ].deviceDescription == Events[e].device ){
				count++;
			} 
		}
		DataArray.push([devices[devID].deviceDescription ,  count]);
	}
    return DataArray;
}
var DeviceData1 = new Array();
//var myExampleData = new Array([10, 20], [15, 10], [20, 30], [25, 10], [30, 5]);
CountEventsForAllDevs( DeviceData1 );
var myData = CountEventsForAllDevs( DeviceData1);
var myChart1 = new JSChart('chartcontainer1', 'bar');
myChart1.setDataArray(myData);
myChart1.draw();

var DeviceData2 = new Array();
//var myExampleData = new Array([10, 20], [15, 10], [20, 30], [25, 10], [30, 5]);
//OrderEventsHappened( DeviceData2 );
var myData = CountTimeEachStateHappened( DeviceData2);
var myChart2 = new JSChart('chartcontainer2', 'bar');
myChart2.setDataArray(myData);
myChart2.draw();

});


</script>
</body>
</html>