randomize()

if !active
	chance = irandom_range(0,20)

if chance = 0 {
	if !active {
		active = true
		lastroom = global.currentroom + irandom_range(5,20) 
	}
}

if active = true {
	if global.currentroom = lastroom {
		active = false	
	}
	
	
	if !instance_exists(obj_sleepy) {
		mysleepy = instance_create_depth(0,0,depth,obj_sleepy)	
	}
}