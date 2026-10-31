//Room generation thingies
global.rooms = []

global.rooms = []

function reset_rooms() {
	global.rooms = []
}

function generate_rooms() {
    
	reset_rooms()

	if global.floor == "floor_industry" {
		
		global.nextfloor = "floor_floating_plateau"
		
		for (var j = 0; j < 2; j++) {
			
			var initial_list = tag_get_asset_ids("floor_industry", asset_room)
			var basic_room_list = []
			var key_room_list = []			

			for (var i = 0; i < array_length(initial_list); i++) {
				
				var room_id = initial_list[i]
				
				if asset_has_tags(room_id, $"floor_part_{j+1}", asset_room) && !asset_has_tags(room_id, "room_ignore", asset_room) {
					
					if !asset_has_tags(room_id, "room_key", asset_room) {
						array_push(basic_room_list, room_id)
					} else {
						array_push(key_room_list, room_id)
					}
				}
			}

			var loop_limit = j == 0 ? 50 : 51
			
			for (var i = 0; i < loop_limit; i++) {
					
				var chancer = irandom(100)
				var typechancer = irandom(100)
		
				var room_struct = {
					room_asset : -4,
					dark : false
				}
		
				if chancer >= 0 && chancer < 50
					room_struct.room_asset = basic_room_list[irandom_range(0, array_length(basic_room_list)-1)]
				else if chancer >= 50 && chancer <= 100
					room_struct.room_asset = key_room_list[irandom_range(0, array_length(key_room_list)-1)]

				if typechancer > 40 {
					room_struct.dark = true
				}
				
				array_push(global.rooms, room_struct)
			}
		}
		
		global.rooms[0].dark = false
		global.rooms[50].dark = true
		global.rooms[100].dark = false
		global.rooms[0].room_asset = rm_f1_intro
		global.rooms[50].room_asset = rm_f1_p2_transition
		global.rooms[100].room_asset = rm_elevator
	}
	
	if global.floor == "floor_floating_plateau" {
		
		global.nextfloor = "lobby"
		
		var shedline = false
		var shedlength = 0
		
		var outdoor_list = tag_get_asset_ids("floor_plateau", asset_room)
		var indoor_list = tag_get_asset_ids("floor_plat_indoors", asset_room)		
		
		for (var i = 0; i <= 100; i++) {
			
			var floor_list = shedline ? indoor_list : outdoor_list
			
			var initial_list = floor_list
			var basic_room_list = []
			var key_room_list = []			

			for (var j = 0; j < array_length(initial_list); j++) {
				
				var room_id = initial_list[j]
				
				if !asset_has_tags(room_id, ["room_ignore"], asset_room) {
					
					if !asset_has_tags(room_id, ["room_key"], asset_room) {
						array_push(basic_room_list, room_id)
					} else {
						array_push(key_room_list, room_id)
					}
				}
			}			
					
			var chancer = irandom(100)
			var typechancer = irandom(100)
			
			if array_length(key_room_list) = 0 chancer = 0
		
			var room_struct = {
				room_asset : -4,
				dark : false
			}
		
			if chancer >= 0 && chancer < 50
				room_struct.room_asset = basic_room_list[irandom_range(0, array_length(basic_room_list)-1)]
			else if chancer >= 50 && chancer <= 100
				room_struct.room_asset = key_room_list[irandom_range(0, array_length(key_room_list)-1)]
			
			
			var darkthreshold = shedline ? 20 : 40
			
			if typechancer > darkthreshold {
				room_struct.dark = true
			}
				
			array_push(global.rooms, room_struct)
			
			if !shedline {
				if irandom(15) = 0 {
					shedline = true
					shedlength = irandom_range(1,8)
				}
			} else {
				if shedlength <= 0 {
					shedline = false	
				}
				
				shedlength--
			}
			
		}
		
		global.rooms[0].dark = false
		global.rooms[50].dark = true
		global.rooms[100].dark = false
		global.rooms[0].room_asset = rm_f2_intro
		global.rooms[50].room_asset = rm_f2_transition
		global.rooms[100].room_asset = rm_elevator
	}
	
	if global.floor == "floor_backstage" {
		
		global.nextfloor = "floor_industry"
		
		generate_backstage_map(10, 10)
		
		for (var j = 0; j < array_length(global.backstage); j++) {
			for (var i = 0; i < array_length(global.backstage[j]); i++) {
				
				var room_struct = {
					room_asset : global.backstage[j][i],
					dark : global.backstagedata[j][i].darkroom
				}
				
				array_push(global.rooms, room_struct)
			}
		}
		
		global.rooms[0].room_asset = rm_backstage_basic_intro
		global.rooms[0].dark = false
	}
}

function createselectionpool(width, height) {
	var selection_pool = []
	
	for (var j = 0; j < height; j++) {
		for (var i = 0; i < width; i++) {
			array_push(selection_pool, [i, j])
		}
	}
	
	return selection_pool
}

function generate_backstage_map(width, height) {
	var roomslist = [rm_backstage_basic, rm_backstage_basic_2]
	var mapgrid = array_create(height)
	var datamapgrid = array_create(height)
	
	for (var j = 0; j < height; j++) {
		mapgrid[j] = array_create(width)
		datamapgrid[j] = array_create(width)
		
		for (var i = 0; i < width; i++) {
			mapgrid[j][i] = roomslist[irandom(array_length(roomslist) - 1)]
			
			datamapgrid[j][i] = {
				islinked : false,
				haslink : false,
				linkedcoords : [-1, -1],
				darkroom : false
			}
		}
	}
	
	var selection_pool = createselectionpool(width, height)
	selection_pool = array_shuffle(selection_pool)
	
	var darkroom_count = min(30, array_length(selection_pool))
	
	for (var i = 0; i < darkroom_count; i++) {
		var current_coord = array_pop(selection_pool)
		var target_x = current_coord[0]
		var target_y = current_coord[1]
		
		datamapgrid[target_y][target_x].darkroom = true
	}
	
	selection_pool = createselectionpool(width, height)
	selection_pool = array_shuffle(selection_pool)
	
	var link_count = min(10, array_length(selection_pool) div 2)
	
	for (var i = 0; i < link_count; i++) {
		var current_coord = array_pop(selection_pool)
		var target_x = current_coord[0]
		var target_y = current_coord[1]
		
		var end_coord = array_pop(selection_pool)
		var end_x = end_coord[0]
		var end_y = end_coord[1]
		
		datamapgrid[target_y][target_x].haslink = true
		datamapgrid[end_y][end_x].haslink = true
		
		datamapgrid[target_y][target_x].linkedcoords = [end_x, end_y]
		datamapgrid[end_y][end_x].linkedcoords = [target_x, target_y]
	}
	
	var middle_col = width div 2
	var middle_row = height div 2
	
	mapgrid[middle_row][middle_col] = rm_backstage_basic_intro
	
	global.backstagex = middle_col
	global.backstagey = middle_row
	global.backstage = mapgrid
	global.backstagedata = datamapgrid
}