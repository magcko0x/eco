setdepth()

if CLICKED && global.interact {
	
	if !instance_exists(obj_transition) {
		
		audio_play_sound(snd_dooropen,0,false,1,0,random_range(0.7,1.2))
		
		global.interact = false
		
		var tran = instance_create_depth(0, 0, -10000, obj_transition)
		
		tran.usetarget = false
		tran.target_rm = rm_costume_maker
		tran.skipfade = true
	}
}