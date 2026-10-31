depth = owner.depth - 1

hover = instance_exists(obj_hand) && obj_hand.selectedobj = id && obj_hand.state = obj_hand.free

if global.interact && CLICKED {
	
	if obj_playerhandler.playerinventory[obj_inventory.pos] != -1 {
		solditem = obj_playerhandler.playerinventory[obj_inventory.pos]

		add_credits(solditem.cost)
		
		audio_play_sound_at(snd_pickup,x,y,0,100,200,1,false,0,0.5,0,2)
		obj_playerhandler.playerinventory[obj_inventory.pos] = -1
	}
	
}

deac = obj_playerhandler.playerinventory[obj_inventory.pos] == -1

if hover && obj_playerhandler.playerinventory[obj_inventory.pos] != -1{
	if (image_index < sprite_get_number(sprite_index) - 1) {
		image_speed = 1
	} else {
		image_speed = 0	
	}
} else {
	if (image_index > 0) {
		image_speed = -1
	} else {
		image_speed = 0	
	}
}