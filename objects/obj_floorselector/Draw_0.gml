if instance_exists(obj_floorselector_head) {
	if mode = 0 {
	    if obj_floorselector_head.index + 1 <= array_length(obj_floorselector_head.available_floors) - 1 { 
	        draw_selected()
	        cursor = 1
	        deac = false
	    } else deac = true
	}
    
	if mode = 1 {
	    if obj_floorselector_head.index - 1 >= 0 { 
	        draw_selected()
	        deac = false
	    } else deac = true
	}
}

draw_self()