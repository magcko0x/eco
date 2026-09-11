if CLICKED && !on{
	global.floor = floor(global.floor + 1)
	global.part = 0
	image_index = 1
	cursor = 0
	obj_elevatoranim.state = "start"
	audio_play_sound_at(snd_lever,x,y,0,200,300,1,false,0)
	on = true
	deac = true
    
	create_save()
	
	var _buffer = buffer_load("save.sav");
	var _result = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer)
	
	var savestruct = json_parse(_result)
    
	var prevmaxfloor = savestruct.maxfloor
    
	if global.floor > prevmaxfloor{
	    global.maxfloor = global.floor
	}
	
	if global.maxfloor > global.ultmaxfloor {
		global.maxfloor = global.ultmaxfloor	
	}
    
	custom_save()
    
}