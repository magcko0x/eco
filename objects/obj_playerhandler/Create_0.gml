key = false

playerinventory = array_create(INVENTORY_SLOTS,-1)

/*
randomize()
global.playerhead = irandom_range(0,(sprite_get_number(spr_playerhead)/2)-1)
global.playerbody = irandom_range(0,(sprite_get_number(spr_playerbody)/2)-1)
global.playerpants = irandom_range(0,(sprite_get_number(spr_playerpants)/4)-1)
*/


with obj_player {
	head = global.playerhead
	body = global.playerbody
	pants = global.playerpants

	getpartids(head,body,pants)
	
	runspd = basespd + 4
}

if !instance_exists(obj_inventory)
	instance_create_depth(x,y,depth,obj_inventory)

if !instance_exists(!obj_effect_drawer)
	instance_create_depth(x,y,depth,obj_effect_drawer)