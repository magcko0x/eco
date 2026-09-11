if global.interact {
	
	mask_index = sprite_index
	on = (point_distance(x,y,obj_hand.x,obj_hand.y) < 97 && (obj_hand.state = obj_hand.free) && !place_meeting(x,y,tag_get_asset_ids("movingentity",asset_object)))
	
	if on != prevon {
		if on {
			audio_play_sound_at(snd_lever, x, y, 0, 200, 300, 1, false, 0,0.5,0,random_range(0.7,1))
		} else {
			audio_play_sound_at(snd_lever, x, y, 0, 200, 300, 1, false, 0,0.5,0,random_range(0.3,0.5))
		}
	}
	
	if !on {
		if (image_index < sprite_get_number(sprite_index) - 1) {
			image_speed = 1
		} else {
			image_speed = 0	
		}
	} else {
		if (image_index > 0) {
			image_speed = -1
		} else {
			image_speed = 0	
		}
	}

	if image_index < (sprite_get_number(sprite_index) - 1) {
		setdepth()
		mask_index = sprite_index
	} else {
		depth = 5000
		mask_index = spr_null	
	}
	
	if mask_index = sprite_index {
		var entity = instance_place(x,y,tag_get_asset_ids("movingentity",asset_object))
		
	if (entity != noone) {
	var collidables = tag_get_asset_ids("solid", asset_object);

	var my_type_index = array_get_index(collidables, object_index);
        
	if (my_type_index != -1) {
		array_delete(collidables, my_type_index, 1);
	}			
            
	        // Push direction: directly away from center (removed +90)
	var dir = point_direction(x, y, entity.x, entity.y);

	while (place_meeting(x, y, entity)) {
		var prev_x = entity.x;
		var prev_y = entity.y;

			// Try to move X
		var dx = lengthdir_x(1, dir);
		if (!place_meeting(entity.x + dx, entity.y, collidables)) {
					entity.x += dx;
				}

				// Try to move Y
				var dy = lengthdir_y(1, dir);
				if (!place_meeting(entity.x, entity.y + dy, collidables)) {
					entity.y += dy;
				}
				
	            if (entity.x == prev_x && entity.y == prev_y) break
	            if (point_distance(x, y, entity.x, entity.y) > 64) break;
	        }
	    }
	}
	
	prevon = on
}