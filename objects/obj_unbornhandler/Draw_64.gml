if debug_mode {
	var grid_height = array_length(global.backstage);
	var grid_width  = array_length(global.backstage[0]);

	var box_size = clamp(100/max(grid_height,grid_width),1,10);
	var box_gap = 0;
	var total_step = box_size + box_gap;

	var map_start_x = 960 - (grid_width * total_step);
	var map_start_y = 0;

	for (var j = 0; j < grid_height; j++) {
		for (var i = 0; i < grid_width; i++) {

			var draw_x1 = map_start_x + (i * total_step);
			var draw_y1 = map_start_y + (j * total_step);
			var draw_x2 = draw_x1 + box_size;
			var draw_y2 = draw_y1 + box_size;
		
			var c;
		
			if (global.backstage[j][i] == rm_backstage_basic_intro) {
				c = c_lime;
			} 
			else {
				if !bannedtiles[# i,j] {
					c = c_gray;
				} else {
					c = c_black    
				}
			}
		
			
			if(global.backstagedata[j][i].haslink) {
				c = c_purple	
			}
		
		
			if (i == global.backstagex && j == global.backstagey) {
				c = c_white;
			}
		
			if (i == backstagex && j == backstagey) {
				c = c_red    
			}
			
			draw_rectangle_colour(draw_x1, draw_y1, draw_x2, draw_y2, c, c, c, c, false);
		}
	}
}

var target_proximity = 0;

if (!wandering && dist != -1 && !bannedtiles[# global.backstagex, global.backstagey]) {
	var current_dist = point_distance(backstagex, backstagey, global.backstagex, global.backstagey);
	target_proximity = 1 - (clamp(current_dist, 0, 10) / 10); 
} 

visual_darkness = lerp(visual_darkness, target_proximity, 0.05);

if keyboard_check(vk_f1) visual_darkness = 1

if (visual_darkness > 0.001) {
	gpu_set_blendmode(bm_normal);	

	var scroll_speed_x = 0.01;
	var scroll_speed_y = 0.01;
	
	var sizex,sizey
	
	sizex = 3 + sin(current_time / 1000 ) * 0.1
	sizey = 3 - sin(current_time / 1000 ) * 0.2
	
	var tex_width  = sprite_get_width(spr_vesseloverlay) * sizex;
	var tex_height = sprite_get_height(spr_vesseloverlay) * sizey;
	
	var offset_x = (current_time * scroll_speed_x) % tex_width;
	var offset_y = (current_time * scroll_speed_y) % tex_height;

	var max_darkness_color = make_color_rgb(140, 140, 140); 
	var blend_color = merge_color(c_white, max_darkness_color, visual_darkness);
	var final_alpha = visual_darkness * 0.4; 

	draw_sprite_tiled_ext(spr_vesseloverlay, 0, offset_x, offset_y,sizex,sizey, blend_color, final_alpha);
}