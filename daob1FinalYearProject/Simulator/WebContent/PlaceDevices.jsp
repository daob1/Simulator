<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

<!-- Bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<link rel="stylesheet" type="text/css"
    href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css"/>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <script src="http://raw.github.com/andris9/jStorage/master/jstorage.js"></script>
  <script src="http://cs1.ucc.ie/~daob1/FourthYearProject/daob1FinalYearProject/Simulator/WebContent/js/jStorage-master/jstorage.js"></script>
  <script src="http://cs1.ucc.ie/~daob1/FourthYearProject/daob1FinalYearProject/Simulator/WebContent/js/bootstrap.js"></script>


<title>Place Devices</title>
</head>
<body>
	
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<h2>Place Devices</h2>
				<p>Position the devices in the 
				<script>
 if ($.jStorage.get("location_description") == null)
		 {
	       document.write("room");
	     }
 else 
         {
	       document.write($.jStorage.get("location_description"));
         } ;
</script>
</p>
				
				<span id="resizeDiv" class="label label-primary draggable-div devices">
				Drag me around
				</span>
				<span id="resizeDiv2" class="label label-primary draggable-div devices">
				Drag me around
				</span>
				<span id="resizeDiv3" class="label label-primary draggable-div devices">
				Drag me around
				</span>
				

				<div class="btn-group">
					<a href="CreateDevices.jsp" type="button" class="btn btn-info ">Previous Step</a>
					<a href="ConfigureRules.jsp" type="button" class="btn btn-success ">Configure Rules</a> 
			    </div>
			    <div id="show">show</div>
			</div>






			<div class="col-md-9">
				<div id="CanvasDiv" class="row">
				
					<canvas id="myCanvas" width="800" height="600"> Your
					browser does not support the HTML5 canvas tag. </canvas>
				</div>
				
				<div class="row">
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
						<div class="panel panel-primary">
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
						<div class="panel panel-default">
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
    var location_description = $.jStorage.get("location_description");
    
	$(document)
			.ready(
					function() {
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

	$('#myCanvas').droppable({
	    tolerance: 'fit'
	});

	$('.draggable-div').draggable({
	    revert: 'invalid',
	    stop: function(){
	        $(this).draggable('option','revert','invalid');
	        $(this).find('.undo').show();
	    }
	});

	$('.draggable-div').find('.undo').click(function(i, e) {
	    var $div = $(this).parent();
	    revertDraggable($div);
	});

	$('#myCanvas').droppable({
	    greedy: true,
	    tolerance: 'touch',
	    drop: function(event,ui){
	       // ui.draggable.draggable('option','revert',true);
	        if (!ui.draggable.data("originalPosition")) {
	            ui.draggable.data("originalPosition",
	                              ui.draggable.data("draggable").originalPosition);
	            
	        }


	        $(this).find('.undo').show();
	    }
	});

	function revertDraggable($selector) {
	    $selector.each(function() {
	        var $this = $(this),
	            position = $this.data("originalPosition");

	        if (position) {
	            $this.animate({
	                left: position.left,
	                top: position.top
	            }, 500, function() {
	                $this.data("originalPosition", null);
	            });
	        }
	    });
	    
	     $selector.find('.undo').hide();
	    
	}

 		
		
		$(function() {
			$('.devices')
		    .draggable({  stack: ".devices", containment: '#myCanvas'  })
		    .resizable({maxHeight: 300, maxWidth: 300});
			
			$( "#myCanvas" ).droppable({
			      activeClass: "ui-state-hover",
			      hoverClass: "ui-state-active",
			      drop: function( event, ui ) {
			        $( this )
			          .addClass( "ui-state-highlight" )
			          .find( "p" )
			            .html( "Dropped!" );
			      }
			    });
        });
		
		$("#show").click(function(){
			  inhabitant_name = $.jStorage.get("inhabitant_name");
			  alert("Showing you inhabitant_name: " + inhabitant_name);
			  
			  testArray = new Array();
              testArray = $.jStorage.get("allDevices");
              alert(JSON.stringify(testArray));
              alert(testArray[0].deviceDescription);
              alert(testArray[1].deviceDescription);
			});
</script>


	
</body> 
	</html>