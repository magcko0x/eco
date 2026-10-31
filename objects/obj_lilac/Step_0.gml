var player = instance_nearest(x,y,obj_player)

setdepth()

if !angry {
	if instance_exists(player) {
		if point_distance(x,y,player.x,player.y) < radius {
		
			max_shake_strength_x = lerp(max_shake_strength_x,(maxtime - timer) / 100,0.1)
			
			var target_gain = (maxtime - timer) / 1000
			emitter_vol = lerp(emitter_vol, target_gain, 0.1)
			audio_emitter_gain(emitter, emitter_vol)
	
			if timer > 0
				timer--
		} else {
		
			max_shake_strength_x = lerp(max_shake_strength_x,0,0.1)
		
			if timer < maxtime
				timer++
		
			emitter_vol = lerp(emitter_vol, 0, 0.1)
			audio_emitter_gain(emitter, emitter_vol)
		}
	}

	if timer < 100 {
		sprite_index = spr_lilac_shy_big
	} else {
		sprite_index = spr_lilac_calm_big
	}

	if timer == 0 {
		max_shake_strength_x = 6
		angry = true
		audio_stop_sound(current_sound)
		current_sound = audio_play_sound_on(emitter,snd_lilac_scream,true,0,1)
		emitter_vol = 0.8
		audio_emitter_gain(emitter,emitter_vol)
	}
} else {
	sprite_index = spr_lilac_aggressive_big
	
	var _dir = point_direction(x,y,player.x,player.y)
	
	hspd = lerp(hspd,lengthdir_x(8,_dir),accel)
	vspd = lerp(vspd,lengthdir_y(8,_dir),accel)

	x += hspd
	y += vspd
	
	if place_meeting(x,y,obj_player) {
		if player.state != player.dead {
			global.diedto = "lilac"
			player.state = player.dead
		}	
	}
}

audio_emitter_position(emitter, x, y, 0)

mylight.x = x
mylight.y = y