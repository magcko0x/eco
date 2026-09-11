map = global.backstage

var grid_height = array_length(global.backstage);
var grid_width  = array_length(global.backstage[0]);

backstagex = choose(0,grid_width - 1)
backstagey = choose(0,grid_height - 1)

bannedtiles = ds_grid_create(grid_width, grid_height)

for (var j = 0; j < ds_grid_height(bannedtiles); j++) {
	for (var i = 0; i < ds_grid_width(bannedtiles); i++) {
		bannedtiles[# i, j] = false	
	}
}

dist = 0
wandering = true
wanderingcounter = irandom_range(10,60)
visual_darkness = 0

function grid_create_distance_map(target_x, target_y) {
	var grid_height = array_length(global.backstage);
	var grid_width  = array_length(global.backstage[0]);
	
	var distance_map = ds_grid_create(grid_width, grid_height);
	ds_grid_clear(distance_map, -1);
	
	if (!is_array(global.backstage) || array_length(global.backstage) == 0) return distance_map;
	if (bannedtiles[# target_x, target_y]) return distance_map;
	
	var visited = ds_grid_create(grid_width, grid_height);
	ds_grid_clear(visited, false);
	
	var queue = ds_queue_create();
	
	ds_queue_enqueue(queue, (target_y * grid_width) + target_x);
	visited[# target_x, target_y] = true;
	distance_map[# target_x, target_y] = 0;
	
	var dir_x = [0,  0, -1, 1];
	var dir_y = [-1, 1,  0, 0];
	
	while (!ds_queue_empty(queue)) {
		var current_node = ds_queue_dequeue(queue);
		var curr_x = current_node % grid_width;
		var curr_y = current_node div grid_width;
		var curr_dist = distance_map[# curr_x, curr_y];
		
		for (var i = 0; i < 4; i++) {
			var check_x = curr_x + dir_x[i];
			var check_y = curr_y + dir_y[i];
			
			if (check_x < 0) check_x = grid_width - 1;
			else if (check_x >= grid_width) check_x = 0;
			
			if (check_y < 0) check_y = grid_height - 1;
			else if (check_y >= grid_height) check_y = 0;
			
			if (!visited[# check_x, check_y] && global.backstage[check_y][check_x] != noone && !bannedtiles[# check_x, check_y]) {
				visited[# check_x, check_y] = true;
				distance_map[# check_x, check_y] = curr_dist + 1;
				ds_queue_enqueue(queue, (check_y * grid_width) + check_x);
			}
		}
	}
	
	ds_queue_destroy(queue);
	ds_grid_destroy(visited);
	
	return distance_map;
}

function grid_get_next_step(start_x, start_y,end_x,end_y) {
	if (!is_array(global.backstage) || array_length(global.backstage) == 0) return [-1, -1, -1];
	
	var grid_height = array_length(global.backstage);
	var grid_width  = array_length(global.backstage[0]);
	
	if (bannedtiles[# end_x, end_y]) {
		var attempts = 0;
		while (attempts < 30) {
			var rand_x = irandom(grid_width - 1);
			var rand_y = irandom(grid_height - 1);
			if (global.backstage[rand_y][rand_x] != noone && !bannedtiles[# rand_x, rand_y]) {
				end_x = rand_x; end_y = rand_y;
				break;
			}
			attempts++;
		}
		if (attempts >= 30) return [start_x, start_y, -1];
	}
	
	if (start_x == end_x && start_y == end_y) return [start_x, start_y, 0];

	var dist_map = grid_create_distance_map(end_x, end_y);

	var current_distance_to_target = dist_map[# start_x, start_y];
	
	if (current_distance_to_target == -1) {
		ds_grid_destroy(dist_map);
		
		var wander_attempts = 0;
		while (wander_attempts < 20) {
			var rx = start_x + irandom_range(-3, 3);
			var ry = start_y + irandom_range(-3, 3);
			if (rx < 0) rx = grid_width - 1; else if (rx >= grid_width) rx = 0;
			if (ry < 0) ry = grid_height - 1; else if (ry >= grid_height) ry = 0;
			
			if (global.backstage[ry][rx] != noone && !bannedtiles[# rx, ry]) {
				return [rx, ry, -1];
			}
			wander_attempts++;
		}
		return [start_x, start_y, -1];
	}
	
	var best_x = start_x;
	var best_y = start_y;
	var lowest_distance = 999999;
	
	var dir_x = [0,  0, -1, 1];
	var dir_y = [-1, 1,  0, 0];
	
	for (var i = 0; i < 4; i++) {
		var check_x = start_x + dir_x[i];
		var check_y = start_y + dir_y[i];
		
		if (check_x < 0) check_x = grid_width - 1;
		else if (check_x >= grid_width) check_x = 0;
		
		if (check_y < 0) check_y = grid_height - 1;
		else if (check_y >= grid_height) check_y = 0;
		
		var tile_dist = dist_map[# check_x, check_y];
		if (tile_dist != -1 && tile_dist < lowest_distance) {
			lowest_distance = tile_dist;
			best_x = check_x;
			best_y = check_y;
		}
	}
	
	ds_grid_destroy(dist_map);
	
	return [best_x, best_y, current_distance_to_target];
}

is_near = false

search_x = 1; search_y = 1;

distracted = false

distractedx = 0; distractedy = 0;

alarm[0] = 1;