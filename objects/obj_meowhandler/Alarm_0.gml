
var chancer, xx, yy
		

chancer = irandom(3) 

var _spacing = 128

switch chancer { 
    case 0: 
        xx = -_spacing 
        yy = -_spacing 
        break
		
	case 1:
		xx = room_width + _spacing
		yy = 0 - _spacing
		break
		
    case 2: 
        xx = room_width + _spacing 
        yy = room_height + _spacing 
        break
    
    case 3: 
        xx = -_spacing 
        yy = room_height + _spacing 
        break
}
	
var meow = meowsleft > 3 ? instance_create_depth(xx,yy,depth,choose(obj_meow,obj_purr)) : instance_create_depth(xx,yy,depth,obj_meow)

if meowsleft > 0 {
    meowsleft--
    alarm[0] = 20
}

meow.owner = self

mymeows[clamp(array_length(mymeows) - 1,0,999)] = meow