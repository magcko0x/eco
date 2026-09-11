setdepth()


if global.interact
	
	if !audio_is_playing(ambsfx) && !goaway
		ambsfx = audio_play_sound_at(snd_tendril_ambience,x,y,0,200,400,1,true,0,1,random(1))
	
	if harmless {
		if iframe > 0 {
			iframe--
		
			image_alpha = flicker(2)
	
			if iframe <= 0 {
				harmless = false
			}
		}
	}
	
	if place_meeting(x,y,obj_hand) && !goaway && obj_hand.state != obj_hand.disabled && !harmless {
		obj_hand.state = obj_hand.disabled
		obj_hand.shake_strength = 4
		var hitsfx = audio_play_sound_at(snd_tentacle_hit,x,y,0,200,400,1,false,0,1,0,random_range(0.5,2))
		audio_play_sound(snd_hand_disable,0,false)
		goaway = true
	}

	if goaway {
		lerper += 0.5
		
		if image_xscale < 1.75
			image_xscale += 0.15
		
		if image_yscale > 0.25
			image_yscale -= 0.15
		
		image_alpha -= 0.25
	
		if image_alpha <= 0 {
			instance_destroy()
			audio_stop_sound(ambsfx)
		}
	}