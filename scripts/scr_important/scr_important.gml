//macro
#macro DOWN 0
#macro LEFT 1
#macro RIGHT 2
#macro UP 3
#macro SUBGRID 8
#macro CLICKED (instance_exists(obj_hand) && obj_hand.selectedobj = id && mouse_check_button_pressed(mb_left) && obj_hand.state = obj_hand.free && obj_hand.active)
#macro DRAGGED (instance_exists(obj_hand) && obj_hand.selectedobj = id && mouse_check_button(mb_left) && obj_hand.state = obj_hand.free && (obj_hand.grabbedobj = noone || obj_hand.grabbedobj = id))
#macro RELEASED (mouse_check_button_released(mb_left) && obj_hand.prevgrabbedobj = id)
#macro RANINTO (point_distance(obj_player.x,obj_player.y,x,y) <= 20 && obj_player.spd >= 10 && obj_player.moving)
#macro VIEW_H view_hport[0]
#macro VIEW_W view_wport[0]

//settings n stuff
global.interact = true
global.killed_enemies = []

// other stuff
function setdepth() {
	depth = clamp(-(y - sprite_yoffset + sprite_height),-10000,5000)
}

function draw_outline(sprite,index,outline_thickness,outline_color,_x = x, _y = y,angle = image_angle) {
	gpu_set_fog(true,outline_color,0,0)
	draw_sprite_ext(sprite, index, _x - outline_thickness, _y, image_xscale, image_yscale, angle, c_white, 1);
	draw_sprite_ext(sprite, index, _x + outline_thickness, _y, image_xscale, image_yscale, angle, c_white, 1);
	draw_sprite_ext(sprite, index, _x, _y - outline_thickness, image_xscale, image_yscale, angle, c_white, 1);
	draw_sprite_ext(sprite, index, _x, _y + outline_thickness, image_xscale, image_yscale, angle, c_white, 1);
	gpu_set_fog(false,c_white,0,0)
}

function draw_selected (spr = sprite_index,index = image_index,_x = x,_y = y) {
	if instance_exists(obj_hand) && obj_hand.selectedobj = id && obj_hand.state = obj_hand.free {
		draw_outline(spr,index,1,c_white,_x,_y)	
	}
}


function sfx_dist(snd, xx, yy, gain = 1, offset = 0, pitch = 1) {
	if (!audio_exists(snd)) return -1;
    
	// 1. Play the sound at a specific 3D position
	// Arguments: index, x, y, z, falloff_start, falloff_max, falloff_factor, loop, priority
	
	snd = audio_sound_get_asset(snd)
	var n = audio_play_sound_at(snd, xx, yy, 0, 50, 300, 1, false, 80);
    
	// 2. Apply instance-specific gain, offset, and pitch to just THIS playing sound instance
	audio_sound_gain(n, gain, 0);
	audio_sound_set_track_position(n, offset);
	audio_sound_pitch(n, pitch);
    
	return n; 
}


function flicker(flicker_speed = 1) {
	if !variable_instance_exists(id, "flicker_timer")
		flicker_timer = 0;
	
	var flickering
	
	flicker_timer += 0.25
	
	if (flicker_timer >= flicker_speed * 2)
		{
			flicker_timer = 0;
		}

	if (flicker_timer < flicker_speed)
		{
			flickering = 1
		}
	else
		{
			flickering = 0
	}
	
	return flickering
}

//RNG
function get_total_weight(chance_array) {
	var total = 0;
	
	for (var i = 0; i < array_length(chance_array); i++) {
		total += chance_array[i][1];
	}
	
	return total;
}

function weighted_random(chance_array) {
	var total_weight = get_total_weight(chance_array)
	
	var roll = irandom_range(1, total_weight); // Roll a random number
	var weight_sum = 0;

    // Iterate through the items, subtracting their weight from the roll
	for (var i = 0; i < array_length(chance_array); i++) {
		weight_sum += chance_array[i][1];

        // If the roll falls within the current item's range, that's the chosen item
		if (roll <= weight_sum) {
			return chance_array[i][0]; // Return the item's name (or index, etc.)
		}
	}
}