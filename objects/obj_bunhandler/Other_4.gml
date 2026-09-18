go_ahead = global.currentroom != -1

var total_rooms = array_length(global.rooms)

var important_rooms = tag_get_asset_ids("room_important", asset_room)

if go_ahead {
	for (var i = 0; i < 6; i++) {
		var check_idx = global.currentroom + i
		if check_idx < total_rooms {
			if array_contains(important_rooms, global.rooms[check_idx].room_asset) {
				go_ahead = false
				break
			}
		}
	}
}

if !still_here {
	if go_ahead && irandom(bun_spawn_chance) == 0 {
		bun_active = true
		bun_spawn_active = true
	}
    
	if bun_spawn_active && !room_replaced {
		
		var safe_room_check = false
		var safe_rooms_base = tag_get_asset_ids("room_safe", asset_room)
		
		for (var i = 0; i < 4; i++) {
			var check_idx = global.currentroom + i
			if check_idx < total_rooms {
				if array_contains(safe_rooms_base, global.rooms[check_idx].room_asset) {
					safe_room_check = true
					break
				}
			}
		}
		
		if !safe_room_check {
			
			var target_room = global.currentroom + 3
			
			if target_room < total_rooms {
				var room_to_replace = global.rooms[target_room].room_asset
				var room_to_replace_tags = asset_get_tags(room_to_replace, asset_room)
				
				var safe_rooms_pool = []
				
				for (var i = 0; i < array_length(safe_rooms_base); i++) {
					if asset_has_tags(safe_rooms_base[i], room_to_replace_tags, asset_room) {
						array_push(safe_rooms_pool, safe_rooms_base[i])
					}
				}
			
				if array_length(safe_rooms_pool) > 0 {
					var random_index = irandom(array_length(safe_rooms_pool) - 1)
					global.rooms[target_room].room_asset = safe_rooms_pool[random_index]
					room_replaced = true
				}
			}
			
		} else {
			room_replaced = true	
		}
		
	}
} else {
	bun_spawn_active = true
	room_block = false
	bun_spawn_timer = timer_still_here
	timer_multiplier = 5
}