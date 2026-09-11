
var chancer, xx, yy
		
randomize()
chancer = irandom(3) 

switch chancer { 
    case 0: 
        xx = sprite_width 
        yy = sprite_height 
        break
		
	case 1:
		xx = room_width - sprite_width
		yy = 0 + sprite_height
		break
		
    case 2: 
        xx = room_width - sprite_width 
        yy = room_height - sprite_height 
        break
    
    case 3: 
        xx = sprite_width 
        yy = room_height - sprite_height 
        break
}
	
var meow = meowcounter > 3 ? instance_create_depth(xx,yy,depth,choose(obj_meow,obj_purr)) : instance_create_depth(xx,yy,depth,obj_meow)

if meowsleft > 0 {
    meowsleft--
    alarm[0] = 20
}

meow.owner = self

mymeows[clamp(array_length(mymeows) - 1,0,999)] = meow