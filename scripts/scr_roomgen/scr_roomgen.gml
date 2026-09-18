//Room generation thingies
global.rooms = array_create(101,-1)
global.darkrooms = array_create(101,false)


function reset_rooms() {
	global.rooms = []
}

function entity_picker() {
	
	var entitylist;
	
	entitylist = [obj_bunhandler,obj_tendrilhandler,obj_rothandler,obj_shihandler]
	
	for (var i = 0; i < array_length(entitylist); i++)
		if !instance_exists(entitylist[i])
			instance_create_depth(x,y,depth,entitylist[i])
	
}

function get_rooms_list(floors,part) {
	switch floors {
		case 0:
			switch part {
				case 0:
					global.importantroomslist = [rm_f1_intro,rm_elevator,rm_f1_p2_transition]

					global.saferoomslist = [rm_f1_safe1,rm_f1_safe2,rm_f1_safe3]

					global.basicroomslist = [rm_f1_basic,rm_f1_basic2,rm_f1_basic3,rm_f1_hallway,rm_f1_L];
			
					global.keyroomslist = [rm_f1_key1,rm_f1_key2,rm_f1_key3]
					
                break;
				
				case 1:
					global.importantroomslist = [rm_f1_intro,rm_elevator,rm_f1_p2_transition]

					global.saferoomslist = [rm_f1_p2_safe1,rm_f1_p2_safe2,rm_f1_p2_safe3]

					global.basicroomslist = [rm_f1_p2_basic,rm_f1_p2_basic2,rm_f1_p2_basic3];
			
					global.keyroomslist = [rm_f1_p2_key1,rm_f1_p2_key2]
					
                break;
			}
			
		break;
    
    
		case 1:
			switch part {
				case 0:
					global.importantroomslist = [rm_f2_intro,rm_elevator,rm_f2_transition]

					global.saferoomslist = [rm_f2_safe1,rm_f2_safe2]

					global.basicroomslist = [rm_f2_basic1,rm_f2_basic2,rm_f2_basic3,rm_f2_basic4]
			
					global.keyroomslist = [rm_f2_flower1,rm_f2_flower2,rm_f2_flower3]
					
                break;
				
				case 1:
					global.importantroomslist = [rm_f2_intro,rm_elevator,rm_f2_transition]

					global.saferoomslist = [rm_f1_p2_safe1,rm_f1_p2_safe2,rm_f1_p2_basic3]

					global.basicroomslist = [rm_f1_p2_basic,rm_f1_p2_basic2,rm_f1_p2_basic3]
			
					global.keyroomslist = [rm_f1_p2_key1,rm_f1_p2_key2]
					
                break;
			}
			
		break; 
	}
    
}

function generate_rooms() {
    
    reset_rooms()

	if global.floor = 0 {
		
		for (var j = 0; j < 2; j++) {
			
			var initial_list = tag_get_asset_ids("floor_industry", asset_room)
			var basic_room_list = []
			var key_room_list = []			

			for (var i = 0; i < array_length(initial_list); i++) {
				
				var room_id = initial_list[i]
				
				if asset_has_tags(room_id, $"floor_part_{j+1}",asset_room) && !asset_has_tags(room_id, "room_ignore",asset_room) {
					
					if !asset_has_tags(room_id, "room_key",asset_room) {
						array_push(basic_room_list, room_id)
					} else {
						array_push(key_room_list, room_id)
					}
				
				}
			}

			
			for (var i = 0 + (j*50); i < 50 * (j+1); i++) {
					
					var chancer = irandom(100)
			
					var typechancer = irandom(100)
			
					var room_struct =
					{
						room_asset : -4,
						dark : false
					}
			
			
					if (chancer >= 0 && chancer < 50)
						room_struct.room_asset = basic_room_list[irandom_range(0,array_length(basic_room_list)-1)]
					else if (chancer >= 50 && chancer <= 100)
						room_struct.room_asset = key_room_list[irandom_range(0,array_length(key_room_list)-1)]

					if typechancer > 40 {
						room_struct.dark = true
					}
					
					array_push(global.rooms,room_struct)
				}
			}
		
		global.rooms[0].dark = false
		global.rooms[50].dark = true
		global.rooms[99].dark = false
		global.rooms[0].room_asset = rm_f1_intro
		global.rooms[50].room_asset = rm_f1_p2_transition
		global.rooms[99].room_asset = rm_elevator
		
	}
	
	if global.floor = 1 {
		
			
		var initial_list = tag_get_asset_ids("floor_plateau", asset_room)
		var basic_room_list = []
		var key_room_list = []			

		for (var i = 0; i < array_length(initial_list); i++) {
				
			var room_id = initial_list[i]
				
			if !asset_has_tags(room_id, ["room_ignore"],asset_room) {
					
				if !asset_has_tags(room_id, ["room_key"],asset_room) {
					array_push(basic_room_list, room_id)
				} else {
					array_push(key_room_list, room_id)
				}
				
			}
		}

			
		for (var i = 0; i < 100; i++) {
					
				var chancer = irandom(100)
			
				var typechancer = irandom(100)
			
				var room_struct =
				{
					room_asset : -4,
					dark : false
				}
			
			
				if (chancer >= 0 && chancer < 50)
					room_struct.room_asset = basic_room_list[irandom_range(0,array_length(basic_room_list)-1)]
				else if (chancer >= 50 && chancer <= 100)
					room_struct.room_asset = key_room_list[irandom_range(0,array_length(key_room_list)-1)]

				if typechancer > 40 {
					room_struct.dark = true
				}
					
				array_push(global.rooms,room_struct)
			}
		
		global.rooms[0].dark = false
		global.rooms[50].dark = true
		global.rooms[99].dark = false
		global.rooms[0].room_asset = rm_f2_intro
		global.rooms[50].room_asset = rm_f2_transition
		global.rooms[99].room_asset = rm_elevator
		
	}
}