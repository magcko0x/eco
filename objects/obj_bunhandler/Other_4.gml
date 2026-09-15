go_ahead = (global.currentroom != -1)

var total_rooms = array_length(global.rooms)

if go_ahead {
	for (var i = 0; i < 6; i++) {
			var check_idx = global.currentroom + i
			if check_idx < total_rooms {
				if array_contains(global.importantroomslist, global.rooms[check_idx]) {
					go_ahead = false
				break
			}
		}
	}
}

if !still_here {
	if go_ahead && irandom(bun_spawn_chance) = 0 {
		bun_active = true
		bun_spawn_active = true
	}
    
	if bun_spawn_active && !room_replaced {
		
		var safe_room_check = false
		
		for (var i = 0; i < 4; i++) {
				var check_idx = global.currentroom + i
				if check_idx < total_rooms {
					if array_contains(global.saferoomslist, global.rooms[check_idx]) {
						safe_room_check = true
					break
				}
			}
		}
		
		if !safe_room_check {
			
			var target_room = global.currentroom + 3
		
			if target_room < total_rooms {
				var random_safe = irandom(array_length(global.saferoomslist) - 1)
				global.rooms[target_room] = global.saferoomslist[random_safe]
				room_replaced = true
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