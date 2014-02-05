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

	$('#outOfTheWay').append('<div id="dev' + i + '" class="devices btn btn-primary btn-md">' + deviceArray[i].deviceDescription + '<br/> State: ' + deviceArray[i].deviceInitialValue + '</div>');
	$(".devices:eq(" + i + ")").offset({ top: topPosition, left: leftPosition});
}
// the devices have been place


</script>
</body>
</html>