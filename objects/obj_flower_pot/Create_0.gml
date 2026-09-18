image_speed = 0

watered = false
prevwatered = watered
growingitem = false
growitemlist = [
		[obj_credit,65],
		[obj_itempickup,50],
		[obj_syringe,25],
]

itemgrown = weighted_random(growitemlist)

growingitemid = -1

itemgrowing = noone

if itemgrown == obj_itempickup {
	
	var item_list = []
	
	array_copy(item_list,0,get_item_loot_table(),1,array_length(get_item_loot_table()))
	
	growingitemid = weighted_random(item_list)
}