if global.interact {
	
	if (CLICKED || RANINTO) {
		
		global.credits += amount
		
		audio_play_sound_at(snd_credit,x,y,0,100,200,1,false,0)
		
		instance_destroy()
		
	}
}