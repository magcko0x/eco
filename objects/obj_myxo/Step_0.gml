setdepth()


if global.interact {
	
	state()
	
	if state = free {
		if audio_is_playing(chasesnd)
			audio_stop_sound(chasesnd)
		
		growltimer--
		
		if growltimer = 0 {
			growlsnd = audio_play_sound_at(snd_myxo_call, x, y, 0, 300, 600, 1, false, 0,1,0,random_range(0.7,1.5));
			growltimer = irandom_range(60,300)
		}
	}
	
	if state = aggressive {
		if audio_is_playing(growlsnd)
			audio_stop_sound(growlsnd)
		
		if !audio_is_playing(chasesnd)
			chasesnd = audio_play_sound_at(snd_myxo_chase, x, y, 0, 300, 600, 1, false, 0,1,0,random_range(0.1,1.5));
	}
	
	
	prevx = x
	prevy = y
	
} else path_end()
