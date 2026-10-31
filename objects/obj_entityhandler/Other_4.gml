var entitylist = []

switch global.floor {
	
	case "floor_industry":
		entitylist = [
			{ obj: obj_rothandler, min_room: 0, max_room: 100 },
			{ obj: obj_mothervirushandler, min_room: 0, max_room: 100 },
			{ obj: obj_bunhandler, min_room: 10, max_room: 100 },
			{ obj: obj_tendrilhandler, min_room: 10, max_room: 100 },
			{ obj: obj_myxohandler, min_room: 51, max_room: 100 },
			{ obj: obj_shihandler, min_room: 51, max_room: 100 }
		]
	break
    
	case "floor_floating_plateau":
		entitylist = [
			{ obj: obj_rothandler, min_room: 0, max_room: 100, create_func: function() { obj_rottimer.timer = MINUTE * 2 } },
			{ obj: obj_mothervirushandler, min_room: 1, max_room: 100 },
			{ obj: obj_bunhandler, min_room: 9, max_room: 100 },
			{ obj: obj_tumblerhandler, min_room: 9, max_room: 100 },
			{ obj: obj_tendrilhandler, min_room: 9, max_room: 100 },
			{ obj: obj_meowhandler, min_room: 20, max_room: 100 },
			{ obj: obj_lilachandler, min_room: 20, max_room: 100 },
			{ obj: obj_timhandler, min_room: 20, max_room: 100 },
			{ obj: obj_hopperhandler, min_room: 20, max_room: 100 },
			{ obj: obj_shihandler, min_room: 40, max_room: 100 },
			{ obj: obj_myxohandler, min_room: 50, max_room: 100 }
		]
	break
	
	case "floor_backstage":
		entitylist = [
			{ obj: obj_unbornhandler, min_room: 0, max_room: 100 }
		]
	break
}

for (var i = 0; i < array_length(entitylist); i++) {
	var entry = entitylist[i]

	if global.currentroom >= entry.max_room || global.currentroom < entry.min_room {
		with (entry.obj) {
			instance_destroy()
		}
	} else {
		if !instance_exists(entry.obj) {
			var handler = instance_create_depth(x, y, depth, entry.obj)
			
			if variable_struct_exists(entry, "create_func") {
				entry.create_func()
			}
		}
	}
}