setdepth()

if inputobj != noone {
	if variable_instance_exists(inputobj,"charge") {
		charge = inputobj.charge	
	}
}

if outputobj != noone {
	outputobj.charge = charge	
}

if charge = 3 {
	if !audio_is_playing(powersound)
		powersound = audio_play_sound_at(snd_buzz,x,y,0,100,200,1,false,0,2,0,random_range(0.97,1))
}