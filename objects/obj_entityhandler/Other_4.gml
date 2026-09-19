if !global.inbackstage {
	switch global.floor {
	
		case "floor_industry":
		
			entitylist = [
				[obj_rothandler, -1],
				[obj_mothervirushandler, -1],
				[obj_bunhandler, 9],
				[obj_tendrilhandler, 9],
				[obj_myxohandler, 49],
				[obj_shihandler, 49],
			]
		
			if !(room = rm_elevator) || !global.currentroom > -1 {
			
				for (var i = 0; i < array_length(entitylist); i++) {
					if global.currentroom > entitylist[i][1] {
						if !instance_exists(entitylist[i][0])
							instance_create_depth(x,y,depth,entitylist[i][0])
		            }
				}
		
			}

	    break;

	    case "floor_floating_plateau":
        
			entitylist = [
				[obj_rothandler, -1],
				[obj_mothervirushandler,1],
				[obj_bunhandler,9],
				[obj_tumblerhandler,9],
				[obj_tendrilhandler,9],
				[obj_meowhandler,20],
				[obj_timhandler,20],
				[obj_hopperhandler,20],
				[obj_shihandler,40],
				[obj_myxohandler,50],
			]
		
	        if !(room = rm_elevator) || !global.currentroom > -1 {
				for (var i = 0; i < array_length(entitylist); i++) {
					if global.currentroom >= entitylist[i][1] {
						if !instance_exists(entitylist[i][0]) {
							var handler = instance_create_depth(x,y,depth,entitylist[i][0])
						
							if handler.object_index = obj_rothandler {
								obj_rottimer.timer = MINUTE * 2
							}
						}
		            }
				}	
			}
        
	    break;
	}
}

if global.inbackstage {
	entitylist = [
				obj_rothandler,
				obj_unbornhandler
			]
			
	for (var i = 0; i < array_length(entitylist); i++) {
		if !instance_exists(entitylist[i]) instance_create_depth(x,y,depth,entitylist[i])	
	}
}

if !global.inbackstage
	alarm[0] = 5