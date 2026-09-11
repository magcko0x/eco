if global.interact {
	mylight.x = x
	mylight.y = y	
	
	if (CLICKED || RANINTO) {
		
		audio_play_sound_at(snd_pickup,x,y,0,100,200,1,false,0)
		
		if obj_playerhandler.key {
			tempblend = obj_playerhandler.keycolor	
		}
		
		obj_playerhandler.keycolor = image_blend
        obj_inventory.keyshake_strength = 4
		
		if !obj_playerhandler.key {
			instance_destroy()
		} else {
			image_blend = tempblend	
		}
		
		obj_playerhandler.key = true
	}
}