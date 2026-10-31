if global.interact {
	player_obj = instance_nearest(x, y, obj_player)

	if instance_exists(player_obj) {
		timer_multiplier = (player_obj.safe) ? 5 : 1
	}

	if bun_spawn_active {
		if bun_spawn_timer > 0 {
			bun_spawn_timer -= timer_multiplier
		} else {
			var _bun = instance_create_depth(obj_roomtarget.x, obj_roomtarget.y, depth, obj_bun)
			_bun.owner = id
			
			bun_spawn_timer = 9999
		}
	}

	if instance_exists(player_obj) {
		player_obj.shaking = bun_active
	}

	if (bun_gone && alarm[0] == -1) {
		alarm[0] = 1
	}

	if debug_mode {
		if keyboard_check_pressed(vk_f1) {
			var _bun = instance_create_depth(obj_hand.x, obj_hand.y, depth, obj_bun)
			_bun.owner = id
		}
	}
}