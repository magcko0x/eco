var player = instance_nearest(x, y, obj_player)
var distance = point_in_rectangle(obj_player.x, obj_player.y, x, y, x + 32, y + 40)
var myself = self

if global.interact {
	current_zoom = obj_processor.current_zoom
	
	charge = clamp(charge, 0, 3)

	if frame != 1 {
		
		if charge != prevcharge && charge == 3 {
			audio_play_sound_at(snd_powerdown, x, y, 0, 200, 400, 1, false, 0)
		}
		
		if charge > 0 {
			if CLICKED || RANINTO {
				if !locked {
					global.interact = false
					audio_play_sound_at(snd_dooropen, x, y, 0, 200, 400, 1, false, 0)
					opendoor = true
				} else {
					if obj_playerhandler.key {
						doorshake_strength = 4
						obj_playerhandler.key = false
						locked = false	
						audio_play_sound_at(snd_lockdoor, x, y, 0, 200, 400, 1, false, 0)
					} else if !RANINTO {
						lockshake_strength = 4
						audio_play_sound_at(snd_lockdoor, x, y, 0, 200, 400, 1, false, 0)
					}
				}
			}
		}
	}
	
	prevcharge = charge
}

if frame == 1 {
	if !instance_exists(obj_transition) {
		global.interact = false
		
		var tran = instance_create_depth(0, 0, -8000, obj_transition)
		
		transitioncode()
		
		var next_room = clamp(global.currentroom + 1,0,array_length(global.rooms)-1)
		
		if is_struct(global.rooms[next_room]) {
			if global.rooms[next_room].room_asset == target_rm {
				global.currentroom += 1
			}		
		}
		
		tran.usetarget = true
		tran.enID = enID 
		tran.roomgoto = roomgoto
		tran.target_rm = target_rm
		tran.fade_duration_in_steps = transitionspeed
	}
}