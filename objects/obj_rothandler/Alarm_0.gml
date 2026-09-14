if !instance_exists(obj_syringe) {
	var collist = tag_get_asset_ids("solid",asset_object)
	collist = array_concat(collist,tag_get_asset_ids("pickup",asset_object))
	spawn_across_area(obj_syringe,obj_spawnzone,collist)
}
roomcount = irandom_range(5,7 + clamp(floor(obj_rottimer.timer / 36),0,7))