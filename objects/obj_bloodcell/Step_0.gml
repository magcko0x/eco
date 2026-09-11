setdepth()

if global.interact {
	if CLICKED {
		audio_play_sound(snd_punch,0,false,1,0,random_range(0.7,1.2))
		instance_destroy()
	}	
}