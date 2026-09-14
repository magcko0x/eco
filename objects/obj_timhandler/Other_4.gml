

chance = irandom_range(0,10)

if chance = 0 {
	TA = (irandom_range(10,100) div 10)
	
	repeat TA {
		
		var collist = tag_get_asset_ids("solid",asset_object)
		collist = array_concat(collist,tag_get_asset_ids("pickup",asset_object))
		spawn_across_area(obj_bloodcell,obj_spawnzone,collist)
		
	}
}
