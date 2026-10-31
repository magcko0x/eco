chance = irandom_range(0,15)

if chance = 0 {
	TA = (irandom_range(2,16))
	
	var collist = tag_get_asset_ids("solid",asset_object)
	collist = array_concat(collist,tag_get_asset_ids("pickup",asset_object))
	array_push(collist,obj_tumbler)	
	
	repeat TA {
		spawn_across_area(obj_tumbler,obj_spawnzone,collist)
	}
}
