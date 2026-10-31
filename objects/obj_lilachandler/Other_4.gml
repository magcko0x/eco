if room != rm_death {

	chance = irandom_range(0,10)
    	
	if room_width > 480 && room_height > 320 {
		if chance = 0 {

				var collist = tag_get_asset_ids("solid",asset_object)
				collist = array_concat(collist,tag_get_asset_ids("pickup",asset_object))
				spawn_across_area(obj_lilac,obj_spawnzone,collist)
		}
	}
	
}
