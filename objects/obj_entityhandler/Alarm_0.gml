if ( room = rm_elevator || global.currentroom = -1 || room = rm_death ) {
	
	var entities = tag_get_asset_ids("handler",asset_object)
	
	for (var i = 0; i < array_length(entities);i++)
		instance_destroy(entities[i])
}