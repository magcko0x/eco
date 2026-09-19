if CLICKED && !on {
	
	if !array_contains(global.unlockedfloors, global.nextfloor) {
		array_push(global.unlockedfloors,global.nextfloor)
	}
	
	if !array_contains(global.beatenfloors, global.floor) {
		array_push(global.beatenfloors,global.floor)
	}	
	
	global.floor = global.nextfloor
	image_index = 1
	cursor = 0
	obj_elevatoranim.state = "start"
	audio_play_sound_at(snd_lever,x,y,0,200,300,1,false,0)
	on = true
	deac = true
    
	custom_save()
    
}