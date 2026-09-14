mytendrils = -1
TA = 0
chance = 0
collist = tag_get_asset_ids("solid",asset_object)
collist = array_concat(collist,tag_get_asset_ids("pickup",asset_object))
collist = array_concat(
	collist,			
	[
		obj_tendril,
		obj_door
	]
)