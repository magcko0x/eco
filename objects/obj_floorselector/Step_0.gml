if CLICKED {
	
	if instance_exists(obj_floorselector_head) {
		if mode = 0 {
			if obj_floorselector_head.index + 1 <= array_length(obj_floorselector_head.available_floors) - 1 {
				audio_play_sound_at(snd_pickup,x,y,0,100,200,1,false,0,0.5,0,2)
				image_index = 1
				obj_floorselector_head.index++
			} 
		} else {
			if obj_floorselector_head.index - 1 >= 0 {
				audio_play_sound_at(snd_pickup,x,y,0,100,200,1,false,0,0.5,0,2)
				image_index = 1
				obj_floorselector_head.index--
			}
		}
	}
} else image_index = 0