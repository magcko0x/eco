if !array_contains(global.unlockedentities,"myxo") {
	instance_destroy()
}

step_func = function() {
	if !variable_instance_exists(id,"spd") {
		spd = 2
		walktimer = 50
		walking = false
		movex = 0
		movey = 0
		movedir = 0
	}
		
	if global.interact {
		if walktimer > 0 {
			walktimer--	
		} else {
			walking = !walking
			
			movedir = irandom(360)
			movex = lengthdir_x(spd,movedir)
			movey = lengthdir_y(spd,movedir)
			
			walktimer = walking ? irandom_range(100,300) : irandom_range(5,20)	
		}
		
		if walking {
			if point_distance(x + movex,y + movey,xstart,ystart) < 64 {
				move_and_collide(movex,movey,tag_get_asset_ids("solid",asset_object))
			} else {
				walking = !walking
				walktimer = 60	
			}
		}
		
		if x != xprevious || y != yprevious {
			image_speed = 1 / spd
		} else {
			image_index = 0
			image_speed = 0
		}
		
		if (image_index >= image_number - 1) {
			if (!sound_triggered) {
				sound_triggered = true
				audio_play_sound_at(snd_myxo_step, x, y, 0, 64, 128, 1, false, 0,1,0,random_range(0.7,1.2));
			}
		} else if (image_index < 1) {
				// Unlock it only when the animation loops back to the start
				sound_triggered = false;
		}
	} else {
		image_index = 0
		image_speed = 0			
	}
		
		
	var chancer = irandom(120)
		
	if chancer = 0 {
		audio_play_sound_at(snd_myxo_call, x, y, 0, 64, 128, 1, false, 0);
	}
		
	mylight.x = x
	mylight.y = y - 24	
}

textlist =
[
	[
		""
	]
]