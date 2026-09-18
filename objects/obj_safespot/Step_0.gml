var player = instance_nearest(x,y,obj_player)

var is_inside_now = place_meeting(x, y, player);

if (was_safe && !is_inside_now) {
	
	player.safe = false
	
}

if (!was_safe && is_inside_now) {
	
	player.safe = true
	
}

was_safe = is_inside_now;