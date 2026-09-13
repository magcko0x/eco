if !DRAGGED {
	image_angle = lerp(image_angle,0,0.3)	
}


if !returning {
	if !DRAGGED {
		cursor = 1
		
		if CLICKED {
			obj_hand.grabbedobj = id	
		}
	}

	if DRAGGED {
		image_angle = lerp(image_angle,-45,0.3)
	
		cursor = 9
		
		var wateredinst = instance_place(x + 30, y + 24,tag_get_asset_ids("waterable",asset_object))
		
		if variable_instance_exists(wateredinst,"watered") {
			wateredinst.watered = true	
		}

		x = obj_hand.x
		y = obj_hand.y
	} 
	else if RELEASED{
		
		returning = true
		deac = true
		if (obj_hand.prevgrabbedobj == id) {
			obj_hand.grabbedobj = noone
		}
	}
} else {
	
	if point_distance(x,y,xstart,ystart) > 0.2 {
		x = lerp(x,xstart,0.2)
		y = lerp(y,ystart,0.2)
	} else {
		x = xstart
		y = ystart
		
		deac = false
		returning = false
	}
	
}

mylight.x = x
mylight.y = y

audio_emitter_position(emitter,x,y,0)