if !instance_exists(obj_transition) {
		var tran = instance_create_depth(0,0,-8000,obj_transition)
		
		if !global.backfromdeath {
			tran.usetarget = true
			tran.enID = 0 
			tran.roomgoto = 0
			tran.target_rm = rm_lobby_start
		} else {
			tran.usetarget = true
			tran.enID = 1
			tran.roomgoto = 0
			tran.target_rm = rm_lobby_pre_elevator
			global.backfromdeath = false
		}
}