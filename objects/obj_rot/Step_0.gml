setdepth()
var ipx, ipy, player;
player = instance_nearest(x,y,obj_player)

ipx = player.x
ipy = player.y

audio_emitter_position(emitter, x, y, 0);

if spd < maxspd {
	spd += 0.25
} else {
	spd -= 1	
}

if point_distance(x,y,ipx,ipy) <= 64 * 2 {
	
	maxspd = 12
	
	audio_stop_sound(farawaysfx)
    
	if !audio_is_playing(closesfx) {
		closesfx = audio_play_sound_on(emitter,snd_rot_mouthopen,true,0)
    }
    
	image_index = 1
} else {
	
	maxspd = 8
	
    audio_stop_sound(closesfx)
    		
	if !audio_is_playing(farawaysfx) {
		farawaysfx = audio_play_sound_on(emitter,snd_rot_mouthclosed,true,0)
    }
    
	image_index = 0
}

if global.interact {
	
	part_particles_burst(psystem[0],x,y,part_flies)
		
	part_system_depth(psystem[0],depth)
	
	var xdiff = ipx-x;
	var ydiff = ipy-y;
	var dir = point_direction(x,y,ipx,ipy);
	var dist = point_distance(x,y,ipx,ipy);
	x += lengthdir_x(min(spd,abs(xdiff)),dir);
	y += lengthdir_y(min(spd,abs(ydiff)),dir);
	
	if instance_exists(obj_rottimer) {
		if CLICKED || obj_rottimer.timer > 0 {
			die()
		}
	} else {
		if CLICKED {
			die()
		}		
	}
	
	if place_meeting(x,y,player) {
		if player.state != player.dead {
			global.diedto = "rot"
			player.state = player.dead
		}
	}	
}