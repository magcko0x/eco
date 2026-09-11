randomize()

if !active
	chance = irandom_range(0,10)

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
	
	
	alarm[0] = 20
}