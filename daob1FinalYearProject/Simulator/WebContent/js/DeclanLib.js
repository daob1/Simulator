/**
 * 
 */
//device object constructor
function device(deviceID,deviceDescription,deviceUnit,deviceInitialValue)
	{
	this.deviceID=deviceID;
	this.deviceDescription=deviceDescription;
	this.deviceUnit=deviceUnit;
	this.deviceInitialValue=deviceInitialValue;
	
	this.show=show;
	  function show()
	  {
	     alert("ID: " + this.deviceID + ". Desciption: " + this.deviceDescription + ". Unit: " + this.deviceUnit + ". InitialValue: " + this.deviceInitialValue);
	  }
	}