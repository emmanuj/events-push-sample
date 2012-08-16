events-push-sample
==================

This is a simple grails project created from scratch depending on:

	- grails-platform-core 1.0.M3
	- grails-events-push 1.0.M2-SNAPSHOT

Event binding in browser
------------------------

   The view `eventTesting/index.gsp` binds the _bagsUpdated_ topic:
   	
        try {
             var grailsEvents = new grails.Events("${createLink(uri:'')}",{transport:"sse"});
             grailsEvents.on('bagsUpdated', function(data){
                 ...
             });
        } catch (error) {
            console.log("ERROR: " + error.toString());
        }

   and triggers via AJAX

 		$(function(){
	        	// Call controller method that emits event when its done
	        	$.ajax({
	        		url: "${createLink(action:'updateBags')}",	
	    		...

    the controller method firing the _bagsUpdated_ event

		package sample

		class EventTestingController {
			...

		    def updateBags(){
		    	Thread.sleep(5000)
		    	event topic: 'bagsUpdated'
		    	render "OK"
		    }
		}

