var calculated_distance = -1;
is_near = false;

if (global.interact) {
	var old_x = backstagex;
	var old_y = backstagey;
	var next_step;
	
	if (wandering) {
		if (wanderingcounter > 0 || (global.backstagex == backstagex && global.backstagey == backstagey)) {
			wanderingcounter--;	
		} else {
			wandering = false;
			wanderingcounter = irandom_range(10, 60);
		}
	}
	
	if (!wandering) {
		if !distracted {
			next_step = grid_get_next_step(backstagex, backstagey, global.backstagex, global.backstagey);
		} else {
			
			if backstagex == distractedx && backstagey == distractedy {
				distracted = false	
			}
			
			next_step = grid_get_next_step(backstagex, backstagey, distractedx, distractedy);
		}
	} else {
		var max_grid_x = array_length(global.backstage[0]) - 1;
		var max_grid_y = array_length(global.backstage) - 1;
		
		var random_target_x = clamp(backstagex + irandom_range(-1, 1), 0, max_grid_x);
		var random_target_y = clamp(backstagey + irandom_range(-1, 1), 0, max_grid_y);
		
		next_step = grid_get_next_step(backstagex, backstagey, random_target_x, random_target_y);
	}
	
	var target_x = next_step[0];
	var target_y = next_step[1];
	calculated_distance = next_step[2];
	
	dist = calculated_distance;
	
	if (target_x != -1 && target_y != -1) {
		if (target_x != backstagex || target_y != backstagey) {
			var diff_x = target_x - backstagex;
			var diff_y = target_y - backstagey;
	
			if (diff_x == 1 || diff_x < -1)       { entry_dir = "left"; }
			else if (diff_x == -1 || diff_x > 1) { entry_dir = "right"; }
			else if (diff_y == 1 || diff_y < -1)  { entry_dir = "top"; }
			else if (diff_y == -1 || diff_y > 1) { entry_dir = "bottom"; }
		}		
		
		backstagex = target_x;
		backstagey = target_y;
	
		if (backstagex == global.backstagex && backstagey == global.backstagey) {
			if (!instance_exists(obj_unborn)) {
				var pad = 128; 
				
				if (!variable_instance_exists(id, "entry_dir")) {
					entry_dir = "left";
				}
				
				var spawn_x = -pad;
				var spawn_y = room_height / 2;
			
				switch (entry_dir) {
					case "left":
						spawn_x = -pad;
						spawn_y = room_height / 2;
						break;
					case "right":
						spawn_x = room_width + pad;
						spawn_y = room_height / 2;
						break;
					case "top":
						spawn_x = room_width / 2;
						spawn_y = -pad;
						break;
					case "bottom":
						spawn_x = room_width / 2;
						spawn_y = room_height + pad;
						break;
				}
			
				instance_create_depth(spawn_x, spawn_y, depth, obj_unborn);
			}
		} else {
			if (instance_exists(obj_unborn)) {
				instance_destroy(obj_unborn);
			}
		}
	}
}

var grid_height = array_length(global.backstage);
var grid_width  = array_length(global.backstage[0]);

if (calculated_distance != -1) {
	alarm[0] = clamp(( max(grid_height, grid_width) * 2 ) - point_distance(backstagex,backstagey,global.backstagex,global.backstagey), 60, 99999);
} else {
	alarm[0] = 60; 
}