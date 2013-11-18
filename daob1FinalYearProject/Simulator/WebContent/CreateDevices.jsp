<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
    <jsp:directive.page language="java"
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" />
    <jsp:text>
        <![CDATA[ <?xml version="1.0" encoding="ISO-8859-1" ?> ]]>
    </jsp:text>
    <jsp:text>
        <![CDATA[ <!DOCTYPE html> ]]>
    </jsp:text>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

<title>Simulator</title>

    <!-- Bootstrap -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
    <link href="css/bootstrap.min.css" rel="stylesheet"></link>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    
</head>
<body>


<form id="myForm">
Patient Name: <input type="text" name="inhabitant_name"/>
Care Plan: <input type="text" name="care_plan"/>
Comment: <input type="text" name="comment"/>
Location description: <input type="text" name="location_description"/>
<!-- Indicates a successful or positive action -->
</form>
<button type="button" class="btn btn-success" value="Success">Success</button>

<form >
Device: <input type="text" name="device_description"/>
Units: <input type="text" name="device_units"/>
Initial Value: <input type="text" name="initial_value"/>
</form>

<script src="https://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
</jsp:root>