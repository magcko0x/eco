randomize()

timer_default = 20 * 60;
timer_still_here = 120;
bun_spawn_chance = 10;


bun_spawn_active = false;
room_replaced = false;
bun_spawn_timer = timer_default;
bun_amount = 1;
bun_instance = noone;
bun_gone = false;
still_here = false;
room_block = false;
timer_multiplier = 1;
bun_active = false

bunreset = function() {
	// Spawning State
	bun_spawn_active = false;
	bun_active       = false;
	bun_gone         = false;
	still_here       = false;

	// Logic & Timers
	bun_spawn_timer  = 20 * 60;      // Default cooldown
	timer_multiplier = 1;
	bun_amount       = irandom_range(1, 3);
	room_block       = false;
	room_replaced    = false;

	// References
	bun_instance     = noone;
	player_obj       = noone; 

	// Safety
	safe             = false;

	// Stop any looping sounds just in case
	audio_stop_sound(snd_bunambience);
}

player_obj = noone;