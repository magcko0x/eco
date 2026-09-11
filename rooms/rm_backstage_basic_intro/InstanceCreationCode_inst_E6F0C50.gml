enID = 3
target_rm = rm_lobby_start

transitioncode = function() {
	global.backstagex = 0
	global.backstagey = 0
	global.inbackstage = false
	
	var entities = tag_get_asset_ids("handler",asset_object)
	
	for (var i = 0; i < array_length(entities);i++)
		instance_destroy(entities[i])
	
	instance_destroy(obj_entityhandler)	
	instance_destroy(obj_roomhandler)
}