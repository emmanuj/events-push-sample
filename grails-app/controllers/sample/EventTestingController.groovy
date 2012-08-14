package sample

class EventTestingController {

    def index() { }

    def updateBags(){
    	Thread.sleep(5000)
    	event for:'browser', topic: 'bagsUpdated'
    	render "OK"
    }
}
