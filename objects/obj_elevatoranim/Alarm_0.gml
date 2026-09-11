global.currentroom = 0
if !instance_exists(obj_roomgenerator) {
	instance_create_depth(x,y,depth,obj_roomgenerator)	
}
state = "open"