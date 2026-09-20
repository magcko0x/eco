setdepth(32)

deac = instance_exists(mytalker)

if !talkedto {
	if !randomtext {
		if point_distance(x,y,obj_player.x,obj_player.y) < 128 {
			spawntext()
		}
	} else {
		if CLICKED {
			spawntext()	
		}
	}
}

var frequency,amplitude

frequency = 0.01
amplitude = 5

timer += frequency;

var y_offset = sin(timer) * amplitude;

y = ystart + y_offset

/*
if !instance_exists(obj_sunflowertalker) {
	if place_meeting(x,y,obj_hand) && point_distance(obj_hand.x,obj_hand.y,obj_hand.xprevious,obj_hand.yprevious) > 24 {
		expression = "horny"
		
		shakesound = audio_play_sound(snd_myxo_chase,0,false,1,0,random_range(1.8,2.4))
		
		var part = part_system_create(part_sweat)
		
		part_system_clear(part)
		
		part_particles_burst(part,obj_hand.x,obj_hand.y,part_sweat)
		
		part_system_depth(part,-9000)
		
			
	} else {
		audio_stop_sound(shakesound)
		if alarm[1] = -1 alarm[1] = 300	
	}
}
*/

switch expression {
	
	case "default":
		eyesprite = spr_sunnyeye
		mouthsprite = spr_sunnymouth	
	break;

	case "frown":
		eyesprite = spr_sunnyeye
		mouthsprite = spr_sunnymouthsad	
	break;
	
	case "sad":
		eyesprite = spr_sunnyeyesad
		mouthsprite = spr_sunnymouthsad
	break;
	
	case "angry":
		eyesprite = spr_sunnyeyeangry
		mouthsprite = spr_sunnymouthsad
	break;
	
	case "mischievious":
		eyesprite = spr_sunnyeyeangry
		mouthsprite = spr_sunnymouth
	break;
	
	case "horny":
		eyesprite = spr_sunnyyeye
		mouthsprite = spr_sunnymotuh
	break;
	
	case "surprised":
		eyesprite = spr_sunnyeyesurprised
		mouthsprite = spr_sunnymouthsurprised
	break;
	
	case "laughing":
		eyesprite = spr_sunnyeye_closed
		mouthsprite = spr_sunnymouth
	break;	
}