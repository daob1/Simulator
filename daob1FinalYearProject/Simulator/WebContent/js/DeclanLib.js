/**
 * 
 */
//device object constructor
function device(deviceID,deviceDescription,deviceUnit,deviceInitialValue, devicePositionLeft, devicePositionTop)
	{
	this.deviceID=deviceID;
	this.deviceDescription=deviceDescription;
	this.deviceUnit=deviceUnit;
	this.deviceInitialValue=deviceInitialValue;
	this.devicePositionLeft=devicePositionLeft;
	this.devicePositionTop=devicePositionTop;
	
	this.show=show;
	  function show()
	  {
	     alert("ID: " + this.deviceID + ". Desciption: " + this.deviceDescription + ". Unit: " + this.deviceUnit + ". InitialValue: " + this.deviceInitialValue);
	  }
	}

//rule object constructor
function rule(ruleID, ruleDescription,  ruleTriggerDetails, ruleOutcomes )
   {
	this.ruleID=ruleID;
	this.ruleDescription = ruleDescription;
	this.ruleTriggerDetails = ruleTriggerDetails;
	this.ruleOutcomes = ruleOutcomes;
   }

function enumeration( EnumName, EnumValues){
	this.EnumName = EnumName;
	this.EnumValues = EnumValues;
}

function event( eventID, timeStamp ,device, value ){
   	this.eventID = eventID;
   	this.timeStamp = timeStamp;
   	this.device = device;
   	this.value = value;
}

function timeStamp() {
	// Create a date object with the current time
	  var now = new Date();
	// Create an array with the current month, day and time
	  var date = [ now.getMonth() + 1, now.getDate(), now.getFullYear() ];
	// Create an array with the current hour, minute and second
	  var time = [ now.getHours(), now.getMinutes(), now.getSeconds() ];
	// Determine AM or PM suffix based on the hour
	  var suffix = ( time[0] < 12 ) ? "AM" : "PM";
	// Convert hour from military time
	  time[0] = ( time[0] < 12 ) ? time[0] : time[0] - 12;
	// If hour is 0, set it to 12
	  time[0] = time[0] || 12;
	// If seconds and minutes are less than 10, add a zero
	  for ( var i = 1; i < 3; i++ ) {
	    if ( time[i] < 10 ) {
	      time[i] = "0" + time[i];
	    }
	  }
	// Return the formatted string
	  return date.join("/") + " " + time.join(":") + " " + suffix;
}