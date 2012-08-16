package sample

class EventTestingController {

    def index() { }

    def updateBags(){
    	Thread.sleep(5000)
    	event topic: 'bagsUpdated'
    	render "OK"
    }
}
