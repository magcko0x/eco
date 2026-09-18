depth = 5000
frame = 0
opendoor = false

lockshake_strength = 0
doorshake_strength = 0
doorshakex = 0
lockshakex = 0

roomgoto = 0
target_x = 0
target_y = 0
enID = 0

var next_room = clamp(global.currentroom + 1,0,array_length(global.rooms)-1)

if is_struct(global.rooms[next_room]) {
	target_rm = global.rooms[next_room].room_asset
} else {
	target_rm = rm_start	
}

transitionspeed = 30

cursor = 1
deac = false

transitioncode = function() {
	
}

prevcharge = charge
alarm[0] = 5