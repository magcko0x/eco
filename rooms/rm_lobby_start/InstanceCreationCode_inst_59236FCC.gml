if global.maxfloor < 1 {
	locked = true
}

if global.backstage != -1{
	var grid_height = array_length(global.backstage);
	var grid_width = array_length(global.backstage[0]);

	var middle_col = grid_width div 2
	var middle_row = grid_height div 2
	
	transitionspeed = 120

	target_rm = global.backstage[middle_row,middle_col]
	enID = 4
	transitioncode = function () {
		
		var handlers = [
			obj_entityhandler,
			obj_roomhandler
		]
		
		for (var i = 0; i < array_length(handlers); i++) {
			instance_create_depth(x,y,depth,handlers[i])
		}
				
		var grid_height = array_length(global.backstage);
		var grid_width = array_length(global.backstage[0]);

		var middle_col = grid_width div 2
		var middle_row = grid_height div 2	
	
		global.backstagex = middle_col
		global.backstagey = middle_row
		
		global.inbackstage = true
	}
}