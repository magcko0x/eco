setdepth()

if global.interact {
	var player = instance_nearest(x, y, obj_player)
	
	if (instance_exists(player)) {
		
		// 1. TARGETING LOGIC
		if !player.safe {
			// Player is exposed: Actively track them and update direction
			ipx = player.x
			ipy = player.y
			ipd = point_direction(x, y, ipx, ipy)
		}
			
		// 2. SPEED ACCELERATION / DECELERATION
		if spd < maxspd {
			spd = min(spd + 0.25, maxspd)
		} else if spd > maxspd {
			spd = max(spd - 0.5, maxspd)
		}
		
		// 3. AUDIO AND VISUAL STATES
		if !player.safe {
			if point_distance(x, y, ipx, ipy) <= 64 * 4 {
				maxspd = 8
		
				audio_stop_sound(farawaysfx)
				if !audio_is_playing(closesfx) {
					closesfx = audio_play_sound_at(snd_bunambience, x, y, 0, 600, 900, 1, false, 0)
				}
				image_index = 1
			} else {
				maxspd = 2
		
				audio_stop_sound(closesfx)
				if !audio_is_playing(farawaysfx) {
					farawaysfx = audio_play_sound_at(snd_bunambience, x, y, 0, 600, 900, 1, false, 0,1,0,0.5)
				}
				image_index = 0
			}
		} else {
			// Player is safe: Force non-hostile passive speed and sounds
			maxspd = 2
		
			audio_stop_sound(closesfx)
			if !audio_is_playing(farawaysfx) {
				farawaysfx = audio_play_sound_at(snd_rot_mouthclosed, x, y, 0, 600, 900, 1, false, 0)
			}		
			image_index = 0
		}

		// 4. KILL CONDITION
		if !player.safe && place_meeting(x, y, player) {
			if !player.protected {
				instance_destroy(obj_unbornhandler)
			}
			
			global.diedto = "unborn"
			player.state = player.dead
		}

		// 5. APPLY POSITION CHANGES (Using the locked ipd angle when player is safe)
		x += lengthdir_x(spd, ipd)
		y += lengthdir_y(spd, ipd)
		
		// --- 6. ROOM EDGE DETECTION ---
		// Check if our bounding box is anywhere inside the room boundaries
		
		var padding = 196
		
		var is_in_room_now = (bbox_right >= -padding && bbox_left <= room_width + padding && bbox_bottom >= -padding && bbox_top <= room_height + padding);
		
		// TRIGGER: Was in the room last frame, but completely left it this frame
		if (was_on_screen && !is_in_room_now) {
			
			if instance_exists(obj_unbornhandler) {
				// Detect which room border we crossed
				if (bbox_right < -padding) {
					exit_edge = "left"
				}
				else if (bbox_left > room_width + padding) {
					exit_edge = "right"
				}
				else if (bbox_bottom < -padding) {
					exit_edge = "top"
				}
				else if (bbox_top > room_height + padding) {
					exit_edge = "bottom"
				}
			
				// --- EXECUTE YOUR ROOM EXIT CODE HERE ---
				show_debug_message("LEFT ROOM VIA THE " + string_upper(exit_edge) + " EDGE!")
			
				if exit_edge = "left" {
					obj_unbornhandler.backstagex--
				} else if exit_edge = "right" {
					obj_unbornhandler.backstagex++
				}
			
				if exit_edge = "up" {
					obj_unbornhandler.backstagey--
				} else if exit_edge = "down" {
					obj_unbornhandler.backstagey++
				}
			
			
				obj_unbornhandler.wandering = true
				obj_unbornhandler.wanderingcounter = 60
				
			}
			
			instance_destroy()
			
		}
		
		// Update historical check for next frame
		was_on_screen = is_in_room_now		
	}
}