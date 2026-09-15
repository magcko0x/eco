if locked {
	if !instance_exists(obj_key) {
		var collist = array_concat(tag_get_asset_ids("solid", asset_object), tag_get_asset_ids("pickup", asset_object))
		
		var mykey = spawn_across_area(obj_key, obj_spawnzone, collist)
		
		if mykey == -1 {
			locked = false
		}
	}
}