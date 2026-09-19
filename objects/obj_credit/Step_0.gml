if global.interact {
	
	deac = global.credits >= 999
	
	if (CLICKED || RANINTO) && !deac{
		
		global.credits += amount
		
		audio_play_sound_at(snd_credit,x,y,0,100,200,1,false,0)
		
		instance_destroy()
		
	}
}