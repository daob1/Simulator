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

function enumeration( enumID, EnumName, EnumValues){
	this.enumID = enumID;
	this.EnumName = EnumName;
	this.EnumValues = EnumValues;
}