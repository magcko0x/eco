

chance = irandom_range(0,7)


myhoppers = -1

if chance = 0 {
	TA = (irandom_range(10,50) div 10)
	
	repeat TA {
		var collist = tag_get_asset_ids("solid",asset_object)
		collist = array_concat(collist,tag_get_asset_ids("pickup",asset_object))
		collist = array_concat(
			collist,			
			[
				obj_tendril,
				obj_door
			]
		)
		spawn_across_area(obj_hopper,obj_spawnzone,collist)		
	}
}
