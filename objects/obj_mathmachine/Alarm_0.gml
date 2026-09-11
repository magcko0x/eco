if hole != noone {
	
	var operation = expression.addition ? 1 : -1
	
	if hole.ballnumber = expression.value_1 + expression.value_2 * operation {
		audio_play_sound(snd_correct_ding,0,false,1,0,random_range(0.7,1.2))
		state = 2
	} else {
		audio_play_sound(snd_wrong_buzzer,0,false,1,0,random_range(0.7,1.2))
		state = 0
		var ball = instance_create_depth(x,y + 48,depth,obj_ball)
		ball.image_index = hole.ballnumber
		ball.yspd = 4
		part_particles_burst(psystem,ball.x,ball.y,part_drool)
		
		part_system_depth(psystem,ball.depth - 1)
	
		audio_play_sound(snd_swap,0,false,1,0,random_range(0.7,1.2))		
		hole.closed = false	
	}
	
}