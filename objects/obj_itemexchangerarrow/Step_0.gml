depth = owner.depth - 1

if global.interact && CLICKED {
	
	audio_play_sound_at(snd_pickup,x,y,0,100,200,1,false,0,0.5,0,2)
	
	if image_xscale > 0 {
		with owner {
			if selector + 1 > array_length(itemarray) - 1
				selector = -1

			selector += 1
		}
	} else {
		with owner {
			if selector - 1 < 0 
				selector = array_length(itemarray)

			selector -= 1
		}		
	}
}