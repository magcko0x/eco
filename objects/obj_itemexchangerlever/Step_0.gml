depth = owner.depth + 1

if image_index > 0 {
	deac = true
	
	if image_index = sprite_get_number(sprite_index) - 1 {
		reverse = true	
	}
	
	if !reverse {
		if image_index < sprite_get_number(sprite_index) - 1 {
			image_speed = 1	
		}
	} else {
		if image_index > 0 {
			image_speed = -1
		}		
	}
	
} else {
	image_speed = 0
	reverse = false
	deac = false	
}

if owner.cost <= global.credits && inventory_search(obj_playerhandler.playerinventory,-1) != -1{
	if global.interact && CLICKED && !deac {
		
		if inventory_add(obj_playerhandler.playerinventory,owner.itemarray[owner.selector][0])[0] {
			global.credits -= owner.cost
			audio_play_sound_at(snd_lever,x,y,0,100,200,1,false,0,0.5)
			image_index = 1
		}
	
	}
} else {
	deac = true	
}