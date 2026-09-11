if global.interact {
	if timer > 0 {
		timer--	
	}

	if !instance_exists(obj_rot) && timer <= 0 && alarm[0] = -1 {
		spawnsounds = [snd_rot_backagain,snd_rot_secondtime,snd_rot_laugh]			
		
		if prevtimer != 0 {
			spawnsounds = [snd_rot_imhere,snd_rot_laugh,snd_rot_medicated]			
		}
		
		alarm[1] = 20
		
		alarm[0] = 120
	}
	
	if timer > 0 {
		alarm[1] = -1
		alarm[0] = -1
	}

}

prevtimer = timer

if !instance_exists(obj_rothandler)
	instance_destroy()