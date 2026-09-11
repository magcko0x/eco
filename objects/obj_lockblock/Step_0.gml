#macro RANINTO2 (point_in_rectangle(obj_player.x,obj_player.y,x - sprite_width - 5,y - sprite_width - 5,x + sprite_width + 5,y + sprite_height + 5) && obj_player.spd >= 10 && obj_player.moving)

setdepth()

if (CLICKED || RANINTO2) && lock && state = "free"{
	
	if obj_playerhandler.key && obj_playerhandler.keycolor = image_blend {
		deac = true
		state = "open"
		obj_playerhandler.key = false
	} else {
		shake_strength = 4
		closesfx = audio_play_sound_at(snd_lockdoor,x,y,0,300,600,1,false,0)	
	}
	
}

if state = "open" {
	if alarm[0] = -1 alarm[0] = 5
	
	drawyscale -= 0.1
	if drawyscale <= 0 {
		instance_destroy()	
	}
}

if prevstate = "free" && state = "open" {
	opensfx = audio_play_sound_at(snd_lockdoor,x,y,0,300,600,1,false,0,2,0,random_range(1,1.5))
}

prevstate = state