image_index = open;
setdepth();

var player = instance_nearest(x, y, obj_player);

if (!open) {
	if (instance_exists(player) && player.visible == false) {
		if (instance_exists(obj_soulline)) {
			obj_soulline.visible = false;
		}
	}
	
	if timer > 0 {
		timer -= 2
	} else if timer < 0 {
		timer = 0
	}	
} else {
	
	var keypresses = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D")) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(ord("S"))
	
	if keypresses && obj_hand.state = obj_hand.free{
		player.safe = false;
		player.visible = true
		if instance_exists(obj_soulline)
			obj_soulline.visible = true
		audio_play_sound_at(snd_dooropen, x, y, 0, 200, 300, 1, false, 0);
		open = !open
		player.active = true
		player.y = y + 64;
	}
	
	if timer < maxtimer {
		timer += 0.25
	}
}

if timer == maxtimer {
	obj_player.state = obj_player.dead
	global.diedto = "mites"
}

if timer > 0 {
	if !audio_is_playing(closetsound) {
		closetsound = audio_play_sound(snd_rot_mouthclosed,0,true,timer,1)
	}
	
	audio_sound_gain(closetsound,timer/maxtimer)
} else {
	if closetsound != -1 {
		audio_stop_sound(closetsound)
		closetsound = -1
	}
}
	



if (CLICKED) {
	open = !open;
	
	audio_play_sound_at(snd_dooropen, x, y, 0, 200, 300, 1, false, 0);
	
	if (instance_exists(player)) {
		player.safe = open;
		player.visible = !open;
		
		if (open) {
			
			player.x = x;
			player.y = y;
			
			if (variable_instance_exists(player, "locker")) {
				if (instance_exists(player.locker) && player.locker != id) {
					player.locker.open = false;
					timer = player.locker.timer
					player.locker.timer = 0
				}
			}
			
			player.active = false
			
		} else {

			player.active = true
			player.y = y + 64;
		}
		
		player.locker = id; 
	}
	
	if (instance_exists(obj_soulline)) {
		obj_soulline.visible = !open;
	}
}