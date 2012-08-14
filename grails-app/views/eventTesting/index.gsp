<!doctype html>
<html>
	<head>
		<title>Testing events...</title>
		<r:require modules="jquery,grailsEvents"/>
		<r:layoutResources/>
	</head>
	<body>
		<h1 id="waiting"><r:img uri="/images/spinner.gif"/> Please wait event firing...</h1>
		<r:layoutResources/>
		<script type="text/javascript">
	        try {
	             var grailsEvents = new grails.Events("${createLink(uri:'')}",{transport:"sse"});
	             grailsEvents.on('bagsUpdated', function(data){
	                 window.console && console.log("GOT bags!")
	                 $("#waiting").html("Event fired!");
	             });
	        } catch (error) {
	            console.log("ERROR: " + error.toString());
	        }

	        $(function(){
	        	// Call controller method that emits event when its done
	        	$.ajax({
	        		url: "${createLink(action:'updateBags')}",	

	        		success: function(){
	        			console.log("Event should have been already fired...");
	        		},

	        		error: function(){
	        			console.log("Ops something went wrong... ");
	        		}
	        	});
	        });
        </script>
	</body>	
</html>
