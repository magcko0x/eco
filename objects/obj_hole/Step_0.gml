var ball = instance_place(x,y,obj_ball)

if ball != noone && !closed{
	
	closed = true
	
	part_particles_burst(psystem,x,y,part_dirt)
		
	part_system_depth(psystem,depth)
	
	audio_play_sound_at(snd_swap,x,y,0,300,600,1,false,0,2,0,random_range(0.5,1))
	
	ballnumber = ball.image_index
	
	charge = 3
	instance_destroy(ball)
}

if closed {
	if (image_index < sprite_get_number(sprite_index) - 1) {
		image_speed = 1
	} else {
		image_speed = 0	
	}
} else {
	if (image_index > 0) {
		image_speed = -1
	} else {
		image_speed = 0	
	}
}