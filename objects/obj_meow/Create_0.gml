event_inherited()
owner = noone

spd = 0
cursor = 6
closesfx = -1
farawaysfx = -1

offx = irandom_range(-8,8)
offy = irandom_range(-8,8)

state = "FREE"

defframe = irandom_range(2,4)

mylight = instance_create_depth(x,y,depth,obj_light)
mylight.owner = self
mylight.radius = 42

mypointer = instance_create_depth(x,y,depth,obj_pointer)
mypointer.owner = self

shake_strength = 0
maxshakestrength = 4

add = 0


    var chancer
    		
    
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
    
	
save_entity_to_cafeteria("meow")

layer_create(depth,"Particles")
psystem = part_system_create_layer("Particles",false)