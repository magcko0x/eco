var player = instance_nearest(x,y,obj_player)

var is_inside_now = place_meeting(x, y, player);

if (was_safe && !is_inside_now) {
	
	show_debug_message("OBJECT JUST LEFT THE AREA!");
	
	player.safe = false
	
	show_debug_message($"PLAYER SAFE: {player.safe}");
	
}

if (!was_safe && is_inside_now) {
	
	show_debug_message("OBJECT JUST ENTERED THE AREA!");
	
	player.safe = true
	
	show_debug_message($"PLAYER SAFE: {player.safe}");
	
}

was_safe = is_inside_now;