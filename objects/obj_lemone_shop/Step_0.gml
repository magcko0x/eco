setdepth()

if CLICKED && global.interact {
	
	if !instance_exists(obj_transition) {
		
		global.interact = false
		
		var tran = instance_create_depth(0, 0, -10000, obj_transition)
		
		tran.usetarget = false
		tran.target_rm = rm_lemone_shop
		tran.skipfade = true
	}
}