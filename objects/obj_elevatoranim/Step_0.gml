if state = "free"{

}

if state = "start"{
	global.interact = false
	if offset > 0
		offset -= 1	
	
	if offset = 0 && alarm[0] = -1
		alarm[0] = 100
}

if state = "open" {
	if offset < 16
		offset += 1	
	
	if offset = 16 {
		global.interact = true
		
		instance_destroy(obj_elevatordoor)
		
		if instance_exists(obj_roomwarp) {
			with obj_roomwarp {
                if global.rooms[0] != -1 || global.floor < global.ultmaxfloor{
                    target_rm = global.rooms[0].room_asset
                    enID = 0
                } else {
                    target_rm = rm_lobby_pre_elevator
                    enID = 1
                    global.floor = -1
                }
			}
		}
		state = "free"
	}
}