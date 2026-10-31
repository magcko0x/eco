timer = 0

get_current_part_frame = function(sprite) {
	
	var total_steps = floor((current_time / 1000) * sprite_get_speed(sprite))
	return total_steps % sprite_get_number(sprite)
}

xdir = -1
ydir = 1

moving = false