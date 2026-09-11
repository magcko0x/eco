if irandom(5) = 0 && instance_number(obj_bloodcell) < 50 && sprite_index != spr_bloodcellspit{
	image_index = 0
	sprite_index = spr_bloodcellspit
	instance_create_depth(x,y,depth,obj_bloodball)
}

if sprite_index = spr_bloodcellspit {
	if alarm[1] = -1 alarm[1] = 20	
}