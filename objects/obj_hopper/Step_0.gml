setdepth()

if global.interact {
	
	var collides = tag_get_asset_ids("solid",asset_object)
	
	var xmove = lengthdir_x(spd,dir)
	var ymove = lengthdir_y(spd,dir)
	
	move_and_collide(xmove,ymove,collides)
	
	var empty = true
	for (var i = 0; i < array_length(obj_playerhandler.playerinventory);i++) {
		if obj_playerhandler.playerinventory[i] != -1 {
			empty = false
			break;
		}
	}
	
	if !empty && item = -1 {
		if place_meeting(x,y,obj_player) {
			var slot = irandom(array_length(obj_playerhandler.playerinventory)-1)
			item = obj_playerhandler.playerinventory[slot]
			obj_playerhandler.playerinventory[slot] = -1
		}
		facing = 1	
	} else facing = -1
	
	if item != previtem {
		audio_play_sound(snd_hoppercroak,0,false,2,0,random_range(0.7,1.2))	
	}
	
	z += zspd
	
	if z > 0 {
		spd = 0
		z = 0
		zspd = 0
		
	} else {
		if zspd < 10 {
			zspd += grav	
		}		
	}
	
	if z = 0 {
		
		if z != prevz {
			audio_play_sound_at(snd_splat,x,y,0,300,600,1,false,0,1,0,random_range(0.4,1))
		
		}
		
		if alarm[0] = -1
			alarm[0] = irandom_range(20,60)
	}
	
	if z < 0 {
		image_xscale += zspd / 64
		image_yscale -= zspd / 64
	
		image_yscale = clamp(image_yscale,0.5,1.5)
		image_xscale = clamp(image_xscale,0.5,1.5)
	} else {
		image_yscale = 1
		image_xscale = 1
	}
	if z < 0 image_index = 1 else {
		image_index = 0
	}
	//image_angle = point_direction(x,y+z,x+xspd,y+yspd+z+zspd)
	
	if CLICKED {				
		audio_play_sound(snd_punch,0,false,1,0,random_range(0.7,1.2))
		instance_create_depth(x,y,-10000,obj_flash)
		instance_destroy()
	}
	
	prevz = z
	
	previtem = item
}