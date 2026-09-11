if !global.backstagedata[global.backstagey][global.backstagex].haslink {
	instance_destroy()	
}

deac = false
cursor = 1

depth = 5000

enID = 999

var roomtarget = instance_create_depth(x,y,depth,obj_roomtarget)

roomtarget.enID = enID

transitioncode = function() {
	
}