

mymeows = -1

if !active {
	chance = irandom(5)
}

if chance = 0 {
	if !active {
		active = true
		lastroom = global.currentroom + irandom_range(3,5)
	}
}

if active = true {
	
	meowcounter++
	
    meowsleft = clamp(meowcounter,0,8)
    
    alarm[0] = 20
    
	if global.currentroom = lastroom {
		meowcounter = -1
        active = false
	} 
}