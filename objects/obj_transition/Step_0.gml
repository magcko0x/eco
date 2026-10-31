if usetarget {
	var instnum = instance_number(obj_roomtarget)
	for (var i = 0; i < instnum; i++) {
		var inst = instance_find(obj_roomtarget, i);
		if (instance_exists(inst)) {
			if inst.enID = enID {
				target_x = inst.x
				target_y = inst.y
				break
			}
		}
	}
}

if (fade_out)
{
	current_alpha += 1 / fade_duration_in_steps
	global.interact = false
	
	if skipfade current_alpha = 1
	
	if (current_alpha >= 1)
	{
		global.interact = true
		
		fade_out = false;
		
		if changecurrentroom {
			global.currentroom = currentroom	
		}
		
		switch roomgoto {
			case 0:
				room_goto(target_rm)
				
				break;
		
			case 1:
				room_restart()
				break;
		}
	}
}
else {
	current_alpha -= 1 / fade_duration_in_steps
	
	if !teleported {
		if extraparams {
			obj_player.x = target_x;
			obj_player.y = target_y;
		}
		
		if usetarget {
			var instnum = instance_number(obj_roomtarget);
			for (var i = 0; i < instnum; i++)
			{
			    var inst = instance_find(obj_roomtarget, i);
			    if (instance_exists(inst))
			    {
					if inst.enID = enID {
						obj_player.x = inst.x
						obj_player.y = inst.y
						
						if changedir {
							obj_player.xdir = xdir
							obj_player.ydir = ydir
						}
					}
			    }
			}
		}
		
		teleported = true
	}
	
	
	if (current_alpha <= 0)
	{
		global.interact = true
		instance_destroy()
	}
}